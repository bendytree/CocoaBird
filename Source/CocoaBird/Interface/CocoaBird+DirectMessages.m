//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+DirectMessages.h"


@implementation CBGetDirectMessagesParams
@synthesize since_id, max_id, count, page, skip_status, include_entities;
@end



@implementation CocoaBird (DirectMessages)

#pragma Get Direct Messages

+ (NSArray*) getDirectMessagesNow
{
    return [self getDirectMessagesNow:nil];
}

+ (NSArray*) getDirectMessagesNow:(CBGetDirectMessagesParams*)params
{
    return [self getDirectMessagesNow:params error:nil];
}

+ (NSArray*) getDirectMessagesNow:(CBGetDirectMessagesParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/direct_messages.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBDirectMessage class] error:error];
}

+ (NSString*) getDirectMessages:(id)delegate selector:(SEL)selector
{
    return [self getDirectMessages:delegate selector:selector params:nil];
}

+ (NSString*) getDirectMessages:(id)delegate selector:(SEL)selector params:(CBGetDirectMessagesParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/direct_messages.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBDirectMessage class] delegate:delegate selector:selector];
}

@end
