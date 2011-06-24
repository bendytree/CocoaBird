//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CocoaBird+Legal.h"
#import "CocoaBirdSettings.h"

@implementation CBGetPrivacyParams
@synthesize lang;
@end

@implementation CocoaBird (Legal)

#pragma Get Terms of Service

+ (CBTermsOfService*) getTermsOfServiceNow:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/legal/tos.json" method:@"GET" params:nil type:CBTwitterResponseTypeCustom class:[CBTermsOfService class] error:error];
}

+ (CBRequestId*) getTermsOfService:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/legal/tos.json" method:@"GET" params:nil type:CBTwitterResponseTypeCustom class:[CBTermsOfService class] delegate:delegate selector:selector];    
}


#pragma Get Privacy

+ (CBPrivacy*) getPrivacyNow:(CBGetPrivacyParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/legal/privacy.json" method:@"GET" params:nil type:CBTwitterResponseTypeCustom class:[CBPrivacy class] error:error];
}

+ (CBRequestId*) getPrivacy:(CBGetPrivacyParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/legal/privacy.json" method:@"GET" params:nil type:CBTwitterResponseTypeCustom class:[CBPrivacy class] delegate:delegate selector:selector];    
}


@end
