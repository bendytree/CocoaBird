//
//  CocoaBirdSettings.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CocoaBirdSettings.h"


@implementation CocoaBirdSettings


#pragma Consumer Key/Secret

static NSString* oAuthConsumerKey = NULL;
static NSString* oAuthConsumerSecret = NULL;
static BOOL useSSL = YES;

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

+ (void) setUseSSL:(BOOL)_useSSL
{
    useSSL = _useSSL;
}

+ (BOOL) useSSL
{
    return useSSL;
}


#pragma User Key/Secret

+ (void) setAccessTokenKey:(NSString*)key secret:(NSString*)secret screenname:(NSString*)screenname
{
    NSLog(@"setAuthenticationToken:Secret:Screenname:%@", screenname);
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:key forKey: @"CocoaBird_AccessTokenKey"];
    [defaults setObject:secret forKey: @"CocoaBird_AccessTokenSecret"];
    [defaults setObject:screenname forKey: @"CocoaBird_AuthenticationScreenname"];
    [defaults synchronize];
}

+ (BOOL) hasAccessTokens
{
    return [[CocoaBirdSettings oAuthAccessTokenKey] length] && [[CocoaBirdSettings oAuthAccessTokenSecret] length];
}

+ (NSString*) oAuthAccessTokenKey
{
    return [[NSUserDefaults standardUserDefaults] objectForKey: @"CocoaBird_AccessTokenKey"];
}

+ (NSString*) oAuthAccessTokenSecret
{
    return [[NSUserDefaults standardUserDefaults] objectForKey: @"CocoaBird_AccessTokenSecret"];
}

+ (NSString*) screenname
{
    return [[NSUserDefaults standardUserDefaults] objectForKey: @"CocoaBird_AuthenticationScreenname"];
}

+ (void) logout
{
    [self setAccessTokenKey:nil secret:nil screenname:nil];
}


@end
