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

@implementation CBGetMembershipListsParams
@synthesize user_id, screen_name, cursor, filter_to_owned_lists;
@end

@implementation CBGetSubscriptionListsParams
@synthesize user_id, screen_name, cursor;
@end

@implementation CBGetListParams
@synthesize list_id, slug, owner_screen_name, owner_id;
@end

@implementation CBGetListStatusesParams
@synthesize list_id, slug, owner_screen_name, owner_id, since_id,
            max_id, count, page, include_rts, include_entities;
@end

@implementation CBCreateListParams
@synthesize name, description, mode;
@end

@implementation CBUpdateListParams
@synthesize list_id, slug, owner_screen_name, owner_id, name, description, mode;
@end

@implementation CBDeleteListParams
@synthesize list_id, slug, owner_screen_name, owner_id;
@end


@implementation CocoaBird (Lists)

#pragma Lists by User Id

+ (CBLists*) getListsByUserIdNow:(int)user_id
{
    return [self getListsByUserIdNow:user_id params:nil];
}

+ (CBLists*) getListsByUserIdNow:(int)user_id params:(CBGetListsParams*)params
{
    return [self getListsByUserIdNow:user_id params:params error:nil];
}

+ (CBLists*) getListsByUserIdNow:(int)user_id params:(CBGetListsParams*)params error:(NSError**)error
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

+ (CBLists*) getListsNow
{
    return [self getListsByScreenNameNow:[CocoaBirdSettings screenname]];
}

+ (CBLists*) getListsByScreenNameNow:(NSString*)screen_name
{
    return [self getListsByScreenNameNow:screen_name params:nil];
}

+ (CBLists*) getListsByScreenNameNow:(NSString*)screen_name params:(CBGetListsParams*)params
{
    return [self getListsByScreenNameNow:screen_name params:params error:nil];
}

+ (CBLists*) getListsByScreenNameNow:(NSString*)screen_name params:(CBGetListsParams*)params error:(NSError**)error
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


#pragma Membership Lists by User Id

+ (CBLists*) getMembershipListsByUserIdNow:(int)user_id
{
    return [self getMembershipListsByUserIdNow:user_id params:nil];
}

+ (CBLists*) getMembershipListsByUserIdNow:(int)user_id params:(CBGetMembershipListsParams*)params
{
    return [self getMembershipListsByUserIdNow:user_id params:params error:nil];
}

+ (CBLists*) getMembershipListsByUserIdNow:(int)user_id params:(CBGetMembershipListsParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetMembershipListsParams params];
    params.user_id = [NSNumber numberWithInt:user_id];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/memberships.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBLists class] error:error];
}

+ (NSString*) getMembershipListsByUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector
{
    return [self getMembershipListsByUserId:user_id delegate:delegate selector:selector params:nil];
}

+ (NSString*) getMembershipListsByUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetMembershipListsParams*)params
{
    params = params ? params : [CBGetMembershipListsParams params];
    params.user_id = [NSNumber numberWithInt:user_id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/memberships.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBLists class] delegate:delegate selector:selector];    
}


#pragma Membership Lists by Screen Name

+ (CBLists*) getMembershipListsNow
{
    return [self getMembershipListsByScreenNameNow:[CocoaBirdSettings screenname]];
}

+ (CBLists*) getMembershipListsByScreenNameNow:(NSString*)screen_name
{
    return [self getMembershipListsByScreenNameNow:screen_name params:nil];
}

+ (CBLists*) getMembershipListsByScreenNameNow:(NSString*)screen_name params:(CBGetMembershipListsParams*)params
{
    return [self getMembershipListsByScreenNameNow:screen_name params:params error:nil];
}

+ (CBLists*) getMembershipListsByScreenNameNow:(NSString*)screen_name params:(CBGetMembershipListsParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetMembershipListsParams params];
    params.screen_name = screen_name;
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/memberships.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBLists class] error:error];
}

+ (NSString*) getMembershipLists:(id)delegate selector:(SEL)selector
{
    return [self getMembershipListsByScreenName:[CocoaBirdSettings screenname] delegate:delegate selector:selector];
}

+ (NSString*) getMembershipListsByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector
{
    return [self getMembershipListsByScreenName:screen_name delegate:delegate selector:selector params:nil];
}

+ (NSString*) getMembershipListsByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetMembershipListsParams*)params
{
    params = params ? params : [CBGetMembershipListsParams params];
    params.screen_name = screen_name;
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/memberships.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBLists class] delegate:delegate selector:selector];    
}


#pragma Subscription Lists by User Id

+ (CBLists*) getSubscriptionListsByUserIdNow:(int)user_id
{
    return [self getSubscriptionListsByUserIdNow:user_id params:nil];
}

+ (CBLists*) getSubscriptionListsByUserIdNow:(int)user_id params:(CBGetSubscriptionListsParams*)params
{
    return [self getSubscriptionListsByUserIdNow:user_id params:params error:nil];
}

+ (CBLists*) getSubscriptionListsByUserIdNow:(int)user_id params:(CBGetSubscriptionListsParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetSubscriptionListsParams params];
    params.user_id = [NSNumber numberWithInt:user_id];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/subscriptions.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBLists class] error:error];
}

+ (NSString*) getSubscriptionListsByUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector
{
    return [self getSubscriptionListsByUserId:user_id delegate:delegate selector:selector params:nil];
}

+ (NSString*) getSubscriptionListsByUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetSubscriptionListsParams*)params
{
    params = params ? params : [CBGetSubscriptionListsParams params];
    params.user_id = [NSNumber numberWithInt:user_id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/subscriptions.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBLists class] delegate:delegate selector:selector];    
}


#pragma Subscription Lists by Screen Name

+ (CBLists*) getSubscriptionListsNow
{
    return [self getSubscriptionListsByScreenNameNow:[CocoaBirdSettings screenname]];
}

+ (CBLists*) getSubscriptionListsByScreenNameNow:(NSString*)screen_name
{
    return [self getSubscriptionListsByScreenNameNow:screen_name params:nil];
}

+ (CBLists*) getSubscriptionListsByScreenNameNow:(NSString*)screen_name params:(CBGetSubscriptionListsParams*)params
{
    return [self getSubscriptionListsByScreenNameNow:screen_name params:params error:nil];
}

+ (CBLists*) getSubscriptionListsByScreenNameNow:(NSString*)screen_name params:(CBGetSubscriptionListsParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetSubscriptionListsParams params];
    params.screen_name = screen_name;
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/subscriptions.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBLists class] error:error];
}

+ (NSString*) getSubscriptionLists:(id)delegate selector:(SEL)selector
{
    return [self getSubscriptionListsByScreenName:[CocoaBirdSettings screenname] delegate:delegate selector:selector];
}

+ (NSString*) getSubscriptionListsByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector
{
    return [self getSubscriptionListsByScreenName:screen_name delegate:delegate selector:selector params:nil];
}

+ (NSString*) getSubscriptionListsByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetSubscriptionListsParams*)params
{
    params = params ? params : [CBGetSubscriptionListsParams params];
    params.screen_name = screen_name;
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/subscriptions.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBLists class] delegate:delegate selector:selector];    
}


#pragma List by Id

+ (CBList*) getListByIdNow:(int)list_id
{
    return [self getListByIdNow:list_id params:nil];
}

+ (CBList*) getListByIdNow:(int)list_id params:(CBGetListParams*)params
{
    return [self getListByIdNow:list_id params:params error:nil];
}

+ (CBList*) getListByIdNow:(int)list_id params:(CBGetListParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetListParams params];
    params.list_id = [NSNumber numberWithInt:list_id];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/show.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBList class] error:error];
}

+ (NSString*) getListById:(int)list_id delegate:(id)delegate selector:(SEL)selector
{
    return [self getListById:list_id delegate:delegate selector:selector params:nil];
}

+ (NSString*) getListById:(int)list_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListParams*)params
{
    params = params ? params : [CBGetListParams params];
    params.list_id = [NSNumber numberWithInt:list_id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/show.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBList class] delegate:delegate selector:selector];    
}


#pragma List by Name & User Id

+ (CBList*) getListByNameNow:(NSString*)slug userId:(int)user_id
{
    return [self getListByNameNow:slug userId:user_id params:nil];
}

+ (CBList*) getListByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListParams*)params
{
    return [self getListByNameNow:slug userId:user_id params:params error:nil];
}

+ (CBList*) getListByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetListParams params];
    params.slug = slug;
    params.owner_id = [NSNumber numberWithInt:user_id];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/show.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBList class] error:error];
}

+ (NSString*) getListByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector
{
    return [self getListByName:slug userId:user_id delegate:delegate selector:selector params:nil];
}

+ (NSString*) getListByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListParams*)params
{
    params = params ? params : [CBGetListParams params];
    params.slug = slug;
    params.owner_id = [NSNumber numberWithInt:user_id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/show.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBList class] delegate:delegate selector:selector];    
}


#pragma List by Name & Screen Name

+ (CBList*) getListByNameNow:(NSString*)slug screenName:(NSString*)screen_name
{
    return [self getListByNameNow:slug screenName:screen_name params:nil];
}

+ (CBList*) getListByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListParams*)params
{
    return [self getListByNameNow:slug screenName:screen_name params:params error:nil];
}

+ (CBList*) getListByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetListParams params];
    params.slug = slug;
    params.owner_screen_name = screen_name;
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/show.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBList class] error:error];
}

+ (NSString*) getListByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector
{
    return [self getListByName:slug screenName:screen_name delegate:delegate selector:selector params:nil];
}

+ (NSString*) getListByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetListParams*)params
{
    params = params ? params : [CBGetListParams params];
    params.slug = slug;
    params.owner_screen_name = screen_name;
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/show.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBList class] delegate:delegate selector:selector];    
}


#pragma List Statuses by Id

+ (NSArray*) getListStatusesByIdNow:(int)list_id
{
    return [self getListStatusesByIdNow:list_id params:nil];
}

+ (NSArray*) getListStatusesByIdNow:(int)list_id params:(CBGetListStatusesParams*)params
{
    return [self getListStatusesByIdNow:list_id params:params error:nil];
}

+ (NSArray*) getListStatusesByIdNow:(int)list_id params:(CBGetListStatusesParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetListStatusesParams params];
    params.list_id = [NSNumber numberWithInt:list_id];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/statuses.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] error:error];
}

+ (NSString*) getListStatusesById:(int)list_id delegate:(id)delegate selector:(SEL)selector
{
    return [self getListStatusesById:list_id delegate:delegate selector:selector params:nil];
}

+ (NSString*) getListStatusesById:(int)list_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListStatusesParams*)params
{
    params = params ? params : [CBGetListStatusesParams params];
    params.list_id = [NSNumber numberWithInt:list_id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/statuses.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] delegate:delegate selector:selector];    
}


#pragma List Statuses by Name & User Id

+ (NSArray*) getListStatusesByNameNow:(NSString*)slug userId:(int)user_id
{
    return [self getListStatusesByNameNow:slug userId:user_id params:nil];
}

+ (NSArray*) getListStatusesByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListStatusesParams*)params
{
    return [self getListStatusesByNameNow:slug userId:user_id params:params error:nil];
}

+ (NSArray*) getListStatusesByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListStatusesParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetListStatusesParams params];
    params.slug = slug;
    params.owner_id = [NSNumber numberWithInt:user_id];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/statuses.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] error:error];
}

+ (NSString*) getListStatusesByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector
{
    return [self getListStatusesByName:slug userId:user_id delegate:delegate selector:selector params:nil];
}

+ (NSString*) getListStatusesByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListStatusesParams*)params
{
    params = params ? params : [CBGetListStatusesParams params];
    params.slug = slug;
    params.owner_id = [NSNumber numberWithInt:user_id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/statuses.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] delegate:delegate selector:selector];    
}


#pragma List Statuses by Name & Screen Name

+ (NSArray*) getListStatusesByNameNow:(NSString*)slug screenName:(NSString*)screen_name
{
    return [self getListStatusesByNameNow:slug screenName:screen_name params:nil];
}

+ (NSArray*) getListStatusesByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListStatusesParams*)params
{
    return [self getListStatusesByNameNow:slug screenName:screen_name params:params error:nil];
}

+ (NSArray*) getListStatusesByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListStatusesParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetListStatusesParams params];
    params.slug = slug;
    params.owner_screen_name = screen_name;
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/statuses.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] error:error];
}

+ (NSString*) getListStatusesByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector
{
    return [self getListStatusesByName:slug screenName:screen_name delegate:delegate selector:selector params:nil];
}

+ (NSString*) getListStatusesByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetListStatusesParams*)params
{
    params = params ? params : [CBGetListStatusesParams params];
    params.slug = slug;
    params.owner_screen_name = screen_name;
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/statuses.json" method:@"GET" params:params type:CBTwitterResponseTypeArray class:[CBStatus class] delegate:delegate selector:selector];    
}


#pragma Create List

+ (CBList*) createListNow:(NSString*)name
{
    return [self createListNow:name params:nil];
}

+ (CBList*) createListNow:(NSString*)name params:(CBCreateListParams*)params
{
    return [self createListNow:name params:params error:nil];
}

+ (CBList*) createListNow:(NSString*)name params:(CBCreateListParams*)params error:(NSError**)error
{
    params = params ? params : [CBCreateListParams params];
    params.name = name;
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/create.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBList class] error:error];
}

+ (NSString*) createList:(NSString*)name delegate:(id)delegate selector:(SEL)selector
{
    return [self createList:name delegate:delegate selector:selector params:nil];
}

+ (NSString*) createList:(NSString*)name delegate:(id)delegate selector:(SEL)selector params:(CBCreateListParams*)params
{
    params = params ? params : [CBCreateListParams params];
    params.name = name;
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/create.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBList class] delegate:delegate selector:selector];    
}


#pragma Update List by Id

+ (CBList*) updateListByIdNow:(int)list_id params:(CBUpdateListParams*)params
{
    return [self updateListByIdNow:list_id params:params error:nil];
}

+ (CBList*) updateListByIdNow:(int)list_id params:(CBUpdateListParams*)params error:(NSError**)error
{
    params = params ? params : [CBUpdateListParams params];
    params.list_id = [NSNumber numberWithInt:list_id];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/update.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBList class] error:error];
}

+ (NSString*) updateListById:(int)list_id delegate:(id)delegate selector:(SEL)selector params:(CBUpdateListParams*)params
{
    params = params ? params : [CBUpdateListParams params];
    params.list_id = [NSNumber numberWithInt:list_id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/update.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBList class] delegate:delegate selector:selector];    
}


#pragma Update List by Name & User Id

+ (CBList*) updateListByNameNow:(NSString*)slug userId:(int)user_id params:(CBUpdateListParams*)params
{
    return [self updateListByNameNow:slug userId:user_id params:params error:nil];
}

+ (CBList*) updateListByNameNow:(NSString*)slug userId:(int)user_id params:(CBUpdateListParams*)params error:(NSError**)error
{
    params = params ? params : [CBUpdateListParams params];
    params.slug = slug;
    params.owner_id = [NSNumber numberWithInt:user_id];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/update.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBList class] error:error];
}

+ (NSString*) updateListByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBUpdateListParams*)params
{
    params = params ? params : [CBUpdateListParams params];
    params.slug = slug;
    params.owner_id = [NSNumber numberWithInt:user_id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/update.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBList class] delegate:delegate selector:selector];    
}


#pragma Update List by Name & Screen Name

+ (CBList*) updateListByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBUpdateListParams*)params
{
    return [self updateListByNameNow:slug screenName:screen_name params:params error:nil];
}

+ (CBList*) updateListByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBUpdateListParams*)params error:(NSError**)error
{
    params = params ? params : [CBUpdateListParams params];
    params.slug = slug;
    params.owner_screen_name = screen_name;
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/update.json" method:@"update" params:params type:CBTwitterResponseTypeObject class:[CBList class] error:error];
}

+ (NSString*) updateListByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBUpdateListParams*)params
{
    params = params ? params : [CBUpdateListParams params];
    params.slug = slug;
    params.owner_screen_name = screen_name;
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/update.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBList class] delegate:delegate selector:selector];    
}


#pragma delete List by Id

+ (void) deleteListByIdNow:(int)list_id
{
    [self deleteListByIdNow:list_id error:nil];
}

+ (void) deleteListByIdNow:(int)list_id error:(NSError**)error
{
    CBDeleteListParams* params = [CBDeleteListParams params];
    params.list_id = [NSNumber numberWithInt:list_id];
    [self processRequestSynchronous:@"http://api.twitter.com/1/lists/destroy.json" method:@"POST" params:params type:CBTwitterResponseTypeVoid class:nil error:error];
}

+ (NSString*) deleteListById:(int)list_id delegate:(id)delegate selector:(SEL)selector
{
    CBDeleteListParams* params = [CBDeleteListParams params];
    params.list_id = [NSNumber numberWithInt:list_id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/destroy.json" method:@"POST" params:params type:CBTwitterResponseTypeVoid class:nil delegate:delegate selector:selector];    
}


#pragma delete List by Name & User Id

+ (void) deleteListByNameNow:(NSString*)slug userId:(int)user_id
{
    [self deleteListByNameNow:slug userId:user_id error:nil];
}

+ (void) deleteListByNameNow:(NSString*)slug userId:(int)user_id error:(NSError**)error
{
    CBDeleteListParams* params = [CBDeleteListParams params];
    params.slug = slug;
    params.owner_id = [NSNumber numberWithInt:user_id];
    [self processRequestSynchronous:@"http://api.twitter.com/1/lists/destroy.json" method:@"POST" params:params type:CBTwitterResponseTypeVoid class:nil error:error];
}

+ (NSString*) deleteListByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector
{
    CBDeleteListParams* params = [CBDeleteListParams params];
    params.slug = slug;
    params.owner_id = [NSNumber numberWithInt:user_id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/destroy.json" method:@"POST" params:params type:CBTwitterResponseTypeVoid class:nil delegate:delegate selector:selector];    
}


#pragma delete List by Name & Screen Name

+ (void) deleteListByNameNow:(NSString*)slug screenName:(NSString*)screen_name
{
    [self deleteListByNameNow:slug screenName:screen_name error:nil];
}

+ (void) deleteListByNameNow:(NSString*)slug screenName:(NSString*)screen_name error:(NSError**)error
{
    CBDeleteListParams* params = [CBDeleteListParams params];
    params.slug = slug;
    params.owner_screen_name = screen_name;
    [self processRequestSynchronous:@"http://api.twitter.com/1/lists/destroy.json" method:@"update" params:params type:CBTwitterResponseTypeVoid class:nil error:error];
}

+ (NSString*) deleteListByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector
{
    CBDeleteListParams* params = [CBDeleteListParams params];
    params.slug = slug;
    params.owner_screen_name = screen_name;
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/destroy.json" method:@"POST" params:params type:CBTwitterResponseTypeVoid class:nil delegate:delegate selector:selector];    
}


@end
