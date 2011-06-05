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

//Consumer
+ (void) setConsumerKey:(NSString*)_key andSecret:(NSString*)_secret;
+ (void) assertConsumerKeyAndSecretAreSet;
+ (NSString*) oAuthConsumerKey;
+ (NSString*) oAuthConsumerSecret;

//OAuth Tokey/Secret
+ (void) setAuthenticationToken:(NSString*)token secret:(NSString*)secret screenname:(NSString*)screenname;
+ (BOOL) hasAuthenticationTokens;
+ (NSString*) oAuthToken;
+ (NSString*) oAuthTokenSecret;
+ (NSString*) screenname;

@end
