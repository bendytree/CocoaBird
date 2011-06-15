//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Timeline.h"




@implementation CBPublicTimelineParams
@synthesize trim_user, include_entities;
@end


@implementation CBHomeTimelineParams
@synthesize since_id, max_id, count, page, trim_user, include_entities;
@end


@implementation CBUserTimelineParams
@synthesize user_id, screen_name, since_id, max_id, count, page, trim_user, include_rts, include_entities;
@end


@implementation CBMentionsParams
@synthesize since_id, max_id, count, page, trim_user, include_rts, include_entities;
@end


@implementation CBRetweetedByMeParams
@synthesize since_id, max_id, count, page, trim_user, include_entities;
@end


@implementation CBRetweetedToMeParams
@synthesize since_id, max_id, count, page, trim_user, include_entities;
@end


@implementation CBRetweetsOfMeParams
@synthesize since_id, max_id, count, page, trim_user, include_entities;
@end



@implementation CocoaBird (Timeline)

#pragma Public Timeline

+ (NSArray*) getPublicTimelineNow
{
    return [self getPublicTimelineNow:nil];
}

+ (NSArray*) getPublicTimelineNow:(CBPublicTimelineParams*)params
{
    return [self getPublicTimelineNow:params error:nil];
}

+ (NSArray*) getPublicTimelineNow:(CBPublicTimelineParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/public_timeline.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] error:error];
}

+ (NSString*) getPublicTimeline:(id)delegate selector:(SEL)selector           // - (void) publicTimelineLoaded:(NSArray*)statuses error:(NSError*)error;
{
    return [self getPublicTimeline:delegate selector:selector params:nil];
}

+ (NSString*) getPublicTimeline:(id)delegate selector:(SEL)selector params:(CBPublicTimelineParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/public_timeline.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] delegate:delegate selector:selector];
}


#pragma Home Timeline

+ (NSArray*) getHomeTimelineNow
{
    return [self getHomeTimelineNow:nil];
}

+ (NSArray*) getHomeTimelineNow:(CBHomeTimelineParams*)params
{
    return [self getHomeTimelineNow:params error:nil];
}

+ (NSArray*) getHomeTimelineNow:(CBHomeTimelineParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/home_timeline.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] error:error];
}

+ (NSString*) getHomeTimeline:(id)delegate selector:(SEL)selector
{
    return [self getHomeTimeline:delegate selector:selector params:nil];
}

+ (NSString*) getHomeTimeline:(id)delegate selector:(SEL)selector params:(CBHomeTimelineParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/home_timeline.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] delegate:delegate selector:selector];
}


#pragma User Timeline

+ (NSArray*) getUserTimelineNow
{
    return [self getUserTimelineNow:nil];
}

+ (NSArray*) getUserTimelineNow:(CBUserTimelineParams*)params
{
    return [self getUserTimelineNow:params error:nil];
}

+ (NSArray*) getUserTimelineNow:(CBUserTimelineParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/user_timeline.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] error:error];
}

+ (NSString*) getUserTimeline:(id)delegate selector:(SEL)selector
{
    return [self getUserTimeline:delegate selector:selector params:nil];
}

+ (NSString*) getUserTimeline:(id)delegate selector:(SEL)selector params:(CBUserTimelineParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/user_timeline.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] delegate:delegate selector:selector];
}


#pragma Mentions

+ (NSArray*) getMentionsNow
{
    return [self getMentionsNow:nil];
}

+ (NSArray*) getMentionsNow:(CBMentionsParams*)params
{
    return [self getMentionsNow:params error:nil];
}

+ (NSArray*) getMentionsNow:(CBMentionsParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/mentions.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] error:error];
}

+ (NSString*) getMentions:(id)delegate selector:(SEL)selector
{
    return [self getMentions:delegate selector:selector params:nil];
}

+ (NSString*) getMentions:(id)delegate selector:(SEL)selector params:(CBMentionsParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/mentions.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] delegate:delegate selector:selector];
}


#pragma Retweeted By Me

+ (NSArray*) getRetweetedByMeNow
{
    return [self getRetweetedByMeNow:nil];
}

+ (NSArray*) getRetweetedByMeNow:(CBRetweetedByMeParams*)params
{
    return [self getRetweetedByMeNow:params error:nil];
}

+ (NSArray*) getRetweetedByMeNow:(CBRetweetedByMeParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/retweeted_by_me.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] error:error];
}

+ (NSString*) getRetweetedByMe:(id)delegate selector:(SEL)selector
{
    return [self getRetweetedByMe:delegate selector:selector params:nil];
}

+ (NSString*) getRetweetedByMe:(id)delegate selector:(SEL)selector params:(CBRetweetedByMeParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/retweeted_by_me.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] delegate:delegate selector:selector];
}


#pragma Retweeted To Me

+ (NSArray*) getRetweetedToMeNow
{
    return [self getRetweetedToMeNow:nil];
}

+ (NSArray*) getRetweetedToMeNow:(CBRetweetedToMeParams*)params
{
    return [self getRetweetedToMeNow:params error:nil];
}

+ (NSArray*) getRetweetedToMeNow:(CBRetweetedToMeParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/retweeted_to_me.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] error:error];
}

+ (NSString*) getRetweetedToMe:(id)delegate selector:(SEL)selector
{
    return [self getRetweetedToMe:delegate selector:selector params:nil];
}

+ (NSString*) getRetweetedToMe:(id)delegate selector:(SEL)selector params:(CBRetweetedToMeParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/retweeted_to_me.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] delegate:delegate selector:selector];
}


#pragma Retweets Of Me

+ (NSArray*) getRetweetsOfMeNow
{
    return [self getRetweetsOfMeNow:nil];
}

+ (NSArray*) getRetweetsOfMeNow:(CBRetweetsOfMeParams*)params
{
    return [self getRetweetsOfMeNow:params error:nil];
}

+ (NSArray*) getRetweetsOfMeNow:(CBRetweetsOfMeParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/retweets_of_me.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] error:error];
}

+ (NSString*) getRetweetsOfMe:(id)delegate selector:(SEL)selector
{
    return [self getRetweetsOfMe:delegate selector:selector params:nil];
}

+ (NSString*) getRetweetsOfMe:(id)delegate selector:(SEL)selector params:(CBRetweetsOfMeParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/retweets_of_me.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] delegate:delegate selector:selector];
}

@end
