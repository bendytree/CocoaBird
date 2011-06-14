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

@end
