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
    return [self processRequestSynchronous:@"http://api.twitter.com/1/account/verify_credentials.json" params:params type:CBTwitterResponseTypeUser error:error];
}

+ (NSString*) verifyCredentials:(id)delegate selector:(SEL)selector
{
    return [self verifyCredentials:delegate selector:selector params:nil];
}

+ (NSString*) verifyCredentials:(id)delegate selector:(SEL)selector params:(CBVerifyCredentialsParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/account/verify_credentials.json" params:params type:CBTwitterResponseTypeUser delegate:delegate selector:selector];
}


#pragma Rate Limit Status

+ (CBRateLimitStatus*) getRateLimitStatusNow
{
    return [self getRateLimitStatusNow:nil];
}

+ (CBRateLimitStatus*) getRateLimitStatusNow:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/account/rate_limit_status.json" params:nil type:CBTwitterResponseTypeRateLimitStatus error:error];
}

+ (NSString*) getRateLimitStatus:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/account/rate_limit_status.json" params:nil type:CBTwitterResponseTypeRateLimitStatus delegate:delegate selector:selector];
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
    return [self processRequestSynchronous:@"http://api.twitter.com/1/account/settings.json" params:params type:CBTwitterResponseTypeAccountSettings error:error];
}

+ (NSString*) getAccountSettings:(id)delegate selector:(SEL)selector
{
    return [self getAccountSettings:delegate selector:selector params:nil];
}

+ (NSString*) getAccountSettings:(id)delegate selector:(SEL)selector params:(CBAccountSettingsParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/account/settings.json" params:params type:CBTwitterResponseTypeAccountSettings delegate:delegate selector:selector];
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
    return [self processRequestSynchronous:@"http://api.twitter.com/1/account/update_profile.json" params:params type:CBTwitterResponseTypeUser error:error];
}

+ (NSString*) updateProfile:(id)delegate selector:(SEL)selector
{
    return [self updateProfile:delegate selector:selector params:nil];
}

+ (NSString*) updateProfile:(id)delegate selector:(SEL)selector params:(CBUpdateProfileParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/account/update_profile.json" params:params type:CBTwitterResponseTypeUser delegate:delegate selector:selector];
}


@end

