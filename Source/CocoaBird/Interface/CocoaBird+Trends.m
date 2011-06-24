//
//  CocoaBird+Statuses.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
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
    return [self processRequestSynchronous:@"api.twitter.com/1/trends.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBTrendsResponse class] error:error];
}

+ (CBRequestId*) getTrends:(id)delegate selector:(SEL)selector
{
    return [self getTrends:delegate selector:selector params:nil];
}

+ (CBRequestId*) getTrends:(id)delegate selector:(SEL)selector params:(CBGetTrendsParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/trends.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBTrendsResponse class] delegate:delegate selector:selector];
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
    return [self processRequestSynchronous:@"api.twitter.com/1/trends/current.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBTrendsResponse class] error:error];
}

+ (CBRequestId*) getCurrentTrends:(id)delegate selector:(SEL)selector
{
    return [self getCurrentTrends:delegate selector:selector params:nil];
}

+ (CBRequestId*) getCurrentTrends:(id)delegate selector:(SEL)selector params:(CBGetTrendsParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/trends/current.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBTrendsResponse class] delegate:delegate selector:selector];
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
    return [self processRequestSynchronous:@"api.twitter.com/1/trends/daily.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBTrendsResponse class] error:error];
}

+ (CBRequestId*) getDailyTrends:(id)delegate selector:(SEL)selector
{
    return [self getDailyTrends:delegate selector:selector params:nil];
}

+ (CBRequestId*) getDailyTrends:(id)delegate selector:(SEL)selector params:(CBGetTrendsParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/trends/daily.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBTrendsResponse class] delegate:delegate selector:selector];
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
    return [self processRequestSynchronous:@"api.twitter.com/1/trends/weekly.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBTrendsResponse class] error:error];
}

+ (CBRequestId*) getWeeklyTrends:(id)delegate selector:(SEL)selector
{
    return [self getWeeklyTrends:delegate selector:selector params:nil];
}

+ (CBRequestId*) getWeeklyTrends:(id)delegate selector:(SEL)selector params:(CBGetTrendsParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/trends/weekly.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBTrendsResponse class] delegate:delegate selector:selector];
}

@end
