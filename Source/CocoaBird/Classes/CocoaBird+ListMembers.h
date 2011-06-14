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

@interface CBGetListMembersParams : CBQueryParams {}
@property (retain) NSNumber* list_id;
@property (retain) NSString* slug;
@property (retain) NSNumber* owner_id;
@property (retain) NSString* owner_screen_name;
@property (retain) NSNumber* cursor;
@property (retain) NSNumber* include_entities;
@property (retain) NSNumber* skip_status;
@end

@interface CBIsUserMemberOfListParams : CBQueryParams {}
@property (retain) NSNumber* list_id;
@property (retain) NSString* slug;
@property (retain) NSNumber* owner_id;
@property (retain) NSString* owner_screen_name;
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* include_entities;
@property (retain) NSNumber* skip_status;
@end

@interface CBAddMemberToListParams : CBQueryParams {}
@property (retain) NSNumber* list_id;
@property (retain) NSString* slug;
@property (retain) NSNumber* owner_id;
@property (retain) NSString* owner_screen_name;
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@end

@interface CBAddMembersToListParams : CBQueryParams {}
@property (retain) NSNumber* list_id;
@property (retain) NSString* slug;
@property (retain) NSNumber* owner_id;
@property (retain) NSString* owner_screen_name;
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@end

@interface CBRemoveMemberFromListParams : CBQueryParams {}
@property (retain) NSNumber* list_id;
@property (retain) NSString* slug;
@property (retain) NSNumber* owner_id;
@property (retain) NSString* owner_screen_name;
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@end

@interface CocoaBird (ListMembers)

//List by Id
+ (CBListMembers*) getListMembersByIdNow:(int)list_id;
+ (CBListMembers*) getListMembersByIdNow:(int)list_id params:(CBGetListMembersParams*)params;
+ (CBListMembers*) getListMembersByIdNow:(int)list_id params:(CBGetListMembersParams*)params error:(NSError**)error;
+ (NSString*) getListMembersById:(int)list_id delegate:(id)delegate selector:(SEL)selector;           // - (void) listMembersLoaded:(CBListMembers*)listMembers error:(NSError*)error;
+ (NSString*) getListMembersById:(int)list_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListMembersParams*)params;

//List by Name & User Id
+ (CBListMembers*) getListMembersByNameNow:(NSString*)slug userId:(int)user_id;
+ (CBListMembers*) getListMembersByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListMembersParams*)params;
+ (CBListMembers*) getListMembersByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListMembersParams*)params error:(NSError**)error;
+ (NSString*) getListMembersByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector;           // - (void) listMembersLoaded:(CBListMembers*)listMembers error:(NSError*)error;
+ (NSString*) getListMembersByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListMembersParams*)params;

//List by Name & Screen Name
+ (CBListMembers*) getListMembersByNameNow:(NSString*)slug screenName:(NSString*)screen_name;
+ (CBListMembers*) getListMembersByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListMembersParams*)params;
+ (CBListMembers*) getListMembersByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListMembersParams*)params error:(NSError**)error;
+ (NSString*) getListMembersByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;           // - (void) listMembersLoaded:(CBListMembers*)listMembers error:(NSError*)error;
+ (NSString*) getListMembersByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetListMembersParams*)params;

//User Is Member of List
+ (CBUser*) isUserMemberOfListNow:(CBIsUserMemberOfListParams*)params;
+ (CBUser*) isUserMemberOfListNow:(CBIsUserMemberOfListParams*)params error:(NSError**)error;
+ (NSString*) isUserMemberOfList:(CBIsUserMemberOfListParams*)params delegate:(id)delegate selector:(SEL)selector;           // - (void) isMemberOfListLoaded:(CBUser*)user error:(NSError*)error;

//Add Member to List
+ (CBUser*) addMemberToListNow:(CBAddMemberToListParams*)params;
+ (CBUser*) addMemberToListNow:(CBAddMemberToListParams*)params error:(NSError**)error;
+ (NSString*) addMemberToList:(CBAddMemberToListParams*)params delegate:(id)delegate selector:(SEL)selector;           // - (void) memberWasAdded:(CBUser*)user error:(NSError*)error;

//Add Members to List
+ (NSArray*) addMembersToListNow:(CBAddMembersToListParams*)params;
+ (NSArray*) addMembersToListNow:(CBAddMembersToListParams*)params error:(NSError**)error;
+ (NSString*) addMembersToList:(CBAddMembersToListParams*)params delegate:(id)delegate selector:(SEL)selector;           // - (void) membersWereAdded:(NSArray*)users error:(NSError*)error;

//Remove Member From List
+ (void) removeMemberFromListNow:(CBRemoveMemberFromListParams*)params error:(NSError**)error;
+ (NSString*) removeMemberFromList:(CBRemoveMemberFromListParams*)params delegate:(id)delegate selector:(SEL)selector;           // - (void) memberRemoved:(NSError*)error;

@end
