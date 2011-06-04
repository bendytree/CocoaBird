//
//  CocoaBird.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird.h"
#import "CocoaBirdSettings.h"
#import "CocoaBirdAuthenticator.h"

@implementation CocoaBird

static NSString* oAuthConsumerKey = NULL;
static NSString* oAuthConsumerSecret = NULL;

@synthesize delegate;


#pragma Constructors

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id) initWithDelegate:(NSObject*)_delegate
{
    [self init];
    if (self) {
        self.delegate = _delegate;
    }
    return self;
}


#pragma Static API

+ (void) setConsumerKey:(NSString*)_key andSecret:(NSString*)_secret
{
    oAuthConsumerKey = [_key copy];
    oAuthConsumerSecret = [_secret copy];
}


#pragma Authentication

+ (BOOL) isAuthenticated
{
    return [CocoaBirdSettings hasAuthenticationTokens];
}

+ (void) addAuthenticationDelegate:(NSObject*)_delegate
{
    [CocoaBirdAuthenticator addAuthenticationDelegate:_delegate];
}

+ (void) removeAuthenticationDelegate:(NSObject*)_delegate
{
    [CocoaBirdAuthenticator removeAuthenticationDelegate:_delegate];
}

+ (void) launchAuthentication
{
    [CocoaBirdAuthenticator launchAuthentication];
}


#pragma Cleanup

- (void)dealloc {
    
    self.delegate = nil;
    
    [super dealloc];
}

@end
