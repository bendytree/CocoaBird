//
//  CocoaBirdAuthenticator.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBirdAuthenticator.h"
#import "CocoaBirdAuthenticatorViewController.h"
#import "CocoaBirdModal.h"

@interface CocoaBirdAuthenticator (private)

+ (NSMutableDictionary*) authDelegates;

@end



@implementation CocoaBirdAuthenticator


#pragma API

+ (void) launchLogin:(BOOL)animated
{
    UIViewController* controller = [[[CocoaBirdAuthenticatorViewController alloc] init] autorelease];
    [CocoaBirdModal present:controller];
}



#pragma Delegates

static NSMutableDictionary* _loginDelegates = NULL;
+ (NSMutableDictionary*) loginDelegates
{
    @synchronized(self)
    {
        if(_loginDelegates == NULL)
            _loginDelegates = [[NSMutableDictionary alloc] init];
    }
    return _loginDelegates;
}

+ (void) notifyDelegatesWithObject:(id)obj1 withObject:(id)obj2
{
    for(NSValue* v in [self loginDelegates]){
        NSObject* delegate = [v pointerValue];
        SEL selector = NSSelectorFromString([[self loginDelegates] objectForKey:v]);
        if([delegate respondsToSelector:selector]){
            [delegate performSelector:selector withObject:obj1 withObject:obj2];
        }
    }
}

+ (void) sendClosedNotification
{
    [self notifyDelegatesWithObject:@"" withObject:@""];
}

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
