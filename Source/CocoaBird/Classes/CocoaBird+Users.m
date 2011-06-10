//
//  CocoaBird+Users.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Users.h"


@implementation CocoaBird (Users)


#pragma Show User By Id

+ (CBUser*) getUserByIdNow:(int)id
{
    return [self getUserByIdNow:id params:nil];
}

+ (CBUser*) getUserByIdNow:(int)id params:(CBGetUserParams*)params
{
    return [self getUserByIdNow:id params:params error:nil];
}

+ (CBUser*) getUserByIdNow:(int)id params:(CBGetUserParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetUserParams params];
    params.user_id = [NSNumber numberWithInt:id];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/users/show.json" params:params type:CBTwitterResponseTypeUser error:error];
}

+ (NSString*) getUserById:(int)id delegate:(id)delegate selector:(SEL)selector
{
    return [self getUserById:id delegate:delegate selector:selector params:nil];
}

+ (NSString*) getUserById:(int)id delegate:(id)delegate selector:(SEL)selector params:(CBGetUserParams*)params
{
    params = params ? params : [CBGetUserParams params];
    params.user_id = [NSNumber numberWithInt:id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/users/show.json" params:params type:CBTwitterResponseTypeUser delegate:delegate selector:selector];    
}


#pragma Show User By Screen Name

+ (CBUser*) getUserByScreenNameNow:(NSString*)screen_name
{
    return [self getUserByScreenNameNow:screen_name params:nil];
}

+ (CBUser*) getUserByScreenNameNow:(NSString*)screen_name params:(CBGetUserParams*)params
{
    return [self getUserByScreenNameNow:screen_name params:params error:nil];
}

+ (CBUser*) getUserByScreenNameNow:(NSString*)screen_name params:(CBGetUserParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetUserParams params];
    params.screen_name = screen_name;
    return [self processRequestSynchronous:@"http://api.twitter.com/1/users/show.json" params:params type:CBTwitterResponseTypeUser error:error];
}

+ (NSString*) getUserByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector
{
    return [self getUserByScreenName:screen_name delegate:delegate selector:selector params:nil];
}

+ (NSString*) getUserByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetUserParams*)params
{
    params = params ? params : [CBGetUserParams params];
    params.screen_name = screen_name;
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/users/show.json" params:params type:CBTwitterResponseTypeUser delegate:delegate selector:selector];    
}


#pragma Get Users By Ids

+ (CBUser*) getUsersByIdsNow:(NSArray*)user_ids
{
    return [self getUsersByIdsNow:user_ids params:nil];
}

+ (CBUser*) getUsersByIdsNow:(NSArray*)user_ids params:(CBGetUsersParams*)params
{
    return [self getUsersByIdsNow:user_ids params:params error:nil];
}

+ (CBUser*) getUsersByIdsNow:(NSArray*)user_ids params:(CBGetUsersParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetUsersParams params];
    params.user_id = [user_ids componentsJoinedByString:@","];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/users/lookup.json" params:params type:CBTwitterResponseTypeUsers error:error];
}

+ (NSString*) getUsersByIds:(NSArray*)user_ids delegate:(id)delegate selector:(SEL)selector
{
    return [self getUsersByIds:user_ids delegate:delegate selector:selector params:nil];
}

+ (NSString*) getUsersByIds:(NSArray*)user_ids delegate:(id)delegate selector:(SEL)selector params:(CBGetUsersParams*)params
{
    params = params ? params : [CBGetUsersParams params];
    params.user_id = [user_ids componentsJoinedByString:@","];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/users/lookup.json" params:params type:CBTwitterResponseTypeUsers delegate:delegate selector:selector];    
}


#pragma Get Users By Ids

+ (CBUser*) getUsersByScreenNamesNow:(NSArray*)screen_names
{
    return [self getUsersByScreenNamesNow:screen_names params:nil];
}

+ (CBUser*) getUsersByScreenNamesNow:(NSArray*)screen_names params:(CBGetUsersParams*)params
{
    return [self getUsersByScreenNamesNow:screen_names params:params error:nil];
}

+ (CBUser*) getUsersByScreenNamesNow:(NSArray*)screen_names params:(CBGetUsersParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetUsersParams params];
    params.screen_name = [screen_names componentsJoinedByString:@","];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/users/lookup.json" params:params type:CBTwitterResponseTypeUsers error:error];
}

+ (NSString*) getUsersByScreenNames:(NSArray*)screen_names delegate:(id)delegate selector:(SEL)selector
{
    return [self getUsersByScreenNames:screen_names delegate:delegate selector:selector params:nil];
}

+ (NSString*) getUsersByScreenNames:(NSArray*)screen_names delegate:(id)delegate selector:(SEL)selector params:(CBGetUsersParams*)params
{
    params = params ? params : [CBGetUsersParams params];
    params.screen_name = [screen_names componentsJoinedByString:@","];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/users/lookup.json" params:params type:CBTwitterResponseTypeUsers delegate:delegate selector:selector];    
}

@end
