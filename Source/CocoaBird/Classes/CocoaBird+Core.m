//
//  CocoaBird.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Core.h"
#import "CocoaBirdSettings.h"

#import "ASIHTTPRequest+OAuth.h"
#import "JSON.h"
#import "ASIFormDataRequest.h"
#import "CBRequestData.h"


@implementation CocoaBird (Core)

#pragma Request API Helpers

static NSMutableArray* _currentRequests = NULL;
+ (NSMutableArray*) currentRequests
{
    @synchronized(self)
    {
        if(_currentRequests == NULL)
            _currentRequests = [[NSMutableArray alloc] init];
    }
    return _currentRequests;
}

static SBJSON* _serializer = NULL;
+ (SBJSON*) serializer
{
    @synchronized(self)
    {
        if(_serializer == NULL)
            _serializer = [[SBJSON alloc] init];
    }
    return _serializer;
}

+ (CBRequestData*) getRequestDataAndRemove:(ASIHTTPRequest*)request
{
    NSMutableArray* currentRequests = [self currentRequests];
    for(int i=0; i<[currentRequests count]; i++)
    {
        CBRequestData* requestData = [currentRequests objectAtIndex:i];
        if(requestData.request == request)
        {
            [[requestData retain] autorelease];
            [currentRequests removeObjectAtIndex:i];
            return requestData;
        }
    }
    return nil;
}

+ (CBRequestData*) getRequestDataAndRemoveById:(NSString*)requestId
{
    NSMutableArray* currentRequests = [self currentRequests];
    for(int i=0; i<[currentRequests count]; i++)
    {
        CBRequestData* requestData = [currentRequests objectAtIndex:i];
        if([requestData.id isEqualToString:requestId])
        {
            [[requestData retain] autorelease];
            [currentRequests removeObjectAtIndex:i];
            return requestData;
        }
    }
    return nil;
}

+ (NSString *) getGuid
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return [(NSString *)string autorelease];
}

static NSString *urlEncode(id object) {
    NSString *string = [NSString stringWithFormat: @"%@", object];
    return [string stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
}

+ (NSString*) appendQueryString:(NSDictionary*)params toUrl:(NSString*)oldUrl
{
    if([params count] == 0)
        return oldUrl;
    
    NSMutableString* url = [NSMutableString stringWithString:oldUrl];
    if([url rangeOfString:@"?"].length > 0){
        [url appendString:@"&"];
    }else{
        [url appendString:@"?"];
    }
    
    NSMutableArray* qsParts = [NSMutableArray array];
    for(NSString* key in params)
    {
        id value = [params objectForKey:key];
        NSString* part = [NSString stringWithFormat: @"%@=%@", urlEncode(key), urlEncode(value)];
        [qsParts addObject: part];
    }
    [url appendString:[qsParts componentsJoinedByString:@"&"]];
    return url;
}

+ (ASIFormDataRequest*) buildRequest:(NSString*)url method:(NSString*)method params:(CBQueryParams*)params
{
    NSDictionary* paramsDic = [params toDictionary];
    
    if([method isEqualToString:@"GET"]){
        url = [self appendQueryString:paramsDic toUrl:url];
        return [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    }else{
        ASIFormDataRequest* request = [ASIFormDataRequest 
                                       requestWithURL:[NSURL URLWithString:url]
                                       consumerKey:@"1234" //not_needed? [CocoaBirdSettings oAuthConsumerKey]
                                       consumerSecret:@"1234" //not_needed? [CocoaBirdSettings oAuthConsumerSecret]
                                       token:[CocoaBirdSettings oAuthToken]
                                       tokenSecret: [CocoaBirdSettings oAuthTokenSecret]];
        for(NSString* key in paramsDic){
            [request addPostValue:[paramsDic objectForKey:key] forKey:key];
        }
        return request;   
    }
}



+ (id) processResponse:(NSString*)response type:(CBTwitterResponseType)type class:(Class)cls error:(NSError**)error
{    
    if(type == CBTwitterResponseTypeVoid)
        return nil;
    
    id responseObj = [[self serializer] objectWithString:response error:error];
    
    if(!responseObj)
        return nil;
    
    if(type == CBTwitterResponseTypeNatural)
        return responseObj;
    
    if(type == CBTwitterResponseTypeArray){
        NSArray* dics = responseObj;
        NSMutableArray* objs = [NSMutableArray array];
        for(NSDictionary* statusDic in dics){
            id obj = [[[cls alloc] initWithDictionary:statusDic] autorelease];
            [objs addObject:obj];
        }
        return objs;
    }
    
    if(type == CBTwitterResponseTypeObject){
        return [[[cls alloc] initWithDictionary:responseObj] autorelease];
    }
    
    NSLog(@"should not have gotten this far... processResponse:type:error:");
    return nil;
}

+ (id) processRequestSynchronous:(NSString*)url method:(NSString*)method params:(CBQueryParams*)params type:(CBTwitterResponseType)type class:(Class)cls error:(NSError**)error
{
    ASIFormDataRequest* request = [self buildRequest:url method:method params:params];
    
    [request startSynchronous];
    if ([request error]) {
        *error = [request error];
        return nil;
    }
    return [self processResponse:[request responseString] type:type class:cls error:error];
}

+ (NSString*) processRequestAsynchronous:(NSString*)url method:(NSString*)method params:(CBQueryParams*)params type:(CBTwitterResponseType)type class:(Class)cls delegate:(id)delegate selector:(SEL)selector
{
    ASIFormDataRequest* request = [self buildRequest:url method:method params:params];
    
    NSString* id = [CocoaBird getGuid];
    CBRequestData* data = [[[CBRequestData alloc] initWithId:id request:request type:type class:cls delegate:delegate selector:selector] autorelease];
    [[self currentRequests] addObject:data];
    
    [request startAsynchronous];
    [request setDelegate:self];
    
    return id;
}

+ (void) requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"requestFinished:");
    CBRequestData* data = [self getRequestDataAndRemove:request];    
    NSError* error = nil;
    id result = [self processResponse:[request responseString] type:data.type class:data.class error:&error];
    
    if(data.type == CBTwitterResponseTypeVoid){
        [data.delegate performSelector:data.selector withObject:error];
    }else{
        [data.delegate performSelector:data.selector withObject:result withObject:error];
    }
}

+ (void) requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"requestFailed:");
    CBRequestData* data = [self getRequestDataAndRemove:request];
    NSError* error = [request error];
    [data.delegate performSelector:data.selector withObject:nil withObject:error];
}


@end
