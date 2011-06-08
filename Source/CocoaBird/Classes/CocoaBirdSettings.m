//
//  CocoaBirdSettings.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBirdSettings.h"


@implementation CocoaBirdSettings


#pragma Consumer Key/Secret

static NSString* oAuthConsumerKey = NULL;
static NSString* oAuthConsumerSecret = NULL;

+ (void) setConsumerKey:(NSString*)_key andSecret:(NSString*)_secret
{
    oAuthConsumerKey = [_key copy];
    oAuthConsumerSecret = [_secret copy];
}

+ (void) assertConsumerKeyAndSecretAreSet
{
    BOOL hasKeyAndSecret = [oAuthConsumerKey length] && [oAuthConsumerSecret length];
    NSAssert(hasKeyAndSecret, @"You must set your consumer key/secret: [CocoaBird setConsumerKey:@""YOUR_KEY_HERE"" andSecret:@""YOUR_SECRET_HERE""]");
}

+ (NSString*) oAuthConsumerKey
{
    return oAuthConsumerKey;
}

+ (NSString*) oAuthConsumerSecret
{
    return oAuthConsumerSecret;
}


#pragma User Key/Secret

+ (void) setAuthenticationToken:(NSString*)token secret:(NSString*)secret screenname:(NSString*)screenname
{
    NSLog(@"setAuthenticationToken:Secret:Screenname:%@", screenname);
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:token forKey: @"CocoaBird_AuthenticationToken"];
    [defaults setObject:secret forKey: @"CocoaBird_AuthenticationSecret"];
    [defaults setObject:screenname forKey: @"CocoaBird_AuthenticationScreenname"];
    [defaults synchronize];
}

+ (BOOL) hasAuthenticationTokens
{
    return [[CocoaBirdSettings oAuthToken] length] && [[CocoaBirdSettings oAuthTokenSecret] length];
}

+ (NSString*) oAuthToken
{
    return [[NSUserDefaults standardUserDefaults] objectForKey: @"CocoaBird_AuthenticationToken"];
}

+ (NSString*) oAuthTokenSecret
{
    return [[NSUserDefaults standardUserDefaults] objectForKey: @"CocoaBird_AuthenticationSecret"];
}

+ (NSString*) screenname
{
    return [[NSUserDefaults standardUserDefaults] objectForKey: @"CocoaBird_AuthenticationScreenname"];
}

+ (void) logout
{
    [self setAuthenticationToken:nil secret:nil screenname:nil];
}


@end
