//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Friendship.h"
#import "CocoaBirdSettings.h"


@implementation CBFollowParams
@synthesize user_id, screen_name, follow, include_entities, skip_status;
@end

@implementation CBUnfollowParams
@synthesize user_id, screen_name, include_entities, skip_status;
@end

@implementation CBGetFriendshipParams
@synthesize source_id, source_screen_name, target_id, target_screen_name;
@end


@implementation CocoaBird (Friendship)

#pragma Follow

+ (CBUser*) followByIdNow:(int)user_id
{
    return [self followByIdNow:user_id error:nil];
}

+ (CBUser*) followByIdNow:(int)user_id error:(NSError**)error
{
    CBFollowParams* params = [CBFollowParams params];
    params.user_id = [NSNumber numberWithInt:user_id];
    return [self followNow:params error:error];
}

+ (CBUser*) followByScreenNameNow:(NSString*)screen_name
{
    return [self followByScreenNameNow:screen_name error:nil];
}

+ (CBUser*) followByScreenNameNow:(NSString*)screen_name error:(NSError**)error
{
    CBFollowParams* params = [CBFollowParams params];
    params.screen_name = screen_name;
    return [self followNow:params error:nil];
}

+ (CBUser*) followNow:(CBFollowParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/friendships/create.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBUser class] error:error];
}

+ (NSString*) followById:(int)user_id delegate:(id)delegate selector:(SEL)selector
{
    CBFollowParams* params = [CBFollowParams params];
    params.user_id = [NSNumber numberWithInt:user_id];
    return [self follow:self selector:selector params:params];
}

+ (NSString*) followByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector
{
    CBFollowParams* params = [CBFollowParams params];
    params.screen_name = screen_name;
    return [self follow:self selector:selector params:params];
}

+ (NSString*) follow:(id)delegate selector:(SEL)selector params:(CBFollowParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/friendships/create.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBUser class] delegate:delegate selector:selector];    
}


#pragma Unfollow

+ (CBUser*) unfollowByIdNow:(int)user_id
{
    return [self unfollowByIdNow:user_id error:nil];
}

+ (CBUser*) unfollowByIdNow:(int)user_id error:(NSError**)error
{
    CBUnfollowParams* params = [CBUnfollowParams params];
    params.user_id = [NSNumber numberWithInt:user_id];
    return [self unfollowNow:params error:error];
}

+ (CBUser*) unfollowByScreenNameNow:(NSString*)screen_name
{
    return [self unfollowByScreenNameNow:screen_name error:nil];
}

+ (CBUser*) unfollowByScreenNameNow:(NSString*)screen_name error:(NSError**)error
{
    CBUnfollowParams* params = [CBUnfollowParams params];
    params.screen_name = screen_name;
    return [self unfollowNow:params error:nil];
}

+ (CBUser*) unfollowNow:(CBUnfollowParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/friendships/destroy.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBUser class] error:error];
}

+ (NSString*) unfollowById:(int)user_id delegate:(id)delegate selector:(SEL)selector
{
    CBUnfollowParams* params = [CBUnfollowParams params];
    params.user_id = [NSNumber numberWithInt:user_id];
    return [self unfollow:self selector:selector params:params];
}

+ (NSString*) unfollowByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector
{
    CBUnfollowParams* params = [CBUnfollowParams params];
    params.screen_name = screen_name;
    return [self unfollow:self selector:selector params:params];
}

+ (NSString*) unfollow:(id)delegate selector:(SEL)selector params:(CBUnfollowParams*)params
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/friendships/destroy.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBUser class] delegate:delegate selector:selector];    
}


#pragma Get Friendship

+ (CBFriendship*) getFriendshipFromUserIdNow:(int)source_id to:(int)target_id
{
    return [self getFriendshipFromUserIdNow:source_id to:target_id error:nil];
}

+ (CBFriendship*) getFriendshipFromUserIdNow:(int)source_id to:(int)target_id error:(NSError**)error
{
    CBGetFriendshipParams* params = [CBGetFriendshipParams params];
    params.source_id = [NSNumber numberWithInt:source_id];
    params.target_id = [NSNumber numberWithInt:target_id];
    return [self getFriendshipNow:params error:error];
}

+ (CBFriendship*) getFriendshipFromScreenNameNow:(NSString*)source_screen_name to:(NSString*)target_screen_name
{
    return [self getFriendshipFromScreenNameNow:source_screen_name to:target_screen_name error:nil];
}

+ (CBFriendship*) getFriendshipFromScreenNameNow:(NSString*)source_screen_name to:(NSString*)target_screen_name error:(NSError**)error
{
    CBGetFriendshipParams* params = [CBGetFriendshipParams params];
    params.source_screen_name = source_screen_name;
    params.target_screen_name = target_screen_name;
    return [self getFriendshipNow:params error:error];   
}

+ (CBFriendship*) getFriendshipNow:(CBGetFriendshipParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/friendships/show.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBFriendship class] error:error];
}

+ (NSString*) getFriendshipFromUserId:(int)source_id to:(int)target_id delegate:(id)delegate selector:(SEL)selector
{
    CBGetFriendshipParams* params = [CBGetFriendshipParams params];
    params.source_id = [NSNumber numberWithInt:source_id];
    params.target_id = [NSNumber numberWithInt:target_id];
    return [self getFriendship:params delegate:delegate selector:selector];
}

+ (NSString*) getFriendshipFromScreenName:(NSString*)source_screen_name to:(NSString*)target_screen_name delegate:(id)delegate selector:(SEL)selector
{
    CBGetFriendshipParams* params = [CBGetFriendshipParams params];
    params.source_screen_name = source_screen_name;
    params.target_screen_name = target_screen_name;
    return [self getFriendship:params delegate:delegate selector:selector];
}

+ (NSString*) getFriendship:(CBGetFriendshipParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/friendships/show.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBFriendship class] delegate:delegate selector:selector];    
}


@end
