//
//  CocoaBird+Authentication.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBird+Core.h"

@class CBLoginWebController;

@interface CocoaBird (Authentication)

+ (void) setConsumerKey:(NSString*)key andSecret:(NSString*)secret;
+ (void) launchLogin:(BOOL)animated;
+ (CBLoginWebController*) getLoginViewController;
+ (void) logout;
+ (BOOL) isLoggedIn;
+ (void) addLoginDelegate:(id)delegate selector:(SEL)selector;      // - (void) loginComplete:(CBLoginResult)result error:(NSError*)error;
+ (void) removeLoginDelegate:(id)delegate;
+ (void) removeAllLoginDelegates;

@end



