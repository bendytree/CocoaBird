//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+ListMembers.h"
#import "CocoaBirdSettings.h"


@implementation CBGetListMembersParams
@synthesize list_id, slug, owner_id, owner_screen_name, cursor, include_entities, skip_status;
@end



@implementation CocoaBird (ListMembers)


#pragma List Members by Id

+ (CBListMembers*) getListMembersByIdNow:(int)list_id
{
    return [self getListMembersByIdNow:list_id params:nil];
}

+ (CBListMembers*) getListMembersByIdNow:(int)list_id params:(CBGetListMembersParams*)params
{
    return [self getListMembersByIdNow:list_id params:params error:nil];
}

+ (CBListMembers*) getListMembersByIdNow:(int)list_id params:(CBGetListMembersParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetListMembersParams params];
    params.list_id = [NSNumber numberWithInt:list_id];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/members.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBListMembers class] error:error];
}

+ (NSString*) getListMembersById:(int)list_id delegate:(id)delegate selector:(SEL)selector
{
    return [self getListMembersById:list_id delegate:delegate selector:selector params:nil];
}

+ (NSString*) getListMembersById:(int)list_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListMembersParams*)params
{
    params = params ? params : [CBGetListMembersParams params];
    params.list_id = [NSNumber numberWithInt:list_id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/members.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBListMembers class] delegate:delegate selector:selector];    
}


#pragma List Members by Name & User Id

+ (CBListMembers*) getListMembersByNameNow:(NSString*)slug userId:(int)user_id
{
    return [self getListMembersByNameNow:slug userId:user_id params:nil];
}

+ (CBListMembers*) getListMembersByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListMembersParams*)params
{
    return [self getListMembersByNameNow:slug userId:user_id params:params error:nil];
}

+ (CBListMembers*) getListMembersByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListMembersParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetListMembersParams params];
    params.slug = slug;
    params.owner_id = [NSNumber numberWithInt:user_id];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/members.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBListMembers class] error:error];
}

+ (NSString*) getListMembersByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector
{
    return [self getListMembersByName:slug userId:user_id delegate:delegate selector:selector params:nil];
}

+ (NSString*) getListMembersByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListMembersParams*)params
{
    params = params ? params : [CBGetListMembersParams params];
    params.slug = slug;
    params.owner_id = [NSNumber numberWithInt:user_id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/members.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBListMembers class] delegate:delegate selector:selector];    
}


#pragma List Members by Name & Screen Name

+ (CBListMembers*) getListMembersByNameNow:(NSString*)slug screenName:(NSString*)screen_name
{
    return [self getListMembersByNameNow:slug screenName:screen_name params:nil];
}

+ (CBListMembers*) getListMembersByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListMembersParams*)params
{
    return [self getListMembersByNameNow:slug screenName:screen_name params:params error:nil];
}

+ (CBListMembers*) getListMembersByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListMembersParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetListMembersParams params];
    params.slug = slug;
    params.owner_screen_name = screen_name;
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/members.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBListMembers class] error:error];
}

+ (NSString*) getListMembersByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector
{
    return [self getListMembersByName:slug screenName:screen_name delegate:delegate selector:selector params:nil];
}

+ (NSString*) getListMembersByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetListMembersParams*)params
{
    params = params ? params : [CBGetListMembersParams params];
    params.slug = slug;
    params.owner_screen_name = screen_name;
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/members.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBListMembers class] delegate:delegate selector:selector];    
}


@end