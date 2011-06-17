//
//  CocoaBird+Account.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Account.h"


@implementation CBVerifyCredentialsParams
@synthesize skip_status, include_entities;
@end

@implementation CBAccountSettingsParams
@synthesize trend_location_woeid, sleep_time_enabled, start_sleep_time, end_sleep_time, time_zone, lang;
@end

@implementation CBUpdateProfileParams
@synthesize name, url, location, description, skip_status, include_entities;
@end

@implementation CBUpdateProfileColorsParams
@synthesize profile_background_color, profile_text_color, profile_link_color, profile_sidebar_fill_color,
            profile_sidebar_border_color, skip_status, include_entities;
@end


@implementation CocoaBird (Account)


#pragma Verify Credentials

+ (CBUser*) verifyCredentialsNow
{
    return [self verifyCredentialsNow:nil];
}

+ (CBUser*) verifyCredentialsNow:(CBVerifyCredentialsParams*)params
{
    return [self verifyCredentialsNow:params error:nil];
}

+ (CBUser*) verifyCredentialsNow:(CBVerifyCredentialsParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/account/verify_credentials.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBUser class] error:error];
}

+ (CBRequestId*) verifyCredentials:(id)delegate selector:(SEL)selector
{
    return [self verifyCredentials:delegate selector:selector params:nil];
}

+ (CBRequestId*) verifyCredentials:(id)delegate selector:(SEL)selector params:(CBVerifyCredentialsParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/account/verify_credentials.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBUser class] delegate:delegate selector:selector];
}


#pragma Rate Limit Status

+ (CBRateLimitStatus*) getRateLimitStatusNow
{
    return [self getRateLimitStatusNow:nil];
}

+ (CBRateLimitStatus*) getRateLimitStatusNow:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/account/rate_limit_status.json" method:@"GET" params:nil type:CBTwitterResponseTypeObject class:[CBRateLimitStatus class] error:error];
}

+ (CBRequestId*) getRateLimitStatus:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/account/rate_limit_status.json" method:@"GET" params:nil type:CBTwitterResponseTypeObject class:[CBRateLimitStatus class] delegate:delegate selector:selector];
}


#pragma Account Settings

+ (CBAccountSettings*) getAccountSettingsNow
{
    return [self getAccountSettingsNow:nil];
}

+ (CBAccountSettings*) getAccountSettingsNow:(CBAccountSettingsParams*)params
{
    return [self getAccountSettingsNow:params error:nil];
}

+ (CBAccountSettings*) getAccountSettingsNow:(CBAccountSettingsParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/account/settings.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBAccountSettings class] error:error];
}

+ (CBRequestId*) getAccountSettings:(id)delegate selector:(SEL)selector
{
    return [self getAccountSettings:delegate selector:selector params:nil];
}

+ (CBRequestId*) getAccountSettings:(id)delegate selector:(SEL)selector params:(CBAccountSettingsParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/account/settings.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBAccountSettings class] delegate:delegate selector:selector];
}



#pragma Update Profile

+ (CBUser*) updateProfileNow
{
    return [self updateProfileNow:nil];
}

+ (CBUser*) updateProfileNow:(CBUpdateProfileParams*)params
{
    return [self updateProfileNow:params error:nil];
}

+ (CBUser*) updateProfileNow:(CBUpdateProfileParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/account/update_profile.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBUser class] error:error];
}

+ (CBRequestId*) updateProfile:(id)delegate selector:(SEL)selector
{
    return [self updateProfile:delegate selector:selector params:nil];
}

+ (CBRequestId*) updateProfile:(id)delegate selector:(SEL)selector params:(CBUpdateProfileParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/account/update_profile.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBUser class] delegate:delegate selector:selector];
}


#pragma Get Totals

+ (CBAccountTotals*) getAccountTotalsNow:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/account/totals.json" method:@"GET" params:nil type:CBTwitterResponseTypeObject class:[CBAccountTotals class] error:error];
}

+ (CBRequestId*) getAccountTotals:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/account/totals.json" method:@"GET" params:nil type:CBTwitterResponseTypeObject class:[CBAccountTotals class] delegate:delegate selector:selector];
}


#pragma Update Profile Colors

+ (CBUser*) updateProfileColorsNow:(CBUpdateProfileColorsParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/account/update_profile_colors.json" method:@"POST" params:nil type:CBTwitterResponseTypeObject class:[CBUser class] error:error];
}

+ (CBRequestId*) updateProfileColors:(CBUpdateProfileColorsParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/account/update_profile_colors.json" method:@"POST" params:nil type:CBTwitterResponseTypeObject class:[CBUser class] delegate:delegate selector:selector];
}



@end

