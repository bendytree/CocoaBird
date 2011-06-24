//
//  CocoaBird+Tweets.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBird.h"
#import "CocoaBird+Core.h"
#import "CBModels.h"



@interface CBGetFavoritesParams : CBQueryParams {}
@property (retain) NSNumber* id;
@property (retain) NSNumber* page;
@property (retain) NSNumber* since_id;
@property (retain) NSNumber* skip_status;
@property (retain) NSNumber* include_entities;
@end

@interface CBCreateFavoriteParams : CBQueryParams {}
@property (retain) NSNumber* skip_status;
@property (retain) NSNumber* include_entities;
@end

@interface CBDeleteFavoriteParams : CBQueryParams {}
@property (retain) NSNumber* skip_status;
@property (retain) NSNumber* include_entities;
@end


@interface CocoaBird (Favorites)

//Get Favorites
+ (NSArray*) getFavoritesNow;
+ (NSArray*) getFavoritesNow:(CBGetFavoritesParams*)params;
+ (NSArray*) getFavoritesNow:(CBGetFavoritesParams*)params error:(NSError**)error;
+ (CBRequestId*) getFavorites:(id)delegate selector:(SEL)selector;           // - (void) favoritesLoaded:(NSArray*)statuses error:(NSError*)error;
+ (CBRequestId*) getFavorites:(id)delegate selector:(SEL)selector params:(CBGetFavoritesParams*)params;

//Create Favorite
+ (CBStatus*) createFavoriteNow:(unsigned long long)id;
+ (CBStatus*) createFavoriteNow:(unsigned long long)id error:(NSError**)error;
+ (CBStatus*) createFavoriteNow:(unsigned long long)id error:(NSError**)error params:(CBCreateFavoriteParams*)params;
+ (CBRequestId*) createFavorite:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector;           // - (void) favoriteCreated:(CBStatus*)status error:(NSError*)error;
+ (CBRequestId*) createFavorite:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector params:(CBCreateFavoriteParams*)params;

//Delete Favorite
+ (CBStatus*) deleteFavoriteNow:(unsigned long long)id;
+ (CBStatus*) deleteFavoriteNow:(unsigned long long)id error:(NSError**)error;
+ (CBStatus*) deleteFavoriteNow:(unsigned long long)id error:(NSError**)error params:(CBDeleteFavoriteParams*)params;
+ (CBRequestId*) deleteFavorite:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector;           // - (void) favoriteDeleted:(CBStatus*)status error:(NSError*)error;
+ (CBRequestId*) deleteFavorite:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector params:(CBDeleteFavoriteParams*)params;

@end

