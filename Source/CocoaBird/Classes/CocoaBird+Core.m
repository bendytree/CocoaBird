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
#import "CBStatus.h"
#import "ASIFormDataRequest.h"
#import "CBRequestData.h"
#import "CBRateLimitStatus.h"
#import "CBAccountSettings.h"
#import "CBTrendsResponse.h"
#import "CBTrendLocation.h"
#import "CBTrendForLocation.h"

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


+ (ASIFormDataRequest*) buildRequest:(NSString*)url params:(CBQueryParams*)params
{
    ASIFormDataRequest* request = [ASIFormDataRequest 
                                   requestWithURL:[NSURL URLWithString:url]
                                   consumerKey:@"1234" //not_needed? [CocoaBirdSettings oAuthConsumerKey]
                                   consumerSecret:@"1234" //not_needed? [CocoaBirdSettings oAuthConsumerSecret]
                                   token:[CocoaBirdSettings oAuthToken]
                                   tokenSecret: [CocoaBirdSettings oAuthTokenSecret]];
    
    [params applyToRequest:request];
    
    return request;
}

+ (id) processResponse:(NSString*)response type:(CBTwitterResponseType)type error:(NSError**)error
{    
    if(type == CBTwitterResponseTypeNone)
        return nil;
    
    id responseObj = [[self serializer] objectWithString:response error:error];
    
    if(!responseObj)
        return nil;
    
    if(type == CBTwitterResponseTypeStatuses){
        NSArray* statusDics = responseObj;
        NSMutableArray* statuses = [NSMutableArray array];
        for(NSDictionary* statusDic in statusDics){
            CBStatus* status = [[[CBStatus alloc] initWithDictionary:statusDic] autorelease];
            [statuses addObject:status];
        }
        return statuses;
    }else if(type == CBTwitterResponseTypeStatus){
        return [[[CBStatus alloc] initWithDictionary:responseObj] autorelease];
    }else if(type == CBTwitterResponseTypeUsers){
        NSArray* userDics = responseObj;
        NSMutableArray* users = [NSMutableArray array];
        for(NSDictionary* userDic in userDics){
            CBUser* user = [[[CBUser alloc] initWithDictionary:userDic] autorelease];
            [users addObject:user];
        }
        return users;
    }else if(type == CBTwitterResponseTypeUser){
        return [[[CBUser alloc] initWithDictionary:responseObj] autorelease];
    }else if(type == CBTwitterResponseTypeNatural){
        return responseObj;
    }else if(type == CBTwitterResponseTypeRateLimitStatus){
        return [[[CBRateLimitStatus alloc] initWithDictionary:responseObj] autorelease];
    }else if(type == CBTwitterResponseTypeAccountSettings){
        return [[[CBAccountSettings alloc] initWithDictionary:responseObj] autorelease];
    }else if(type == CBTwitterResponseTypeTrends){
        return [[[CBTrendsResponse alloc] initWithDictionary:responseObj] autorelease];
    }else if(type == CBTwitterResponseTypeTrendLocations){
        NSArray* dics = responseObj;
        NSMutableArray* trendLocations = [NSMutableArray array];
        for(NSDictionary* dic in dics){
            CBTrendLocation* trendLocation = [[[CBTrendLocation alloc] initWithDictionary:dic] autorelease];
            [trendLocations addObject:trendLocation];
        }
        return trendLocations;
    }else if(type == CBTwitterResponseTypeTrendsForLocation){
        NSArray* dics = responseObj;
        NSMutableArray* trendsForLocation = [NSMutableArray array];
        for(NSDictionary* dic in dics){
            CBTrendForLocation* trendForLocation = [[[CBTrendForLocation alloc] initWithDictionary:dic] autorelease];
            [trendsForLocation addObject:trendForLocation];
        }
        return trendsForLocation;        
    }
    
    NSLog(@"should not have gotten this far... processResponse:type:error:");
    return nil;
}

+ (id) processRequestSynchronous:(NSString*)url params:(CBQueryParams*)params type:(CBTwitterResponseType)type error:(NSError**)error
{
    ASIFormDataRequest* request = [self buildRequest:url params:params];
    
    [request startSynchronous];
    if ([request error]) {
        *error = [request error];
        return nil;
    }
    return [self processResponse:[request responseString] type:type error:error];
}

+ (NSString *) getGuid
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return [(NSString *)string autorelease];
}

+ (NSString*) processRequestAsynchronous:(NSString*)url params:(CBQueryParams*)params type:(CBTwitterResponseType)type delegate:(id)delegate selector:(SEL)selector
{
    ASIFormDataRequest* request = [self buildRequest:url params:params];
    
    NSString* id = [CocoaBird getGuid];
    CBRequestData* data = [[[CBRequestData alloc] initWithId:id request:request type:type delegate:delegate selector:selector] autorelease];
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
    id result = [self processResponse:[request responseString] type:data.type error:&error];
    
    if(data.type == CBTwitterResponseTypeNone){
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
