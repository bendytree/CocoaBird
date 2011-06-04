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

+ (void) launchAuthentication;

+ (void) addAuthenticationDelegate:(NSObject*)delegate;
+ (void) removeAuthenticationDelegate:(NSObject*)delegate;
+ (void) sendClosedNotification;

@end
