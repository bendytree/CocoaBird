//
//  CocoaBird+AuthenticationCore.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+AuthenticationCore.h"
#import "CocoaBird+Authentication.h"

@implementation CocoaBird (AuthenticationCore)

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

+ (void) sendClosedNotification:(CocoaBirdLoginResult)result error:(NSError*)error
{
    for(NSValue* v in [self loginDelegates]){
        NSObject* delegate = [v pointerValue];
        SEL selector = NSSelectorFromString([[self loginDelegates] objectForKey:v]);
        if([delegate respondsToSelector:selector]){
            [delegate performSelector:selector withObject:(id)result withObject:error];
        }
    }
}

@end
