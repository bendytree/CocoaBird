//
//  CocoaBirdSettings.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CocoaBirdSettings : NSObject {
    
}

//Consumer
+ (void) setConsumerKey:(NSString*)_key andSecret:(NSString*)_secret;
+ (void) assertConsumerKeyAndSecretAreSet;
+ (NSString*) oAuthConsumerKey;
+ (NSString*) oAuthConsumerSecret;
+ (void) setUseSSL:(BOOL)useSSL;
+ (BOOL) useSSL;

//OAuth Tokey/Secret
+ (void) setAccessTokenKey:(NSString*)key secret:(NSString*)secret screenname:(NSString*)screenname;
+ (BOOL) hasAccessTokens;
+ (NSString*) oAuthAccessTokenKey;
+ (NSString*) oAuthAccessTokenSecret;
+ (NSString*) screenname;
+ (void) logout;

@end
