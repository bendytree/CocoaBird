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

@end
