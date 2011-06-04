//
//  CocoaBirdSettings.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CocoaBirdSettings : NSObject {
    
}

+ (void) setOAuthToken:(NSString*)token andSecret:(NSString*)secret;
+ (NSString*) oAuthToken;
+ (NSString*) oAuthTokenSecret;
+ (BOOL) hasAuthenticationTokens;
+ (void) assertTokensAreSet;

@end
