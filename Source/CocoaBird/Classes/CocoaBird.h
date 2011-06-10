//
//  CocoaBird.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBPublicTimelineParams.h"
#import "CBHomeTimelineParams.h"
#import "CBUserTimelineParams.h"
#import "CBMentionsParams.h"
#import "CBRetweetedByMeParams.h"
#import "CBRetweetedToMeParams.h"
#import "CBRetweetsOfMeParams.h"

@interface CocoaBird : NSObject {
    
}

#pragma Authentication

//Authentication
+ (void) setConsumerKey:(NSString*)key andSecret:(NSString*)secret;
+ (void) launchLogin:(BOOL)animated;
+ (void) logout;
+ (BOOL) isLoggedIn;
+ (void) addLoginDelegate:(id)delegate selector:(SEL)selector;                  // - (void) loginComplete:(CocoaBirdLoginResult)result error:(NSError*)error;
+ (void) removeLoginDelegate:(id)delegate;
+ (void) removeAllLoginDelegates;

#pragma Timeline

//Public Timeline
+ (NSArray*) getPublicTimeline;
+ (NSArray*) getPublicTimeline:(CBPublicTimelineParams*)params;
+ (NSArray*) getPublicTimeline:(CBPublicTimelineParams*)params error:(NSError**)error;
+ (NSString*) loadPublicTimeline:(id)delegate selector:(SEL)selector;           // - (void) publicTimelineLoaded:(NSArray*)statuses error:(NSError*)error;
+ (NSString*) loadPublicTimeline:(id)delegate selector:(SEL)selector params:(CBPublicTimelineParams*)params;

//Home Timeline
+ (NSArray*) getHomeTimeline;
+ (NSArray*) getHomeTimeline:(CBHomeTimelineParams*)params;
+ (NSArray*) getHomeTimeline:(CBHomeTimelineParams*)params error:(NSError**)error;
+ (NSString*) loadHomeTimeline:(id)delegate selector:(SEL)selector;           // - (void) homeTimelineLoaded:(NSArray*)statuses error:(NSError*)error;
+ (NSString*) loadHomeTimeline:(id)delegate selector:(SEL)selector params:(CBHomeTimelineParams*)params;

//User Timeline
+ (NSArray*) getUserTimeline;
+ (NSArray*) getUserTimeline:(CBUserTimelineParams*)params;
+ (NSArray*) getUserTimeline:(CBUserTimelineParams*)params error:(NSError**)error;
+ (NSString*) loadUserTimeline:(id)delegate selector:(SEL)selector;           // - (void) userTimelineLoaded:(NSArray*)statuses error:(NSError*)error;
+ (NSString*) loadUserTimeline:(id)delegate selector:(SEL)selector params:(CBUserTimelineParams*)params;

//Mentions
+ (NSArray*) getMentions;
+ (NSArray*) getMentions:(CBMentionsParams*)params;
+ (NSArray*) getMentions:(CBMentionsParams*)params error:(NSError**)error;
+ (NSString*) loadMentions:(id)delegate selector:(SEL)selector;           // - (void) mentionsLoaded:(NSArray*)statuses error:(NSError*)error;
+ (NSString*) loadMentions:(id)delegate selector:(SEL)selector params:(CBMentionsParams*)params;

//Retweeted By Me
+ (NSArray*) getRetweetedByMe;
+ (NSArray*) getRetweetedByMe:(CBRetweetedByMeParams*)params;
+ (NSArray*) getRetweetedByMe:(CBRetweetedByMeParams*)params error:(NSError**)error;
+ (NSString*) loadRetweetedByMe:(id)delegate selector:(SEL)selector;           // - (void) retweetedByMeLoaded:(NSArray*)statuses error:(NSError*)error;
+ (NSString*) loadRetweetedByMe:(id)delegate selector:(SEL)selector params:(CBRetweetedByMeParams*)params;

//Retweeted To Me
+ (NSArray*) getRetweetedToMe;
+ (NSArray*) getRetweetedToMe:(CBRetweetedToMeParams*)params;
+ (NSArray*) getRetweetedToMe:(CBRetweetedToMeParams*)params error:(NSError**)error;
+ (NSString*) loadRetweetedToMe:(id)delegate selector:(SEL)selector;           // - (void) retweetedToMeLoaded:(NSArray*)statuses error:(NSError*)error;
+ (NSString*) loadRetweetedToMe:(id)delegate selector:(SEL)selector params:(CBRetweetedToMeParams*)params;

//Retweets Of Me
+ (NSArray*) getRetweetsOfMe;
+ (NSArray*) getRetweetsOfMe:(CBRetweetsOfMeParams*)params;
+ (NSArray*) getRetweetsOfMe:(CBRetweetsOfMeParams*)params error:(NSError**)error;
+ (NSString*) loadRetweetsOfMe:(id)delegate selector:(SEL)selector;           // - (void) retweetsOfMeLoaded:(NSArray*)statuses error:(NSError*)error;
+ (NSString*) loadRetweetsOfMe:(id)delegate selector:(SEL)selector params:(CBRetweetsOfMeParams*)params;

//Cancelling Requests
+ (void) cancelRequest:(NSString*)requestId;
+ (void) cancelAllRequests;

@end


#pragma Authentication Delegate

typedef enum {
    CocoaBirdLoginResultCancelled,
    CocoaBirdLoginResultError,
    CocoaBirdLoginResultSuccess,
} CocoaBirdLoginResult;


#pragma Twitter Response Types

typedef enum {
    CBTwitterResponseTypeStatuses
} CBTwitterResponseType;





