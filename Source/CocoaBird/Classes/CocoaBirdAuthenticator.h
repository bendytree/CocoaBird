//
//  CocoaBirdAuthenticator.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CocoaBirdAuthenticator : NSObject {
 
    
    
}

+ (void) launchLogin:(BOOL)animated;

+ (void) addLoginDelegate:(NSObject*)_delegate selector:(SEL)_selector;
+ (void) removeLoginDelegate:(NSObject*)delegate;
+ (void) removeAllLoginDelegates;
+ (void) sendClosedNotification;

@end
