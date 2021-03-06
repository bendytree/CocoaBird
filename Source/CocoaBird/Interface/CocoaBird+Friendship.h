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

@interface CBFollowParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* follow;
@property (retain) NSNumber* include_entities;
@property (retain) NSNumber* skip_status;
@end

@interface CBUnfollowParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* include_entities;
@property (retain) NSNumber* skip_status;
@end

@interface CBGetFriendshipParams : CBQueryParams {}
@property (retain) NSNumber* source_id;
@property (retain) NSString* source_screen_name;
@property (retain) NSNumber* target_id;
@property (retain) NSString* target_screen_name;
@end

@interface CBGetFriendIdsParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* cursor;
@end

@interface CBGetFollowerIdsParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* cursor;
@end


@interface CocoaBird (Friendship)

//Follow
+ (CBUser*) followByIdNow:(int)user_id;
+ (CBUser*) followByIdNow:(int)user_id error:(NSError**)error;
+ (CBUser*) followByScreenNameNow:(NSString*)screen_name;
+ (CBUser*) followByScreenNameNow:(NSString*)screen_name error:(NSError**)error;
+ (CBUser*) followNow:(CBFollowParams*)params error:(NSError**)error;
+ (CBRequestId*) followById:(int)user_id delegate:(id)delegate selector:(SEL)selector;           // - (void) followComplete:(CBUser*)user error:(NSError*)error;
+ (CBRequestId*) followByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;
+ (CBRequestId*) follow:(id)delegate selector:(SEL)selector params:(CBFollowParams*)params;

//Unfollow
+ (CBUser*) unfollowByIdNow:(int)user_id;
+ (CBUser*) unfollowByIdNow:(int)user_id error:(NSError**)error;
+ (CBUser*) unfollowByScreenNameNow:(NSString*)screen_name;
+ (CBUser*) unfollowByScreenNameNow:(NSString*)screen_name error:(NSError**)error;
+ (CBUser*) unfollowNow:(CBUnfollowParams*)params error:(NSError**)error;
+ (CBRequestId*) unfollowById:(int)user_id delegate:(id)delegate selector:(SEL)selector;           // - (void) unfollowComplete:(CBUser*)user error:(NSError*)error;
+ (CBRequestId*) unfollowByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;
+ (CBRequestId*) unfollow:(id)delegate selector:(SEL)selector params:(CBUnfollowParams*)params;

//Get Friendship
+ (CBFriendship*) getFriendshipFromUserIdNow:(int)source_id to:(int)target_id;
+ (CBFriendship*) getFriendshipFromUserIdNow:(int)source_id to:(int)target_id error:(NSError**)error;
+ (CBFriendship*) getFriendshipFromScreenNameNow:(NSString*)source_screen_name to:(NSString*)target_screen_name;
+ (CBFriendship*) getFriendshipFromScreenNameNow:(NSString*)source_screen_name to:(NSString*)target_screen_name error:(NSError**)error;
+ (CBFriendship*) getFriendshipNow:(CBGetFriendshipParams*)params error:(NSError**)error;
+ (CBRequestId*) getFriendshipFromUserId:(int)source_id to:(int)target_id delegate:(id)delegate selector:(SEL)selector;    // - (void) friendshipLoaded:(CBFriendship*)friendship error:(NSError*)error;
+ (CBRequestId*) getFriendshipFromScreenName:(NSString*)source_screen_name to:(NSString*)target_screen_name delegate:(id)delegate selector:(SEL)selector;
+ (CBRequestId*) getFriendship:(CBGetFriendshipParams*)params delegate:(id)delegate selector:(SEL)selector;

//Get Friend Ids
+ (NSArray*) getFriendIdsByUserIdNow:(CBGetFriendIdsParams*)params error:(NSError**)error;
+ (CBRequestId*) getFriendIdsByUserId:(CBGetFriendIdsParams*)params delegate:(id)delegate selector:(SEL)selector;

//Get Follower Ids
+ (NSArray*) getFollowerIdsByUserIdNow:(CBGetFollowerIdsParams*)params error:(NSError**)error;
+ (CBRequestId*) getFollowerIdsByUserId:(CBGetFollowerIdsParams*)params delegate:(id)delegate selector:(SEL)selector;


@end
