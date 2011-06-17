//
//  CocoaBird+Statuses.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+LocalTrends.h"
#import "CBModels.h"

@implementation CBTrendLocationsParams
@synthesize lat, long_;
@end


@implementation CocoaBird (LocalTrends)

#pragma Get Trends

+ (NSArray*) getTrendLocationsNow
{
    return [self getTrendLocationsNow:nil];
}

+ (NSArray*) getTrendLocationsNow:(CBTrendLocationsParams*)params
{
    return [self getTrendLocationsNow:params error:nil];
}

+ (NSArray*) getTrendLocationsNow:(CBTrendLocationsParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/trends/available.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBTrendLocation class] error:error];
}

+ (NSString*) getTrendLocations:(id)delegate selector:(SEL)selector
{
    return [self getTrendLocations:delegate selector:selector params:nil];
}

+ (NSString*) getTrendLocations:(id)delegate selector:(SEL)selector params:(CBTrendLocationsParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/trends/available.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBTrendLocation class] delegate:delegate selector:selector];
}


#pragma Trends for Location

+ (NSArray*) getTrendsForLocationNow:(int)woeid
{    
    return [self getTrendsForLocationNow:woeid error:nil];
}

+ (NSArray*) getTrendsForLocationNow:(int)woeid error:(NSError**)error
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/trends/%i.json", woeid];
    return [self processRequestSynchronous:url method:@"GET" params:nil type:CBTwitterResponseTypeArray class:[CBTrendsForLocation class] error:error];
}

+ (NSString*) getTrendsForLocation:(int)woeid delegate:(id)delegate selector:(SEL)selector
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/trends/%i.json", woeid];
    return [self processRequestAsynchronous:url method:@"GET" params:nil type:CBTwitterResponseTypeArray class:[CBTrendsForLocation class] delegate:delegate selector:selector];    
}


@end
