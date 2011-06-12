//
//  CocoaBird+Statuses.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Trends.h"


@implementation CBGetTrendsParams
@synthesize date, exclude;
@end


@implementation CocoaBird (Trends)

#pragma Get Trends

+ (CBTrendsResponse*) getTrendsNow
{
    return [self getTrendsNow:nil];
}

+ (CBTrendsResponse*) getTrendsNow:(CBGetTrendsParams*)params
{
    return [self getTrendsNow:params error:nil];
}

+ (CBTrendsResponse*) getTrendsNow:(CBGetTrendsParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/trends.json" params:params type:CBTwitterResponseTypeTrends error:error];
}

+ (NSString*) getTrends:(id)delegate selector:(SEL)selector
{
    return [self getTrends:delegate selector:selector params:nil];
}

+ (NSString*) getTrends:(id)delegate selector:(SEL)selector params:(CBGetTrendsParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/trends.json" params:params type:CBTwitterResponseTypeTrends delegate:delegate selector:selector];
}


#pragma Current Trends

+ (CBTrendsResponse*) getCurrentTrendsNow
{
    return [self getCurrentTrendsNow:nil];
}

+ (CBTrendsResponse*) getCurrentTrendsNow:(CBGetTrendsParams*)params
{
    return [self getCurrentTrendsNow:params error:nil];
}

+ (CBTrendsResponse*) getCurrentTrendsNow:(CBGetTrendsParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/trends/current.json" params:params type:CBTwitterResponseTypeTrends error:error];
}

+ (NSString*) getCurrentTrends:(id)delegate selector:(SEL)selector
{
    return [self getCurrentTrends:delegate selector:selector params:nil];
}

+ (NSString*) getCurrentTrends:(id)delegate selector:(SEL)selector params:(CBGetTrendsParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/trends/current.json" params:params type:CBTwitterResponseTypeTrends delegate:delegate selector:selector];
}


#pragma Daily Trends

+ (CBTrendsResponse*) getDailyTrendsNow
{
    return [self getDailyTrendsNow:nil];
}

+ (CBTrendsResponse*) getDailyTrendsNow:(CBGetTrendsParams*)params
{
    return [self getDailyTrendsNow:params error:nil];
}

+ (CBTrendsResponse*) getDailyTrendsNow:(CBGetTrendsParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/trends/daily.json" params:params type:CBTwitterResponseTypeTrends error:error];
}

+ (NSString*) getDailyTrends:(id)delegate selector:(SEL)selector
{
    return [self getDailyTrends:delegate selector:selector params:nil];
}

+ (NSString*) getDailyTrends:(id)delegate selector:(SEL)selector params:(CBGetTrendsParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/trends/daily.json" params:params type:CBTwitterResponseTypeTrends delegate:delegate selector:selector];
}


#pragma Weekly Trends

+ (CBTrendsResponse*) getWeeklyTrendsNow
{
    return [self getWeeklyTrendsNow:nil];
}

+ (CBTrendsResponse*) getWeeklyTrendsNow:(CBGetTrendsParams*)params
{
    return [self getWeeklyTrendsNow:params error:nil];
}

+ (CBTrendsResponse*) getWeeklyTrendsNow:(CBGetTrendsParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/trends/weekly.json" params:params type:CBTwitterResponseTypeTrends error:error];
}

+ (NSString*) getWeeklyTrends:(id)delegate selector:(SEL)selector
{
    return [self getWeeklyTrends:delegate selector:selector params:nil];
}

+ (NSString*) getWeeklyTrends:(id)delegate selector:(SEL)selector params:(CBGetTrendsParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/trends/weekly.json" params:params type:CBTwitterResponseTypeTrends delegate:delegate selector:selector];
}

@end
