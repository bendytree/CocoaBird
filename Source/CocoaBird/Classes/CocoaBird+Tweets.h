//
//  CocoaBird+Tweets.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBird+Core.h"
#import "CBTweetsParams.h"

@interface CocoaBird (Tweets)

//Public Timeline
+ (NSArray*) getPublicTimelineNow;
+ (NSArray*) getPublicTimelineNow:(CBPublicTimelineParams*)params;
+ (NSArray*) getPublicTimelineNow:(CBPublicTimelineParams*)params error:(NSError**)error;
+ (NSString*) getPublicTimeline:(id)delegate selector:(SEL)selector;           // - (void) publicTimelineLoaded:(NSArray*)statuses error:(NSError*)error;
+ (NSString*) getPublicTimeline:(id)delegate selector:(SEL)selector params:(CBPublicTimelineParams*)params;

//Home Timeline
+ (NSArray*) getHomeTimelineNow;
+ (NSArray*) getHomeTimelineNow:(CBHomeTimelineParams*)params;
+ (NSArray*) getHomeTimelineNow:(CBHomeTimelineParams*)params error:(NSError**)error;
+ (NSString*) getHomeTimeline:(id)delegate selector:(SEL)selector;           // - (void) homeTimelineLoaded:(NSArray*)statuses error:(NSError*)error;
+ (NSString*) getHomeTimeline:(id)delegate selector:(SEL)selector params:(CBHomeTimelineParams*)params;

//User Timeline
+ (NSArray*) getUserTimelineNow;
+ (NSArray*) getUserTimelineNow:(CBUserTimelineParams*)params;
+ (NSArray*) getUserTimelineNow:(CBUserTimelineParams*)params error:(NSError**)error;
+ (NSString*) getUserTimeline:(id)delegate selector:(SEL)selector;           // - (void) userTimelineLoaded:(NSArray*)statuses error:(NSError*)error;
+ (NSString*) getUserTimeline:(id)delegate selector:(SEL)selector params:(CBUserTimelineParams*)params;

//Mentions
+ (NSArray*) getMentionsNow;
+ (NSArray*) getMentionsNow:(CBMentionsParams*)params;
+ (NSArray*) getMentionsNow:(CBMentionsParams*)params error:(NSError**)error;
+ (NSString*) getMentions:(id)delegate selector:(SEL)selector;           // - (void) mentionsLoaded:(NSArray*)statuses error:(NSError*)error;
+ (NSString*) getMentions:(id)delegate selector:(SEL)selector params:(CBMentionsParams*)params;

//Retweeted By Me
+ (NSArray*) getRetweetedByMeNow;
+ (NSArray*) getRetweetedByMeNow:(CBRetweetedByMeParams*)params;
+ (NSArray*) getRetweetedByMeNow:(CBRetweetedByMeParams*)params error:(NSError**)error;
+ (NSString*) getRetweetedByMe:(id)delegate selector:(SEL)selector;           // - (void) retweetedByMeLoaded:(NSArray*)statuses error:(NSError*)error;
+ (NSString*) getRetweetedByMe:(id)delegate selector:(SEL)selector params:(CBRetweetedByMeParams*)params;

//Retweeted To Me
+ (NSArray*) getRetweetedToMeNow;
+ (NSArray*) getRetweetedToMeNow:(CBRetweetedToMeParams*)params;
+ (NSArray*) getRetweetedToMeNow:(CBRetweetedToMeParams*)params error:(NSError**)error;
+ (NSString*) getRetweetedToMe:(id)delegate selector:(SEL)selector;           // - (void) retweetedToMeLoaded:(NSArray*)statuses error:(NSError*)error;
+ (NSString*) getRetweetedToMe:(id)delegate selector:(SEL)selector params:(CBRetweetedToMeParams*)params;

//Retweets Of Me
+ (NSArray*) getRetweetsOfMeNow;
+ (NSArray*) getRetweetsOfMeNow:(CBRetweetsOfMeParams*)params;
+ (NSArray*) getRetweetsOfMeNow:(CBRetweetsOfMeParams*)params error:(NSError**)error;
+ (NSString*) getRetweetsOfMe:(id)delegate selector:(SEL)selector;           // - (void) retweetsOfMeLoaded:(NSArray*)statuses error:(NSError*)error;
+ (NSString*) getRetweetsOfMe:(id)delegate selector:(SEL)selector params:(CBRetweetsOfMeParams*)params;

@end
