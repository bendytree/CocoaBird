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
    [CocoaBirdSettings setConsumerKey:_key andSecret:_secret];
}


#pragma Authentication

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

+ (void) launchLogin:(BOOL)animated
{
    [CocoaBirdAuthenticator launchLogin:animated];
}


#pragma Cleanup

- (void)dealloc {
    
    self.delegate = nil;
    
    [super dealloc];
}

@end
