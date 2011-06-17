//
//  CocoaBird+Users.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Users.h"


@implementation CBGetUserParams
@synthesize user_id, screen_name, skip_status, include_entities;
@end

@implementation CBGetUsersParams
@synthesize user_id, screen_name, skip_status, include_entities;
@end

@implementation CBSearchUsersParams
@synthesize q, per_page, page, include_entities, skip_status;
@end

@implementation CBGetUserCategoriesParams
@synthesize lang;
@end

@implementation CBGetSuggestedUsersParams
@synthesize lang, slug;
@end

@implementation CBGetContributorsParams
@synthesize user_id, screen_name, skip_status, include_entities;
@end

@implementation CBGetContributeesParams
@synthesize user_id, screen_name, skip_status, include_entities;
@end




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
    return [self processRequestSynchronous:@"http://api.twitter.com/1/users/show.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBUser class] error:error];
}

+ (NSString*) getUserById:(int)id delegate:(id)delegate selector:(SEL)selector
{
    return [self getUserById:id delegate:delegate selector:selector params:nil];
}

+ (NSString*) getUserById:(int)id delegate:(id)delegate selector:(SEL)selector params:(CBGetUserParams*)params
{
    params = params ? params : [CBGetUserParams params];
    params.user_id = [NSNumber numberWithInt:id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/users/show.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBUser class] delegate:delegate selector:selector];    
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
    return [self processRequestSynchronous:@"http://api.twitter.com/1/users/show.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBUser class] error:error];
}

+ (NSString*) getUserByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector
{
    return [self getUserByScreenName:screen_name delegate:delegate selector:selector params:nil];
}

+ (NSString*) getUserByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetUserParams*)params
{
    params = params ? params : [CBGetUserParams params];
    params.screen_name = screen_name;
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/users/show.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBUser class] delegate:delegate selector:selector];    
}


#pragma Get Users By Ids

+ (NSArray*) getUsersByIdsNow:(NSArray*)user_ids
{
    return [self getUsersByIdsNow:user_ids params:nil];
}

+ (NSArray*) getUsersByIdsNow:(NSArray*)user_ids params:(CBGetUsersParams*)params
{
    return [self getUsersByIdsNow:user_ids params:params error:nil];
}

+ (NSArray*) getUsersByIdsNow:(NSArray*)user_ids params:(CBGetUsersParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetUsersParams params];
    params.user_id = [user_ids componentsJoinedByString:@","];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/users/lookup.json" method:@"POST" params:params type:CBTwitterResponseTypeArray class:[CBUser class] error:error];
}

+ (NSString*) getUsersByIds:(NSArray*)user_ids delegate:(id)delegate selector:(SEL)selector
{
    return [self getUsersByIds:user_ids delegate:delegate selector:selector params:nil];
}

+ (NSString*) getUsersByIds:(NSArray*)user_ids delegate:(id)delegate selector:(SEL)selector params:(CBGetUsersParams*)params
{
    params = params ? params : [CBGetUsersParams params];
    params.user_id = [user_ids componentsJoinedByString:@","];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/users/lookup.json" method:@"POST" params:params type:CBTwitterResponseTypeArray class:[CBUser class] delegate:delegate selector:selector];    
}


#pragma Get Users By Screen Names

+ (NSArray*) getUsersByScreenNamesNow:(NSArray*)screen_names
{
    return [self getUsersByScreenNamesNow:screen_names params:nil];
}

+ (NSArray*) getUsersByScreenNamesNow:(NSArray*)screen_names params:(CBGetUsersParams*)params
{
    return [self getUsersByScreenNamesNow:screen_names params:params error:nil];
}

+ (NSArray*) getUsersByScreenNamesNow:(NSArray*)screen_names params:(CBGetUsersParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetUsersParams params];
    params.screen_name = [screen_names componentsJoinedByString:@","];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/users/lookup.json" method:@"POST" params:params type:CBTwitterResponseTypeArray class:[CBUser class] error:error];
}

+ (NSString*) getUsersByScreenNames:(NSArray*)screen_names delegate:(id)delegate selector:(SEL)selector
{
    return [self getUsersByScreenNames:screen_names delegate:delegate selector:selector params:nil];
}

+ (NSString*) getUsersByScreenNames:(NSArray*)screen_names delegate:(id)delegate selector:(SEL)selector params:(CBGetUsersParams*)params
{
    params = params ? params : [CBGetUsersParams params];
    params.screen_name = [screen_names componentsJoinedByString:@","];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/users/lookup.json" method:@"POST" params:params type:CBTwitterResponseTypeArray class:[CBUser class] delegate:delegate selector:selector];    
}


#pragma Search Users

+ (NSArray*) searchUsersNow:(NSString*)query
{
    return [self searchUsersNow:query params:nil];
}

+ (NSArray*) searchUsersNow:(NSString*)query params:(CBSearchUsersParams*)params
{
    return [self searchUsersNow:query params:params error:nil];
}

+ (NSArray*) searchUsersNow:(NSString*)query params:(CBSearchUsersParams*)params error:(NSError**)error
{
    params = params ? params : [CBSearchUsersParams params];
    params.q = query;
    return [self processRequestSynchronous:@"http://api.twitter.com/1/users/search.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBUser class] error:error];
}

+ (NSString*) searchUsers:(NSString*)query delegate:(id)delegate selector:(SEL)selector
{
    return [self searchUsers:query delegate:delegate selector:selector params:nil];
}

+ (NSString*) searchUsers:(NSString*)query delegate:(id)delegate selector:(SEL)selector params:(CBSearchUsersParams*)params
{
    params = params ? params : [CBSearchUsersParams params];
    params.q = query;
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/users/search.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBUser class] delegate:delegate selector:selector];    
}


#pragma Get User Categories

+ (NSArray*) getUserCategoriesNow:(CBGetUserCategoriesParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/users/suggestions.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBUserCategory class] error:error];
}

+ (NSString*) getUserCategories:(CBGetUserCategoriesParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/users/suggestions.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBUserCategory class] delegate:delegate selector:selector];    
}


#pragma Get Suggested Users 

+ (CBSuggestedUsers*) getSuggestedUsersNow:(CBGetSuggestedUsersParams*)params error:(NSError**)error
{
    NSString* slug = [NSString stringWithFormat:@"http://api.twitter.com/1/users/suggestions/%@.json", params.slug];
    return [self processRequestSynchronous:slug method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBSuggestedUsers class] error:error];
}

+ (NSString*) getSuggestedUsers:(CBGetSuggestedUsersParams*)params delegate:(id)delegate selector:(SEL)selector
{
    NSString* slug = [NSString stringWithFormat:@"http://api.twitter.com/1/users/suggestions/%@.json", params.slug];
    return [self processRequestAsynchronous:slug method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBSuggestedUsers class] delegate:delegate selector:selector];    
}


#pragma Profile Image

+ (NSString*) buildProfileImageUrl:(NSString*)screen_name
{
    return [NSString stringWithFormat:@"http://api.twitter.com/1/users/profile_image/%@.json", screen_name];
}

+ (NSString*) buildProfileImageUrl:(NSString*)screen_name size:(NSString*)size
{
    return [NSString stringWithFormat:@"http://api.twitter.com/1/users/profile_image/%@.json?size=%@", screen_name, size];
}


#pragma Get Contributors 

+ (NSArray*) getContributorsNow:(CBGetContributorsParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/users/contributors.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBUser class] error:error];
}

+ (NSString*) getContributors:(CBGetContributorsParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/users/contributors.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBUser class] delegate:delegate selector:selector];    
}


#pragma Get Contributees 

+ (NSArray*) getContributeesNow:(CBGetContributeesParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/users/contributees.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBUser class] error:error];
}

+ (NSString*) getContributees:(CBGetContributeesParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/users/contributees.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBUser class] delegate:delegate selector:selector];    
}


@end
