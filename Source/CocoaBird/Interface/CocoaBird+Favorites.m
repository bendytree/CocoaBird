//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CocoaBird+Friendship.h"
#import "CocoaBirdSettings.h"

@implementation CBGetFavoritesParams
@synthesize id, page, since_id, skip_status, include_entities;
@end

@implementation CBCreateFavoriteParams
@synthesize skip_status, include_entities;
@end

@implementation CBDeleteFavoriteParams
@synthesize skip_status, include_entities;
@end


@implementation CocoaBird (Favorites)


#pragma Get Favorites

+ (NSArray*) getFavoritesNow
{
    return [self getFavoritesNow:nil];
}

+ (NSArray*) getFavoritesNow:(CBGetFavoritesParams*)params
{
    return [self getFavoritesNow:params error:nil];
}

+ (NSArray*) getFavoritesNow:(CBGetFavoritesParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/favorites.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBStatus class] error:error];
}

+ (CBRequestId*) getFavorites:(id)delegate selector:(SEL)selector
{
    return [self getFavorites:delegate selector:selector params:nil];
}

+ (CBRequestId*) getFavorites:(id)delegate selector:(SEL)selector params:(CBGetFavoritesParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/favorites.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBStatus class] delegate:delegate selector:selector];
}


#pragma Create Favorite

+ (CBStatus*) createFavoriteNow:(unsigned long long)id
{
    return [self createFavoriteNow:id error:nil];
}

+ (CBStatus*) createFavoriteNow:(unsigned long long)id error:(NSError**)error
{
    return [self createFavoriteNow:id error:error params:nil];
}

+ (CBStatus*) createFavoriteNow:(unsigned long long)id error:(NSError**)error params:(CBCreateFavoriteParams*)params
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/favorites/create/%qu.json", id];
    return [self processRequestSynchronous:url method:@"POST" params:params type:CBTwitterResponseTypeCustom class:[CBStatus class] error:error];
}

+ (CBRequestId*) createFavorite:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector
{
    return [self createFavorite:id delegate:delegate selector:selector params:nil];
}

+ (CBRequestId*) createFavorite:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector params:(CBCreateFavoriteParams*)params
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/favorites/create/%qu.json", id];
    return [self processRequestAsynchronous:url method:@"POST" params:params type:CBTwitterResponseTypeCustom class:[CBStatus class] delegate:delegate selector:selector];
}


#pragma Delete Favorite

+ (CBStatus*) deleteFavoriteNow:(unsigned long long)id
{
    return [self deleteFavoriteNow:id error:nil];
}

+ (CBStatus*) deleteFavoriteNow:(unsigned long long)id error:(NSError**)error
{
    return [self deleteFavoriteNow:id error:error params:nil];
}

+ (CBStatus*) deleteFavoriteNow:(unsigned long long)id error:(NSError**)error params:(CBDeleteFavoriteParams*)params
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/favorites/destroy/%qu.json", id];
    return [self processRequestSynchronous:url method:@"POST" params:params type:CBTwitterResponseTypeCustom class:[CBStatus class] error:error];
}

+ (CBRequestId*) deleteFavorite:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector
{
    return [self deleteFavorite:id delegate:delegate selector:selector params:nil];
}

+ (CBRequestId*) deleteFavorite:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector params:(CBDeleteFavoriteParams*)params
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/favorites/destroy/%qu.json", id];
    return [self processRequestAsynchronous:url method:@"POST" params:params type:CBTwitterResponseTypeCustom class:[CBStatus class] delegate:delegate selector:selector];
}


@end
