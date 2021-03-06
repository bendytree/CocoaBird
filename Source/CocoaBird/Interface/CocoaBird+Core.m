//
//  CocoaBird.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CocoaBird+Core.h"
#import "CocoaBirdSettings.h"

#import "ASIHTTPRequest+OAuth.h"
#import "JSON.h"
#import "ASIFormDataRequest.h"
#import "CBRequestData.h"
#import "CocoaBirdReflection.h"


@implementation CocoaBird (Core)

#pragma Request API Helpers

static NSMutableArray* _contexts = NULL;
+ (NSMutableArray*) contexts
{
    @synchronized(self)
    {
        if(_contexts == NULL)
            _contexts = [[NSMutableArray alloc] init];
    }
    return _contexts;
}

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

+ (NSString*) getGuid
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return [(NSString *)string autorelease];
}

static NSString* urlEncode(id object) {
    NSString* string = [NSString stringWithFormat: @"%@", object];
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

+ (ASIFormDataRequest*) buildRequest:(NSString*)url method:(NSString*)method params:(NSDictionary*)paramsDic
{
    if([url hasPrefix:@"http"] == NO)
        url = [NSString stringWithFormat:@"%@%@", ([CocoaBirdSettings useSSL] ? @"https://" : @"http://"), url];
    
    if([method isEqualToString:@"GET"]){
        url = [self appendQueryString:paramsDic toUrl:url];
        return [ASIHTTPRequest 
                                       requestWithURL:[NSURL URLWithString:url]
                                       consumerKey: [CocoaBirdSettings oAuthConsumerKey]
                                       consumerSecret: [CocoaBirdSettings oAuthConsumerSecret]
                                       token:[CocoaBirdSettings oAuthAccessTokenKey]
                                       tokenSecret: [CocoaBirdSettings oAuthAccessTokenSecret]];
    }else{
        ASIFormDataRequest* request = [ASIFormDataRequest 
                                       requestWithURL:[NSURL URLWithString:url]
                                       consumerKey: [CocoaBirdSettings oAuthConsumerKey]
                                       consumerSecret: [CocoaBirdSettings oAuthConsumerSecret]
                                       token:[CocoaBirdSettings oAuthAccessTokenKey]
                                       tokenSecret: [CocoaBirdSettings oAuthAccessTokenSecret]];
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
    
    if([responseObj respondsToSelector:@selector(valueForKey:)] && [responseObj valueForKey:@"error"]){
        *error = [NSError errorWithDomain:@"" code:0 userInfo:[NSDictionary dictionaryWithObject:[responseObj valueForKey:@"error"] forKey:@"message"]];
        return nil;
    }
    
    if(type == CBTwitterResponseTypeNatural)
        return responseObj;
    
    // CBTwitterResponseTypeCustom
    return [CocoaBirdReflection buildObject:cls fromCoreType:responseObj];
}

+ (id) processRequestSynchronous:(NSString*)url method:(NSString*)method dicParams:(NSDictionary*)params type:(CBTwitterResponseType)type class:(Class)cls error:(NSError**)error
{
    ASIFormDataRequest* request = [self buildRequest:url method:method params:params];
    
    [request startSynchronous];
    if ([request error]) {
        *error = [request error];
        return nil;
    }
    return [self processResponse:[request responseString] type:type class:cls error:error];
}

+ (id) processRequestSynchronous:(NSString*)url method:(NSString*)method params:(CBQueryParams*)params type:(CBTwitterResponseType)type class:(Class)cls error:(NSError**)error
{
    return [self processRequestSynchronous:url method:method dicParams:[CocoaBirdReflection convertObjectToCoreType:params] type:type class:cls error:error];
}


+ (CBRequestId*) processRequestAsynchronous:(NSString*)url method:(NSString*)method dicParams:(NSDictionary*)params type:(CBTwitterResponseType)type class:(Class)cls delegate:(id)delegate selector:(SEL)selector
{
    ASIFormDataRequest* request = [self buildRequest:url method:method params:params];
    NSString* id = [CocoaBird getGuid];
    
    CBRequestData* data = [[[CBRequestData alloc] initWithId:id request:request type:type class:cls delegate:delegate selector:selector] autorelease];
    [[self currentRequests] addObject:data];
    
    if([[self contexts] count])
    {
        data.context = [[self contexts] lastObject];
        [[self contexts] removeLastObject];
    }
    
    [request startAsynchronous];
    [request setDelegate:self];
    
    return [CBRequestId stringWithString:id];
}

+ (CBRequestId*) processRequestAsynchronous:(NSString*)url method:(NSString*)method params:(CBQueryParams*)params type:(CBTwitterResponseType)type class:(Class)cls delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:url method:method dicParams:[CocoaBirdReflection convertObjectToCoreType:params] type:type class:cls delegate:delegate selector:selector];
}

+ (void) requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"requestFinished:");
    CBRequestData* data = [self getRequestDataAndRemove:request];    
    NSError* error = nil;
    id result = [self processResponse:[request responseString] type:data.type class:data.class error:&error];
        
    [data fireDelegateWithResult:result error:error];
}

+ (void) requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"requestFailed:");
    CBRequestData* data = [self getRequestDataAndRemove:request];
    NSError* error = [request error];
    
    [data fireDelegateWithResult:nil error:error];
}


#pragma Context

+ (void) pushRequestContext:(id)context
{
    [[self contexts] addObject:context];
}


@end




