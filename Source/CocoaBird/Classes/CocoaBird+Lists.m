//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Lists.h"
#import "CocoaBirdSettings.h"


@implementation CBGetListsParams
@synthesize user_id, screen_name, cursor;
@end


@implementation CocoaBird (Lists)

#pragma Lists by User Id

+ (NSArray*) getListsByUserIdNow:(int)user_id
{
    return [self getListsByUserIdNow:user_id params:nil];
}

+ (NSArray*) getListsByUserIdNow:(int)user_id params:(CBGetListsParams*)params
{
    return [self getListsByUserIdNow:user_id params:params error:nil];
}

+ (NSArray*) getListsByUserIdNow:(int)user_id params:(CBGetListsParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetListsParams params];
    params.user_id = [NSNumber numberWithInt:user_id];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBLists class] error:error];
}

+ (NSString*) getListsByUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector
{
    return [self getListsByUserId:user_id delegate:delegate selector:selector params:nil];
}

+ (NSString*) getListsByUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListsParams*)params
{
    params = params ? params : [CBGetListsParams params];
    params.user_id = [NSNumber numberWithInt:user_id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBLists class] delegate:delegate selector:selector];    
}


#pragma Lists by Screen Name

+ (NSArray*) getListsNow
{
    return [self getListsByScreenNameNow:[CocoaBirdSettings screenname]];
}

+ (NSArray*) getListsByScreenNameNow:(NSString*)screen_name
{
    return [self getListsByScreenNameNow:screen_name params:nil];
}

+ (NSArray*) getListsByScreenNameNow:(NSString*)screen_name params:(CBGetListsParams*)params
{
    return [self getListsByScreenNameNow:screen_name params:params error:nil];
}

+ (NSArray*) getListsByScreenNameNow:(NSString*)screen_name params:(CBGetListsParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetListsParams params];
    params.screen_name = screen_name;
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBLists class] error:error];
}

+ (NSString*) getLists:(id)delegate selector:(SEL)selector
{
    return [self getListsByScreenName:[CocoaBirdSettings screenname] delegate:delegate selector:selector];
}

+ (NSString*) getListsByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector
{
    return [self getListsByScreenName:screen_name delegate:delegate selector:selector params:nil];
}

+ (NSString*) getListsByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetListsParams*)params
{
    params = params ? params : [CBGetListsParams params];
    params.screen_name = screen_name;
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBLists class] delegate:delegate selector:selector];    
}



@end
