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

@implementation CBGetSentDirectMessagesParams
@synthesize since_id, max_id, count, page, skip_status, include_entities;
@end

@implementation CBSendDirectMessageParams
@synthesize screen_name, user_id, text, skip_status, include_entities;
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
    return [self processRequestSynchronous:@"api.twitter.com/1/direct_messages.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBDirectMessage class] error:error];
}

+ (CBRequestId*) getDirectMessages:(id)delegate selector:(SEL)selector
{
    return [self getDirectMessages:delegate selector:selector params:nil];
}

+ (CBRequestId*) getDirectMessages:(id)delegate selector:(SEL)selector params:(CBGetDirectMessagesParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/direct_messages.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBDirectMessage class] delegate:delegate selector:selector];
}


#pragma Get Sent Direct Messages

+ (NSArray*) getSentDirectMessagesNow
{
    return [self getSentDirectMessagesNow:nil];
}

+ (NSArray*) getSentDirectMessagesNow:(CBGetSentDirectMessagesParams*)params
{
    return [self getSentDirectMessagesNow:params error:nil];
}

+ (NSArray*) getSentDirectMessagesNow:(CBGetSentDirectMessagesParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/direct_messages/sent.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBDirectMessage class] error:error];
}

+ (CBRequestId*) getSentDirectMessages:(id)delegate selector:(SEL)selector
{
    return [self getSentDirectMessages:delegate selector:selector params:nil];
}

+ (CBRequestId*) getSentDirectMessages:(id)delegate selector:(SEL)selector params:(CBGetSentDirectMessagesParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/direct_messages/sent.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBDirectMessage class] delegate:delegate selector:selector];
}


#pragma Send Direct Message

+ (CBDirectMessage*) sendDirectMessageNow:(NSString*)text toUserId:(int)user_id
{
    return [self sendDirectMessageNow:text toUserId:user_id error:nil];
}

+ (CBDirectMessage*) sendDirectMessageNow:(NSString*)text toUserId:(int)user_id error:(NSError**)error
{
    CBSendDirectMessageParams* params = [CBSendDirectMessageParams params];
    params.text = text;
    params.user_id = [NSNumber numberWithInt:user_id];
    return [self sendDirectMessageNow:params error:error];
}

+ (CBDirectMessage*) sendDirectMessageNow:(NSString*)text toScreenName:(NSString*)screen_name
{
    return [self sendDirectMessageNow:text toScreenName:screen_name error:nil];
}

+ (CBDirectMessage*) sendDirectMessageNow:(NSString*)text toScreenName:(NSString*)screen_name error:(NSError**)error
{
    CBSendDirectMessageParams* params = [CBSendDirectMessageParams params];
    params.text = text;
    params.screen_name = screen_name;
    return [self sendDirectMessageNow:params error:error];
}

+ (CBDirectMessage*) sendDirectMessageNow:(CBSendDirectMessageParams*)params
{
    return [self sendDirectMessageNow:params error:nil];
}

+ (CBDirectMessage*) sendDirectMessageNow:(CBSendDirectMessageParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/direct_messages/new.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBDirectMessage class] error:error];
}

+ (CBRequestId*) sendDirectMessage:(NSString*)text toUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector
{
    CBSendDirectMessageParams* params = [CBSendDirectMessageParams params];
    params.text = text;
    params.user_id = [NSNumber numberWithInt:user_id];
    return [self sendDirectMessage:delegate selector:selector params:params];
}

+ (CBRequestId*) sendDirectMessage:(NSString*)text toScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector
{
    CBSendDirectMessageParams* params = [CBSendDirectMessageParams params];
    params.text = text;
    params.screen_name = screen_name;
    return [self sendDirectMessage:delegate selector:selector params:params];
}

+ (CBRequestId*) sendDirectMessage:(id)delegate selector:(SEL)selector params:(CBSendDirectMessageParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/direct_messages/new.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBDirectMessage class] delegate:delegate selector:selector];
}


#pragma Delete Direct Message

+ (CBDirectMessage*) deleteDirectMessageNow:(unsigned long long)id
{    
    return [self deleteDirectMessageNow:id error:nil];
}

+ (CBDirectMessage*) deleteDirectMessageNow:(unsigned long long)id error:(NSError**)error
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/direct_messages/destroy/%qu.json", id];
    return [self processRequestSynchronous:url method:@"POST" params:nil type:CBTwitterResponseTypeVoid class:nil error:error];
}

+ (CBRequestId*) deleteDirectMessage:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/direct_messages/destroy/%qu.json", id];
    return [self processRequestAsynchronous:url method:@"POST" params:nil type:CBTwitterResponseTypeObject class:[CBDirectMessage class] delegate:delegate selector:selector];    
}


@end
