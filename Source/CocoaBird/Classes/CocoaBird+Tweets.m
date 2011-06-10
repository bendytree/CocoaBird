//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Tweets.h"
#import "CocoaBirdBase.h"

@implementation CocoaBird (Tweets)

#pragma Public Timeline

+ (NSArray*) getPublicTimeline
{
    return [self getPublicTimeline:nil];
}

+ (NSArray*) getPublicTimeline:(CBPublicTimelineParams*)params
{
    return [self getPublicTimeline:params error:nil];
}

+ (NSArray*) getPublicTimeline:(CBPublicTimelineParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/public_timeline.json" params:params type:CBTwitterResponseTypeStatuses error:error];
}

+ (NSString*) loadPublicTimeline:(id)delegate selector:(SEL)selector           // - (void) publicTimelineLoaded:(NSArray*)statuses error:(NSError*)error;
{
    return [self loadPublicTimeline:delegate selector:selector params:nil];
}

+ (NSString*) loadPublicTimeline:(id)delegate selector:(SEL)selector params:(CBPublicTimelineParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/public_timeline.json" params:params type:CBTwitterResponseTypeStatuses delegate:delegate selector:selector];
}


#pragma Home Timeline

+ (NSArray*) getHomeTimeline
{
    return [self getHomeTimeline:nil];
}

+ (NSArray*) getHomeTimeline:(CBHomeTimelineParams*)params
{
    return [self getHomeTimeline:params error:nil];
}

+ (NSArray*) getHomeTimeline:(CBHomeTimelineParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/home_timeline.json" params:params type:CBTwitterResponseTypeStatuses error:error];
}

+ (NSString*) loadHomeTimeline:(id)delegate selector:(SEL)selector
{
    return [self loadHomeTimeline:delegate selector:selector params:nil];
}

+ (NSString*) loadHomeTimeline:(id)delegate selector:(SEL)selector params:(CBHomeTimelineParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/home_timeline.json" params:params type:CBTwitterResponseTypeStatuses delegate:delegate selector:selector];
}


#pragma User Timeline

+ (NSArray*) getUserTimeline
{
    return [self getUserTimeline:nil];
}

+ (NSArray*) getUserTimeline:(CBUserTimelineParams*)params
{
    return [self getUserTimeline:params error:nil];
}

+ (NSArray*) getUserTimeline:(CBUserTimelineParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/user_timeline.json" params:params type:CBTwitterResponseTypeStatuses error:error];
}

+ (NSString*) loadUserTimeline:(id)delegate selector:(SEL)selector
{
    return [self loadUserTimeline:delegate selector:selector params:nil];
}

+ (NSString*) loadUserTimeline:(id)delegate selector:(SEL)selector params:(CBUserTimelineParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/user_timeline.json" params:params type:CBTwitterResponseTypeStatuses delegate:delegate selector:selector];
}


#pragma Mentions

+ (NSArray*) getMentions
{
    return [self getMentions:nil];
}

+ (NSArray*) getMentions:(CBMentionsParams*)params
{
    return [self getMentions:params error:nil];
}

+ (NSArray*) getMentions:(CBMentionsParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/mentions.json" params:params type:CBTwitterResponseTypeStatuses error:error];
}

+ (NSString*) loadMentions:(id)delegate selector:(SEL)selector
{
    return [self loadMentions:delegate selector:selector params:nil];
}

+ (NSString*) loadMentions:(id)delegate selector:(SEL)selector params:(CBMentionsParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/mentions.json" params:params type:CBTwitterResponseTypeStatuses delegate:delegate selector:selector];
}


#pragma Retweeted By Me

+ (NSArray*) getRetweetedByMe
{
    return [self getRetweetedByMe:nil];
}

+ (NSArray*) getRetweetedByMe:(CBRetweetedByMeParams*)params
{
    return [self getRetweetedByMe:params error:nil];
}

+ (NSArray*) getRetweetedByMe:(CBRetweetedByMeParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/retweeted_by_me.json" params:params type:CBTwitterResponseTypeStatuses error:error];
}

+ (NSString*) loadRetweetedByMe:(id)delegate selector:(SEL)selector
{
    return [self loadRetweetedByMe:delegate selector:selector params:nil];
}

+ (NSString*) loadRetweetedByMe:(id)delegate selector:(SEL)selector params:(CBRetweetedByMeParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/retweeted_by_me.json" params:params type:CBTwitterResponseTypeStatuses delegate:delegate selector:selector];
}


#pragma Retweeted To Me

+ (NSArray*) getRetweetedToMe
{
    return [self getRetweetedToMe:nil];
}

+ (NSArray*) getRetweetedToMe:(CBRetweetedToMeParams*)params
{
    return [self getRetweetedToMe:params error:nil];
}

+ (NSArray*) getRetweetedToMe:(CBRetweetedToMeParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/retweeted_to_me.json" params:params type:CBTwitterResponseTypeStatuses error:error];
}

+ (NSString*) loadRetweetedToMe:(id)delegate selector:(SEL)selector
{
    return [self loadRetweetedToMe:delegate selector:selector params:nil];
}

+ (NSString*) loadRetweetedToMe:(id)delegate selector:(SEL)selector params:(CBRetweetedToMeParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/retweeted_to_me.json" params:params type:CBTwitterResponseTypeStatuses delegate:delegate selector:selector];
}


#pragma Retweets Of Me

+ (NSArray*) getRetweetsOfMe
{
    return [self getRetweetsOfMe:nil];
}

+ (NSArray*) getRetweetsOfMe:(CBRetweetsOfMeParams*)params
{
    return [self getRetweetsOfMe:params error:nil];
}

+ (NSArray*) getRetweetsOfMe:(CBRetweetsOfMeParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/retweets_of_me.json" params:params type:CBTwitterResponseTypeStatuses error:error];
}

+ (NSString*) loadRetweetsOfMe:(id)delegate selector:(SEL)selector
{
    return [self loadRetweetsOfMe:delegate selector:selector params:nil];
}

+ (NSString*) loadRetweetsOfMe:(id)delegate selector:(SEL)selector params:(CBRetweetsOfMeParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/retweets_of_me.json" params:params type:CBTwitterResponseTypeStatuses delegate:delegate selector:selector];
}

@end
