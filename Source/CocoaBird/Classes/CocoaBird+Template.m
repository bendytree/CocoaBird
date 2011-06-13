//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Lists.h"

/*
@implementation CBPublicTimelineParams
@synthesize trim_user, include_entities;
@end
*/

@implementation CocoaBird (Lists)

/*
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
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/public_timeline.json" params:params type:CBTwitterResponseTypeStatuses error:error];
}

+ (NSString*) getPublicTimeline:(id)delegate selector:(SEL)selector           // - (void) publicTimelineLoaded:(NSArray*)statuses error:(NSError*)error;
{
    return [self getPublicTimeline:delegate selector:selector params:nil];
}

+ (NSString*) getPublicTimeline:(id)delegate selector:(SEL)selector params:(CBPublicTimelineParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/public_timeline.json" params:params type:CBTwitterResponseTypeStatuses delegate:delegate selector:selector];
}
*/

@end
