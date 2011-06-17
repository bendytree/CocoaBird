//
//  CocoaBird+Users.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBird.h"
#import "CocoaBird+Core.h"


@class CBSuggestedUsers;


@interface CBGetUserParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* skip_status;
@property (retain) NSNumber* include_entities;
@end

@interface CBGetUsersParams : CBQueryParams {}
@property (retain) NSString* user_id;           // comma separated list of user ids
@property (retain) NSString* screen_name;       // comma separated list of screen names
@property (retain) NSNumber* skip_status;
@property (retain) NSNumber* include_entities;
@end

@interface CBSearchUsersParams : CBQueryParams {}
@property (retain) NSString* q;
@property (retain) NSNumber* per_page;
@property (retain) NSNumber* page;
@property (retain) NSNumber* skip_status;
@property (retain) NSNumber* include_entities;
@end

@interface CBGetUserCategoriesParams : CBQueryParams {}
@property (retain) NSString* lang;
@end

@interface CBGetSuggestedUsersParams : CBQueryParams {}
@property (retain) NSString* slug;
@property (retain) NSString* lang;
@end

@interface CBGetContributorsParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* skip_status;
@property (retain) NSNumber* include_entities;
@end

@interface CBGetContributeesParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* skip_status;
@property (retain) NSNumber* include_entities;
@end



@interface CocoaBird (Users)

//Get User By Id
+ (CBUser*) getUserByIdNow:(int)user_id;
+ (CBUser*) getUserByIdNow:(int)user_id params:(CBGetUserParams*)params;
+ (CBUser*) getUserByIdNow:(int)user_id params:(CBGetUserParams*)params error:(NSError**)error;
+ (NSString*) getUserById:(int)user_id delegate:(id)delegate selector:(SEL)selector;           // - (void) userLoaded:(CBUser*)status error:(NSError*)error;
+ (NSString*) getUserById:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetUserParams*)params;

//Get User By Screen Name
+ (CBUser*) getUserByScreenNameNow:(NSString*)screen_name;
+ (CBUser*) getUserByScreenNameNow:(NSString*)screen_name params:(CBGetUserParams*)params;
+ (CBUser*) getUserByScreenNameNow:(NSString*)screen_name params:(CBGetUserParams*)params error:(NSError**)error;
+ (NSString*) getUserByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;           // - (void) userLoaded:(CBUser*)status error:(NSError*)error;
+ (NSString*) getUserByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetUserParams*)params;

//Get Users By Ids
+ (NSArray*) getUsersByIdsNow:(NSArray*)user_ids;
+ (NSArray*) getUsersByIdsNow:(NSArray*)user_ids params:(CBGetUsersParams*)params;
+ (NSArray*) getUsersByIdsNow:(NSArray*)user_ids params:(CBGetUsersParams*)params error:(NSError**)error;
+ (NSString*) getUsersByIds:(NSArray*)user_ids delegate:(id)delegate selector:(SEL)selector;           // - (void) usersLoaded:(NSArray*)users error:(NSError*)error;
+ (NSString*) getUsersByIds:(NSArray*)user_ids delegate:(id)delegate selector:(SEL)selector params:(CBGetUsersParams*)params;

//Get Users By Screen Names
+ (NSArray*) getUsersByScreenNamesNow:(NSArray*)screen_names;
+ (NSArray*) getUsersByScreenNamesNow:(NSArray*)screen_names params:(CBGetUsersParams*)params;
+ (NSArray*) getUsersByScreenNamesNow:(NSArray*)screen_names params:(CBGetUsersParams*)params error:(NSError**)error;
+ (NSString*) getUsersByScreenNames:(NSArray*)screen_names delegate:(id)delegate selector:(SEL)selector;           // - (void) usersLoaded:(NSArray*)users error:(NSError*)error;
+ (NSString*) getUsersByScreenNames:(NSArray*)screen_names delegate:(id)delegate selector:(SEL)selector params:(CBGetUsersParams*)params;

//Search Users
+ (NSArray*) searchUsersNow:(NSString*)query;
+ (NSArray*) searchUsersNow:(NSString*)query params:(CBSearchUsersParams*)params;
+ (NSArray*) searchUsersNow:(NSString*)query params:(CBSearchUsersParams*)params error:(NSError**)error;
+ (NSString*) searchUsers:(NSString*)query delegate:(id)delegate selector:(SEL)selector;           // - (void) usersLoaded:(NSArray*)users error:(NSError*)error;
+ (NSString*) searchUsers:(NSString*)query delegate:(id)delegate selector:(SEL)selector params:(CBSearchUsersParams*)params;

//Get User Categories
+ (NSArray*) getUserCategoriesNow:(CBGetUserCategoriesParams*)params error:(NSError**)error;
+ (NSString*) getUserCategories:(CBGetUserCategoriesParams*)params delegate:(id)delegate selector:(SEL)selector;           // - (void) userCategoriesLoaded:(NSArray*)userCategories error:(NSError*)error;

//Get Suggested Users 
+ (CBSuggestedUsers*) getSuggestedUsersNow:(CBGetSuggestedUsersParams*)params error:(NSError**)error;
+ (NSString*) getSuggestedUsers:(CBGetSuggestedUsersParams*)params delegate:(id)delegate selector:(SEL)selector;           // - (void) suggestedUsersLoaded:(CBSuggestedUsers*)response error:(NSError*)error;

//Profile Image
+ (NSString*) buildProfileImageUrl:(NSString*)screen_name;
+ (NSString*) buildProfileImageUrl:(NSString*)screen_name size:(NSString*)size;

//Get Contributors 
+ (NSArray*) getContributorsNow:(CBGetContributorsParams*)params error:(NSError**)error;
+ (NSString*) getContributors:(CBGetContributorsParams*)params delegate:(id)delegate selector:(SEL)selector;           // - (void) contributorsLoaded:(NSArray*)users error:(NSError*)error;

//Get Contributees 
+ (NSArray*) getContributeesNow:(CBGetContributeesParams*)params error:(NSError**)error;
+ (NSString*) getContributees:(CBGetContributeesParams*)params delegate:(id)delegate selector:(SEL)selector;           // - (void) contributeesLoaded:(NSArray*)users error:(NSError*)error;


@end
