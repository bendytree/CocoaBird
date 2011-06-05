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

+ (NSMutableArray*) authDelegates;

@end



@implementation CocoaBirdAuthenticator


#pragma API

+ (void) launchLogin:(BOOL)animated
{
    UIViewController* controller = [[[CocoaBirdAuthenticatorViewController alloc] init] autorelease];
    [CocoaBirdModal present:controller];
}



#pragma Delegates

static NSMutableArray* _authDelegates = NULL;
+ (NSMutableArray*) authDelegates
{
    @synchronized(self)
    {
        if(_authDelegates == NULL)
            _authDelegates = [[NSMutableArray alloc] init];
    }
    return _authDelegates;
}

+ (void) notifyDelegates:(SEL)selector
{
    for(NSValue* v in [CocoaBirdAuthenticator authDelegates]){
        NSObject* delegate = [v pointerValue];
        if([delegate respondsToSelector:selector]){
            [delegate performSelector:selector];
        }
    }
}

+ (void) sendClosedNotification
{
    [self notifyDelegates:@selector(cocoaBirdLoginComplete)];
}

+ (void) addLoginDelegate:(NSObject*)_delegate selector:(SEL)_selector
{
    [CocoaBirdAuthenticator removeLoginDelegate:_delegate];
    [[CocoaBirdAuthenticator authDelegates] addObject:[NSValue valueWithPointer:_delegate]];
}

+ (void) removeLoginDelegate:(NSObject*)_delegate
{
    for(int i=0; i<[[CocoaBirdAuthenticator authDelegates] count]; i++){
        NSValue* v = [[CocoaBirdAuthenticator authDelegates] objectAtIndex:i];
        if([v pointerValue] == _delegate){
            [[CocoaBirdAuthenticator authDelegates] removeObjectAtIndex:i];
            i--;
        }
    }
}


@end
