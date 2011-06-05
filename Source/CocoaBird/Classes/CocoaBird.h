//
//  CocoaBird.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CocoaBird : NSObject {
    
}

- (id) init;
- (id) initWithDelegate:(NSObject*)_delegate;

@property (assign) NSObject* delegate;

+ (void) setConsumerKey:(NSString*)key andSecret:(NSString*)secret;

//Authentication
+ (void) launchLogin:(BOOL)animated;
+ (BOOL) isLoggedIn;
+ (void) addLoginDelegate:(NSObject*)delegate selector:(SEL)selector;
+ (void) removeLoginDelegate:(NSObject*)delegate;

@end


#pragma Authentication Delegate

@protocol CocoaBirdAuthenticationDelegate
@optional
- (void) cocoaBirdLoginComplete;
@end

