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

@interface CBIsBlockingParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* include_entities;
@property (retain) NSNumber* skip_status;
@end

@interface CBGetBlockedUsersParams : CBQueryParams {}
@property (retain) NSNumber* page;
@property (retain) NSNumber* per_page;
@property (retain) NSNumber* include_entities;
@property (retain) NSNumber* skip_status;
@end

@interface CBBlockUserParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* include_entities;
@property (retain) NSNumber* skip_status;
@end

@interface CBUnblockUserParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* include_entities;
@property (retain) NSNumber* skip_status;
@end


@interface CocoaBird (Block)

//Is Blocking
+ (CBUser*) isBlockingNow:(CBIsBlockingParams*)params error:(NSError**)error;
+ (CBRequestId*) isBlocking:(id)delegate selector:(SEL)selector params:(CBIsBlockingParams*)params;    // - (void) isBlockingLoaded:(CBUser*)user error:(NSError*)error;

//Get Blocked Users
+ (NSArray*) getBlockedUsersNow:(CBGetBlockedUsersParams*)params error:(NSError**)error;
+ (CBRequestId*) getBlockedUsers:(id)delegate selector:(SEL)selector params:(CBGetBlockedUsersParams*)params;    // - (void) blockedUsersLoaded:(NSArray*)users error:(NSError*)error;

//Get Blocked User Ids
+ (NSArray*) getBlockedUserIdsNow:(NSError**)error;
+ (CBRequestId*) getBlockedUserIds:(id)delegate selector:(SEL)selector;    // - (void) blockedUserIdsLoaded:(NSArray*)userIds error:(NSError*)error;

//Block User
+ (CBUser*) blockUserNow:(CBBlockUserParams*)params error:(NSError**)error;
+ (CBRequestId*) blockUser:(id)delegate selector:(SEL)selector params:(CBBlockUserParams*)params;    // - (void) blockCompleted:(CBUser*)user error:(NSError*)error;

//Unblock User
+ (CBUser*) unblockUserNow:(CBUnblockUserParams*)params error:(NSError**)error;
+ (CBRequestId*) unblockUser:(id)delegate selector:(SEL)selector params:(CBUnblockUserParams*)params;    // - (void) unblockCompleted:(CBUser*)user error:(NSError*)error;

@end
