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
+ (void) launchAuthentication;
+ (BOOL) isAuthenticated;
+ (void) addAuthenticationDelegate:(NSObject*)delegate;
+ (void) removeAuthenticationDelegate:(NSObject*)delegate;

@end


#pragma Authentication Delegate

@protocol CocoaBirdAuthenticationDelegate
@optional
- (void) cocoaBirdAuthenticationClosed;
@end

