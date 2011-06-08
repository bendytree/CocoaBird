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

//Authentication
+ (void) setConsumerKey:(NSString*)key andSecret:(NSString*)secret;
+ (void) launchLogin:(BOOL)animated;
+ (void) logout;
+ (BOOL) isLoggedIn;
+ (void) addLoginDelegate:(id)delegate selector:(SEL)selector;                  // - (void) loginComplete:(CocoaBirdLoginResult)result error:(NSError*)error;
+ (void) removeLoginDelegate:(id)delegate;
+ (void) removeAllLoginDelegates;

//API
+ (NSArray*) getPublicTimeline;
+ (NSArray*) getPublicTimeline:(NSError**)error;
//+ (NSString*) getPublicTimeline:(id)delegate selector:(SEL)selector;    // - (void) publicTimelineLoaded:(NSArray*)statuses error:(NSError*)error;
//+ (void) cancelRequest:(NSString*)requestId;
//+ (void) cancelAllRequests;

@end


#pragma Authentication Delegate

typedef enum {
    CocoaBirdLoginResultCancelled,
    CocoaBirdLoginResultError,
    CocoaBirdLoginResultSuccess,
} CocoaBirdLoginResult;


