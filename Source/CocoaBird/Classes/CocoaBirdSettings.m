//
//  CocoaBirdSettings.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBirdSettings.h"


@implementation CocoaBirdSettings

+ (void) setOAuthToken:(NSString*)token andSecret:(NSString*)secret
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:token forKey: @"CocoaBird_OAuthToken"];
    [defaults setObject:secret forKey: @"CocoaBird_OAuthTokenSecret"];
    [defaults synchronize];
}

+ (NSString*) oAuthToken
{
    return [[NSUserDefaults standardUserDefaults] objectForKey: @"CocoaBird_OAuthToken"];
}

+ (NSString*) oAuthTokenSecret
{
    return [[NSUserDefaults standardUserDefaults] objectForKey: @"CocoaBird_OAuthTokenSecret"];
}

+ (BOOL) hasAuthenticationTokens
{
    return [[CocoaBirdSettings oAuthToken] length] && [[CocoaBirdSettings oAuthTokenSecret] length];
}

+ (void) assertTokensAreSet
{
    NSAssert([self hasAuthenticationTokens], @"You must set your consumer key/secret: [CocoaBird setConsumerKey:@""YOUR_KEY_HERE"" andSecret:@""YOUR_SECRET_HERE""]");
}

@end
