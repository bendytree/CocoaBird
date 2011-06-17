//
//  CocoaBird+Statuses.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Tweets.h"
#import "CBModels.h"

@implementation CBGetStatusParams
@synthesize trim_user, include_entities;
@end


@implementation CBUpdateStatusParams
@synthesize status, in_reply_to_status_id, lat, long_, place_id, display_coordinates, trim_user, include_entities;
@end


@implementation CBRetweetParams
@synthesize trim_user, include_entities;
@end


@implementation CBRetweetedByParams
@synthesize page, count;
@end


@implementation CBRetweetedByIdsParams
@synthesize page, count;
@end



@implementation CocoaBird (Tweets)

#pragma Show Status

+ (CBStatus*) getStatusNow:(unsigned long long)id
{
    return [self getStatusNow:id params:nil];
}

+ (CBStatus*) getStatusNow:(unsigned long long)id params:(CBGetStatusParams*)params
{
    return [self getStatusNow:id params:params error:nil];
}

+ (CBStatus*) getStatusNow:(unsigned long long)id params:(CBGetStatusParams*)params error:(NSError**)error
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/statuses/show/%qu.json", id];
    return [self processRequestSynchronous:url method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBStatus class] error:error];
}

+ (CBRequestId*) getStatus:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector
{
    return [self getStatus:id delegate:delegate selector:selector params:nil];
}

+ (CBRequestId*) getStatus:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector params:(CBGetStatusParams*)params
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/statuses/show/%qu.json", id];
    return [self processRequestAsynchronous:url method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBStatus class] delegate:delegate selector:selector];    
}



#pragma Update Status

+ (CBStatus*) updateStatusNow:(NSString*)status
{
    return [self updateStatusNow:status params:nil];
}

+ (CBStatus*) updateStatusNow:(NSString*)status params:(CBUpdateStatusParams*)params
{
    return [self updateStatusNow:status params:params error:nil];
}

+ (CBStatus*) updateStatusNow:(NSString*)status params:(CBUpdateStatusParams*)params error:(NSError**)error
{
    params = params ? params : [CBUpdateStatusParams params];
    params.status = status;
    return [self processRequestSynchronous:@"api.twitter.com/1/statuses/update.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBStatus class] error:error];
}

+ (CBRequestId*) updateStatus:(NSString*)status delegate:(id)delegate selector:(SEL)selector
{
    return [self updateStatus:status delegate:delegate selector:selector params:nil];
}

+ (CBRequestId*) updateStatus:(NSString*)status delegate:(id)delegate selector:(SEL)selector params:(CBUpdateStatusParams*)params
{
    params = params ? params : [CBUpdateStatusParams params];
    params.status = status;
    return [self processRequestAsynchronous:@"api.twitter.com/1/statuses/update.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBStatus class] delegate:delegate selector:selector];
}



#pragma Delete Status

+ (void) deleteStatusNow:(unsigned long long)id
{    
    [self deleteStatusNow:id error:nil];
}

+ (void) deleteStatusNow:(unsigned long long)id error:(NSError**)error
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/statuses/destroy/%qu.json", id];
    [self processRequestSynchronous:url method:@"POST" params:nil type:CBTwitterResponseTypeVoid class:nil error:error];
}

+ (CBRequestId*) deleteStatus:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/statuses/destroy/%qu.json", id];
    return [self processRequestAsynchronous:url method:@"POST" params:nil type:CBTwitterResponseTypeVoid class:nil delegate:delegate selector:selector];    
}


#pragma Retweet

+ (CBStatus*) retweetNow:(unsigned long long)id
{
    return [self retweetNow:id params:nil];
}

+ (CBStatus*) retweetNow:(unsigned long long)id params:(CBRetweetParams*)params
{
    return [self retweetNow:id params:params error:nil];
}

+ (CBStatus*) retweetNow:(unsigned long long)id params:(CBRetweetParams*)params error:(NSError**)error
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/statuses/retweet/%qu.json", id];
    return [self processRequestSynchronous:url method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBStatus class] error:error];
}

+ (CBRequestId*) retweet:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector
{
    return [self retweet:id delegate:delegate selector:selector params:nil];
}

+ (CBRequestId*) retweet:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector params:(CBRetweetParams*)params
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/statuses/retweet/%qu.json", id];
    return [self processRequestAsynchronous:url method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBStatus class] delegate:delegate selector:selector];    
}


#pragma Retweeted By

+ (NSArray*) getRetweetedByNow:(unsigned long long)id
{
    return [self getRetweetedByNow:id params:nil];
}

+ (NSArray*) getRetweetedByNow:(unsigned long long)id params:(CBRetweetedByParams*)params
{
    return [self getRetweetedByNow:id params:params error:nil];
}

+ (NSArray*) getRetweetedByNow:(unsigned long long)id params:(CBRetweetedByParams*)params error:(NSError**)error
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/statuses/%qu/retweeted_by.json", id];
    return [self processRequestSynchronous:url method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBUser class] error:error];
}

+ (CBRequestId*) getRetweetedBy:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector
{
    return [self getRetweetedBy:id delegate:delegate selector:selector params:nil];
}

+ (CBRequestId*) getRetweetedBy:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector params:(CBRetweetedByParams*)params
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/statuses/%qu/retweeted_by.json", id];
    return [self processRequestAsynchronous:url method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBUser class] delegate:delegate selector:selector];    
}


#pragma Retweeted By Ids

+ (NSArray*) getRetweetedByIdsNow:(unsigned long long)id
{
    return [self getRetweetedByIdsNow:id params:nil];
}

+ (NSArray*) getRetweetedByIdsNow:(unsigned long long)id params:(CBRetweetedByIdsParams*)params
{
    return [self getRetweetedByIdsNow:id params:params error:nil];
}

+ (NSArray*) getRetweetedByIdsNow:(unsigned long long)id params:(CBRetweetedByIdsParams*)params error:(NSError**)error
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/statuses/%qu/retweeted_by/ids.json", id];
    return [self processRequestSynchronous:url method:@"GET" params:params type:CBTwitterResponseTypeNatural class:nil error:error];
}

+ (CBRequestId*) getRetweetedByIds:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector
{
    return [self getRetweetedByIds:id delegate:delegate selector:selector params:nil];
}

+ (CBRequestId*) getRetweetedByIds:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector params:(CBRetweetedByIdsParams*)params
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/statuses/%qu/retweeted_by/ids.json", id];
    return [self processRequestAsynchronous:url method:@"GET" params:params type:CBTwitterResponseTypeNatural class:nil delegate:delegate selector:selector];    
}


@end
