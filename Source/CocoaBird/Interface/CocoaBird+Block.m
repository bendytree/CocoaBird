//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Block.h"
#import "CocoaBirdSettings.h"


@implementation CBIsBlockingParams
@synthesize user_id, screen_name, include_entities, skip_status;
@end

@implementation CBGetBlockedUsersParams
@synthesize page, per_page, include_entities, skip_status;
@end

@implementation CBBlockUserParams
@synthesize user_id, screen_name, include_entities, skip_status;
@end

@implementation CBUnblockUserParams
@synthesize user_id, screen_name, include_entities, skip_status;
@end


@implementation CocoaBird (Block)

#pragma Is Blocking

+ (CBUser*) isBlockingNow:(CBIsBlockingParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/blocks/exist.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBUser class] error:error];
}

+ (CBRequestId*) isBlocking:(id)delegate selector:(SEL)selector params:(CBIsBlockingParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/blocks/exist.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBUser class] delegate:delegate selector:selector];    
}


#pragma Get Blocked Users

+ (NSArray*) getBlockedUsersNow:(CBGetBlockedUsersParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/blocks/blocking.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBUser class] error:error];
}

+ (CBRequestId*) getBlockedUsers:(id)delegate selector:(SEL)selector params:(CBGetBlockedUsersParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/blocks/blocking.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBUser class] delegate:delegate selector:selector];    
}


#pragma Get Blocked User Ids

+ (NSArray*) getBlockedUserIdsNow:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/blocks/blocking/ids.json" method:@"GET" params:nil type:CBTwitterResponseTypeNatural class:nil error:error];
}

+ (CBRequestId*) getBlockedUserIds:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/blocks/blocking/ids.json" method:@"GET" params:nil type:CBTwitterResponseTypeNatural class:nil delegate:delegate selector:selector];    
}


#pragma Block User

+ (CBUser*) blockUserNow:(CBBlockUserParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/blocks/create.json" method:@"POST" params:params type:CBTwitterResponseTypeCustom class:[CBUser class] error:error];
}

+ (CBRequestId*) blockUser:(id)delegate selector:(SEL)selector params:(CBBlockUserParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/blocks/create.json" method:@"POST" params:params type:CBTwitterResponseTypeCustom class:[CBUser class] delegate:delegate selector:selector];    
}


#pragma Unblock User

+ (CBUser*) unblockUserNow:(CBUnblockUserParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/blocks/destroy.json" method:@"POST" params:params type:CBTwitterResponseTypeCustom class:[CBUser class] error:error];
}

+ (CBRequestId*) unblockUser:(id)delegate selector:(SEL)selector params:(CBUnblockUserParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/blocks/destroy.json" method:@"POST" params:params type:CBTwitterResponseTypeCustom class:[CBUser class] delegate:delegate selector:selector];    
}


@end
