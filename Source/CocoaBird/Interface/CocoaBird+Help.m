//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CocoaBird+Help.h"
#import "CocoaBirdSettings.h"



@implementation CocoaBird (Help)

#pragma Test

+ (NSString*) testNow:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/help/test.json" method:@"GET" params:nil type:CBTwitterResponseTypeNatural class:nil error:error];
}

+ (CBRequestId*) test:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/help/test.json" method:@"GET" params:nil type:CBTwitterResponseTypeNatural class:nil delegate:delegate selector:selector];    
}


#pragma Get Help Configuration

+ (CBHelpConfiguration*) getHelpConfigurationNow:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/help/configuration.json" method:@"GET" params:nil type:CBTwitterResponseTypeCustom class:[CBHelpConfiguration class] error:error];
}

+ (CBRequestId*) getHelpConfiguration:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/help/configuration.json" method:@"GET" params:nil type:CBTwitterResponseTypeCustom class:[CBHelpConfiguration class] delegate:delegate selector:selector];    
}


#pragma Get Languages

+ (NSArray*) getLanguagesNow:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/help/languages.json" method:@"GET" params:nil type:CBTwitterResponseTypeCustom class:[CBLanguage class] error:error];
}

+ (CBRequestId*) getLanguages:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/help/languages.json" method:@"GET" params:nil type:CBTwitterResponseTypeCustom class:[CBLanguage class] delegate:delegate selector:selector];    
}


@end
