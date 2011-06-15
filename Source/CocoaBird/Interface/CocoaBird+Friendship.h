//
//  CocoaBird+Tweets.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
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


@interface CocoaBird (Friendship)

//Follow
+ (CBUser*) followByIdNow:(int)user_id;
+ (CBUser*) followByIdNow:(int)user_id error:(NSError**)error;
+ (CBUser*) followByScreenNameNow:(NSString*)screen_name;
+ (CBUser*) followByScreenNameNow:(NSString*)screen_name error:(NSError**)error;
+ (CBUser*) followNow:(CBFollowParams*)params error:(NSError**)error;
+ (NSString*) followById:(int)user_id delegate:(id)delegate selector:(SEL)selector;           // - (void) followComplete:(CBUser*)user error:(NSError*)error;
+ (NSString*) followByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;
+ (NSString*) follow:(id)delegate selector:(SEL)selector params:(CBFollowParams*)params;

//Unfollow
+ (CBUser*) unfollowByIdNow:(int)user_id;
+ (CBUser*) unfollowByIdNow:(int)user_id error:(NSError**)error;
+ (CBUser*) unfollowByScreenNameNow:(NSString*)screen_name;
+ (CBUser*) unfollowByScreenNameNow:(NSString*)screen_name error:(NSError**)error;
+ (CBUser*) unfollowNow:(CBUnfollowParams*)params error:(NSError**)error;
+ (NSString*) unfollowById:(int)user_id delegate:(id)delegate selector:(SEL)selector;           // - (void) unfollowComplete:(CBUser*)user error:(NSError*)error;
+ (NSString*) unfollowByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;
+ (NSString*) unfollow:(id)delegate selector:(SEL)selector params:(CBUnfollowParams*)params;

//Get Friendship
+ (CBFriendship*) getFriendshipFromUserIdNow:(int)source_id to:(int)target_id;
+ (CBFriendship*) getFriendshipFromUserIdNow:(int)source_id to:(int)target_id error:(NSError**)error;
+ (CBFriendship*) getFriendshipFromScreenNameNow:(NSString*)source_screen_name to:(NSString*)target_screen_name;
+ (CBFriendship*) getFriendshipFromScreenNameNow:(NSString*)source_screen_name to:(NSString*)target_screen_name error:(NSError**)error;
+ (CBFriendship*) getFriendshipNow:(CBGetFriendshipParams*)params error:(NSError**)error;
+ (NSString*) getFriendshipFromUserId:(int)source_id to:(int)target_id delegate:(id)delegate selector:(SEL)selector;    // - (void) friendshipLoaded:(CBFriendship*)friendship error:(NSError*)error;
+ (NSString*) getFriendshipFromScreenName:(NSString*)source_screen_name to:(NSString*)target_screen_name delegate:(id)delegate selector:(SEL)selector;
+ (NSString*) getFriendship:(CBGetFriendshipParams*)params delegate:(id)delegate selector:(SEL)selector;


@end
