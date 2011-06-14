//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+ListSubscribers.h"
#import "CocoaBirdSettings.h"


@implementation CBGetListSubscribersParams
@synthesize list_id, slug, owner_id, owner_screen_name, cursor, include_entities, skip_status;
@end

@implementation CBIsUserSubscriberOfListParams
@synthesize list_id, slug, owner_id, owner_screen_name, user_id, screen_name, include_entities, skip_status;
@end

@implementation CBSubscribeToListParams
@synthesize list_id, slug, owner_id, owner_screen_name;
@end

@implementation CBRemoveSubscriberFromListParams
@synthesize list_id, slug, owner_id, owner_screen_name;
@end



@implementation CocoaBird (ListSubscribers)


#pragma List Subscribers by Id

+ (CBListSubscribers*) getListSubscribersByIdNow:(int)list_id
{
    return [self getListSubscribersByIdNow:list_id params:nil];
}

+ (CBListSubscribers*) getListSubscribersByIdNow:(int)list_id params:(CBGetListSubscribersParams*)params
{
    return [self getListSubscribersByIdNow:list_id params:params error:nil];
}

+ (CBListSubscribers*) getListSubscribersByIdNow:(int)list_id params:(CBGetListSubscribersParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetListSubscribersParams params];
    params.list_id = [NSNumber numberWithInt:list_id];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/subscribers.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBListSubscribers class] error:error];
}

+ (NSString*) getListSubscribersById:(int)list_id delegate:(id)delegate selector:(SEL)selector
{
    return [self getListSubscribersById:list_id delegate:delegate selector:selector params:nil];
}

+ (NSString*) getListSubscribersById:(int)list_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListSubscribersParams*)params
{
    params = params ? params : [CBGetListSubscribersParams params];
    params.list_id = [NSNumber numberWithInt:list_id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/subscribers.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBListSubscribers class] delegate:delegate selector:selector];    
}


#pragma List Subscribers by Name & User Id

+ (CBListSubscribers*) getListSubscribersByNameNow:(NSString*)slug userId:(int)user_id
{
    return [self getListSubscribersByNameNow:slug userId:user_id params:nil];
}

+ (CBListSubscribers*) getListSubscribersByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListSubscribersParams*)params
{
    return [self getListSubscribersByNameNow:slug userId:user_id params:params error:nil];
}

+ (CBListSubscribers*) getListSubscribersByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListSubscribersParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetListSubscribersParams params];
    params.slug = slug;
    params.owner_id = [NSNumber numberWithInt:user_id];
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/subscribers.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBListSubscribers class] error:error];
}

+ (NSString*) getListSubscribersByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector
{
    return [self getListSubscribersByName:slug userId:user_id delegate:delegate selector:selector params:nil];
}

+ (NSString*) getListSubscribersByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListSubscribersParams*)params
{
    params = params ? params : [CBGetListSubscribersParams params];
    params.slug = slug;
    params.owner_id = [NSNumber numberWithInt:user_id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/subscribers.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBListSubscribers class] delegate:delegate selector:selector];    
}


#pragma List Subscribers by Name & Screen Name

+ (CBListSubscribers*) getListSubscribersByNameNow:(NSString*)slug screenName:(NSString*)screen_name
{
    return [self getListSubscribersByNameNow:slug screenName:screen_name params:nil];
}

+ (CBListSubscribers*) getListSubscribersByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListSubscribersParams*)params
{
    return [self getListSubscribersByNameNow:slug screenName:screen_name params:params error:nil];
}

+ (CBListSubscribers*) getListSubscribersByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListSubscribersParams*)params error:(NSError**)error
{
    params = params ? params : [CBGetListSubscribersParams params];
    params.slug = slug;
    params.owner_screen_name = screen_name;
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/subscribers.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBListSubscribers class] error:error];
}

+ (NSString*) getListSubscribersByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector
{
    return [self getListSubscribersByName:slug screenName:screen_name delegate:delegate selector:selector params:nil];
}

+ (NSString*) getListSubscribersByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetListSubscribersParams*)params
{
    params = params ? params : [CBGetListSubscribersParams params];
    params.slug = slug;
    params.owner_screen_name = screen_name;
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/subscribers.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBListSubscribers class] delegate:delegate selector:selector];    
}


#pragma User Is Subscriber of List

+ (CBUser*) isUserSubscriberOfListNow:(CBIsUserSubscriberOfListParams*)params
{
    return [self isUserSubscriberOfListNow:params error:nil];
}

+ (CBUser*) isUserSubscriberOfListNow:(CBIsUserSubscriberOfListParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/subscribers/show.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBUser class] error:error];
}

+ (NSString*) isUserSubscriberOfList:(CBIsUserSubscriberOfListParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/subscribers/show.json" method:@"GET" params:params type:CBTwitterResponseTypeObject class:[CBUser class] delegate:delegate selector:selector];    
}


#pragma Add Subscriber to List

+ (CBUser*) subscribeToListByIdNow:(int)list_id
{
    return [self subscribeToListByIdNow:list_id error:nil];
}

+ (CBUser*) subscribeToListByIdNow:(int)list_id error:(NSError**)error
{
    CBSubscribeToListParams* params = [CBSubscribeToListParams params];
    params.list_id = [NSNumber numberWithInt:list_id];
    return [self subscribeToListNow:params error:error];
}

+ (CBUser*) subscribeToListByNameNow:(NSString*)slug screenName:(NSString*)owner_screen_name
{
    return [self subscribeToListByNameNow:slug screenName:owner_screen_name error:nil];
}

+ (CBUser*) subscribeToListByNameNow:(NSString*)slug screenName:(NSString*)owner_screen_name error:(NSError**)error
{
    CBSubscribeToListParams* params = [CBSubscribeToListParams params];
    params.slug = slug;
    params.owner_screen_name = owner_screen_name;
    return [self subscribeToListNow:params error:error];
}

+ (CBUser*) subscribeToListNow:(CBSubscribeToListParams*)params
{
    return [self subscribeToListNow:params error:nil];
}

+ (CBUser*) subscribeToListNow:(CBSubscribeToListParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/lists/subscribers/create.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBUser class] error:error];
}

+ (NSString*) subscribeToListById:(int)list_id delegate:(id)delegate selector:(SEL)selector
{
    CBSubscribeToListParams* params = [CBSubscribeToListParams params];
    params.list_id = [NSNumber numberWithInt:list_id];
    return [self subscribeToList:params delegate:delegate selector:selector];
}

+ (NSString*) subscribeToListByName:(NSString*)slug screenName:(NSString*)owner_screen_name delegate:(id)delegate selector:(SEL)selector
{
    CBSubscribeToListParams* params = [CBSubscribeToListParams params];
    params.slug = slug;
    params.owner_screen_name = owner_screen_name;
    return [self subscribeToList:params delegate:delegate selector:selector];
}

+ (NSString*) subscribeToList:(CBSubscribeToListParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/subscribers/create.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBUser class] delegate:delegate selector:selector];    
}


#pragma Remove Subscriber From List

+ (void) removeSubscriberFromListNow:(CBRemoveSubscriberFromListParams*)params error:(NSError**)error
{
    [self processRequestSynchronous:@"http://api.twitter.com/1/lists/subscribers/destroy.json" method:@"POST" params:params type:CBTwitterResponseTypeVoid class:nil error:error];
}

+ (NSString*) removeSubscriberFromList:(CBRemoveSubscriberFromListParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/lists/subscribers/destroy.json" method:@"POST" params:params type:CBTwitterResponseTypeVoid class:nil delegate:delegate selector:selector];    
}


@end
