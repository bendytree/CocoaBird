//
//  CocoaBird+Authentication.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/9/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CocoaBird+Authentication.h"
#import "CocoaBirdSettings.h"
#import "CocoaBirdModal.h"
#import "CocoaBird+AuthenticationCore.h"
#import "CBLoginModalController.h"


@implementation CocoaBird (Authentication)

#pragma Authentication

+ (void) setConsumerKey:(NSString*)_key andSecret:(NSString*)_secret
{
    [CocoaBirdSettings setConsumerKey:_key andSecret:_secret];
}

+ (BOOL) isLoggedIn
{
    return [CocoaBirdSettings hasAccessTokens];
}

+ (void) logout
{
    [CocoaBirdSettings logout];
}


#pragma API

+ (void) launchLogin:(BOOL)animated
{
    UIViewController* controller = [[[CBLoginModalController alloc] init] autorelease];
    [CocoaBirdModal present:controller];
}

+ (CBLoginWebController*) getLoginViewController
{
    return [[[CBLoginWebController alloc] init] autorelease];
}


#pragma Delegates

+ (void) addLoginDelegate:(NSObject*)_delegate selector:(SEL)_selector
{
    [self removeLoginDelegate:_delegate];
    [[self loginDelegates] setObject:NSStringFromSelector(_selector) forKey:[NSValue valueWithPointer:_delegate]];
}

+ (void) removeLoginDelegate:(NSObject*)_delegate
{
    NSMutableArray* keysToRemove = [NSMutableArray array];
    
    for(NSValue* key in [self loginDelegates])
        if([key pointerValue] == _delegate)
            [keysToRemove addObject:key];
    
    [[self loginDelegates] removeObjectsForKeys:keysToRemove];    
}

+ (void) removeAllLoginDelegates
{
    [[self loginDelegates] removeAllObjects];
}

@end
