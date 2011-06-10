//
//  CocoaBird+Authentication.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Authentication.h"
#import "CocoaBirdSettings.h"
#import "CocoaBirdAuthenticator.h"

@implementation CocoaBird (Authentication)


#pragma Authentication

+ (void) setConsumerKey:(NSString*)_key andSecret:(NSString*)_secret
{
    [CocoaBirdSettings setConsumerKey:_key andSecret:_secret];
}

+ (BOOL) isLoggedIn
{
    return [CocoaBirdSettings hasAuthenticationTokens];
}

+ (void) addLoginDelegate:(NSObject*)_delegate selector:(SEL)_selector
{
    [CocoaBirdAuthenticator addLoginDelegate:_delegate selector:_selector];
}

+ (void) removeLoginDelegate:(NSObject*)_delegate
{
    [CocoaBirdAuthenticator removeLoginDelegate:_delegate];
}

+ (void) removeAllLoginDelegates
{
    [CocoaBirdAuthenticator removeAllLoginDelegates];
}

+ (void) launchLogin:(BOOL)animated
{
    [CocoaBirdAuthenticator launchLogin:animated];
}

+ (void) logout
{
    [CocoaBirdSettings logout];
}



@end
