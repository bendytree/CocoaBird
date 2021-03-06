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

@interface CBGetListsParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSString* cursor;
@end

@interface CBGetMembershipListsParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSString* cursor;
@property (retain) NSNumber* filter_to_owned_lists;
@end

@interface CBGetSubscriptionListsParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSString* cursor;
@end

@interface CBGetListParams : CBQueryParams {}
@property (retain) NSNumber* list_id;
@property (retain) NSString* slug;
@property (retain) NSString* owner_screen_name;
@property (retain) NSNumber* owner_id;
@end

@interface CBGetListStatusesParams : CBQueryParams {}
@property (retain) NSNumber* list_id;
@property (retain) NSString* slug;
@property (retain) NSString* owner_screen_name;
@property (retain) NSNumber* owner_id;
@property (assign) NSNumber* since_id;
@property (assign) NSNumber* max_id;
@property (assign) NSNumber* count;
@property (assign) NSNumber* page;
@property (assign) NSNumber* include_rts;
@property (assign) NSNumber* include_entities;
@end

@interface CBCreateListParams : CBQueryParams {}
@property (retain) NSString* name;
@property (retain) NSString* description;
@property (retain) NSString* mode;
@end

@interface CBUpdateListParams : CBQueryParams {}
@property (retain) NSNumber* list_id;
@property (retain) NSString* slug;
@property (retain) NSString* owner_screen_name;
@property (retain) NSNumber* owner_id;
@property (retain) NSString* name;
@property (retain) NSString* description;
@property (retain) NSString* mode;
@end

@interface CBDeleteListParams : CBQueryParams {}
@property (retain) NSNumber* list_id;
@property (retain) NSString* slug;
@property (retain) NSString* owner_screen_name;
@property (retain) NSNumber* owner_id;
@end


@interface CocoaBird (Lists)

//Lists by User Id
+ (CBLists*) getListsByUserIdNow:(int)user_id;
+ (CBLists*) getListsByUserIdNow:(int)user_id params:(CBGetListsParams*)params;
+ (CBLists*) getListsByUserIdNow:(int)user_id params:(CBGetListsParams*)params error:(NSError**)error;
+ (CBRequestId*) getListsByUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector;           // - (void) listsLoaded:(CBLists*)lists error:(NSError*)error;
+ (CBRequestId*) getListsByUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListsParams*)params;

//Lists by Screen Name
+ (CBLists*) getListsNow;
+ (CBLists*) getListsByScreenNameNow:(NSString*)screen_name;
+ (CBLists*) getListsByScreenNameNow:(NSString*)screen_name params:(CBGetListsParams*)params;
+ (CBLists*) getListsByScreenNameNow:(NSString*)screen_name params:(CBGetListsParams*)params error:(NSError**)error;
+ (CBRequestId*) getLists:(id)delegate selector:(SEL)selector;           // - (void) listsLoaded:(CBLists*)lists error:(NSError*)error;
+ (CBRequestId*) getListsByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;
+ (CBRequestId*) getListsByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetListsParams*)params;

//Membership Lists by User Id
+ (CBLists*) getMembershipListsByUserIdNow:(int)user_id;
+ (CBLists*) getMembershipListsByUserIdNow:(int)user_id params:(CBGetMembershipListsParams*)params;
+ (CBLists*) getMembershipListsByUserIdNow:(int)user_id params:(CBGetMembershipListsParams*)params error:(NSError**)error;
+ (CBRequestId*) getMembershipListsByUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector;           // - (void) membershipListsLoaded:(CBLists*)lists error:(NSError*)error;
+ (CBRequestId*) getMembershipListsByUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetMembershipListsParams*)params;

//Membership Lists by Screen Name
+ (CBLists*) getMembershipListsNow;
+ (CBLists*) getMembershipListsByScreenNameNow:(NSString*)screen_name;
+ (CBLists*) getMembershipListsByScreenNameNow:(NSString*)screen_name params:(CBGetMembershipListsParams*)params;
+ (CBLists*) getMembershipListsByScreenNameNow:(NSString*)screen_name params:(CBGetMembershipListsParams*)params error:(NSError**)error;
+ (CBRequestId*) getMembershipLists:(id)delegate selector:(SEL)selector;           // - (void) membershipListsLoaded:(CBLists*)lists error:(NSError*)error;
+ (CBRequestId*) getMembershipListsByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;
+ (CBRequestId*) getMembershipListsByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetMembershipListsParams*)params;

//Subscription Lists by User Id
+ (CBLists*) getSubscriptionListsByUserIdNow:(int)user_id;
+ (CBLists*) getSubscriptionListsByUserIdNow:(int)user_id params:(CBGetSubscriptionListsParams*)params;
+ (CBLists*) getSubscriptionListsByUserIdNow:(int)user_id params:(CBGetSubscriptionListsParams*)params error:(NSError**)error;
+ (CBRequestId*) getSubscriptionListsByUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector;           // - (void) subscriptionListsLoaded:(CBLists*)lists error:(NSError*)error;
+ (CBRequestId*) getSubscriptionListsByUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetSubscriptionListsParams*)params;

//Subscription Lists by Screen Name
+ (CBLists*) getSubscriptionListsNow;
+ (CBLists*) getSubscriptionListsByScreenNameNow:(NSString*)screen_name;
+ (CBLists*) getSubscriptionListsByScreenNameNow:(NSString*)screen_name params:(CBGetSubscriptionListsParams*)params;
+ (CBLists*) getSubscriptionListsByScreenNameNow:(NSString*)screen_name params:(CBGetSubscriptionListsParams*)params error:(NSError**)error;
+ (CBRequestId*) getSubscriptionLists:(id)delegate selector:(SEL)selector;           // - (void) subscriptionListsLoaded:(CBLists*)lists error:(NSError*)error;
+ (CBRequestId*) getSubscriptionListsByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;
+ (CBRequestId*) getSubscriptionListsByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetSubscriptionListsParams*)params;

//List by Id
+ (CBList*) getListByIdNow:(int)list_id;
+ (CBList*) getListByIdNow:(int)list_id params:(CBGetListParams*)params;
+ (CBList*) getListByIdNow:(int)list_id params:(CBGetListParams*)params error:(NSError**)error;
+ (CBRequestId*) getListById:(int)list_id delegate:(id)delegate selector:(SEL)selector;           // - (void) listLoaded:(CBList*)list error:(NSError*)error;
+ (CBRequestId*) getListById:(int)list_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListParams*)params;

//List by Name & User Id
+ (CBList*) getListByNameNow:(NSString*)slug userId:(int)user_id;
+ (CBList*) getListByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListParams*)params;
+ (CBList*) getListByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListParams*)params error:(NSError**)error;
+ (CBRequestId*) getListByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector;           // - (void) listLoaded:(CBList*)list error:(NSError*)error;
+ (CBRequestId*) getListByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListParams*)params;

//List by Name & Screen Name
+ (CBList*) getListByNameNow:(NSString*)slug screenName:(NSString*)screen_name;
+ (CBList*) getListByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListParams*)params;
+ (CBList*) getListByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListParams*)params error:(NSError**)error;
+ (CBRequestId*) getListByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;           // - (void) listLoaded:(CBList*)list error:(NSError*)error;
+ (CBRequestId*) getListByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetListParams*)params;

//List Statuses by Id
+ (NSArray*) getListStatusesByIdNow:(int)list_id;
+ (NSArray*) getListStatusesByIdNow:(int)list_id params:(CBGetListStatusesParams*)params;
+ (NSArray*) getListStatusesByIdNow:(int)list_id params:(CBGetListStatusesParams*)params error:(NSError**)error;
+ (CBRequestId*) getListStatusesById:(int)list_id delegate:(id)delegate selector:(SEL)selector;           // - (void) listStatusesLoaded:(NSArray*)statuses error:(NSError*)error;
+ (CBRequestId*) getListStatusesById:(int)list_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListStatusesParams*)params;

//List Statuses by Name & User Id
+ (NSArray*) getListStatusesByNameNow:(NSString*)slug userId:(int)user_id;
+ (NSArray*) getListStatusesByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListStatusesParams*)params;
+ (NSArray*) getListStatusesByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListStatusesParams*)params error:(NSError**)error;
+ (CBRequestId*) getListStatusesByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector;           // - (void) listStatusesLoaded:(NSArray*)statuses error:(NSError*)error;
+ (CBRequestId*) getListStatusesByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListStatusesParams*)params;

//List Statuses by Name & Screen Name
+ (NSArray*) getListStatusesByNameNow:(NSString*)slug screenName:(NSString*)screen_name;
+ (NSArray*) getListStatusesByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListStatusesParams*)params;
+ (NSArray*) getListStatusesByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListStatusesParams*)params error:(NSError**)error;
+ (CBRequestId*) getListStatusesByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;           // - (void) listStatusesLoaded:(NSArray*)statuses error:(NSError*)error;
+ (CBRequestId*) getListStatusesByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetListStatusesParams*)params;

//Create List
+ (CBList*) createListNow:(NSString*)name;
+ (CBList*) createListNow:(NSString*)name params:(CBCreateListParams*)params;
+ (CBList*) createListNow:(NSString*)name params:(CBCreateListParams*)params error:(NSError**)error;
+ (CBRequestId*) createList:(NSString*)name delegate:(id)delegate selector:(SEL)selector;           // - (void) listCreated:(CBList*)list error:(NSError*)error;
+ (CBRequestId*) createList:(NSString*)name delegate:(id)delegate selector:(SEL)selector params:(CBCreateListParams*)params;

//Update List by Id
+ (CBList*) updateListByIdNow:(int)list_id params:(CBUpdateListParams*)params;
+ (CBList*) updateListByIdNow:(int)list_id params:(CBUpdateListParams*)params error:(NSError**)error;
+ (CBRequestId*) updateListById:(int)list_id delegate:(id)delegate selector:(SEL)selector params:(CBUpdateListParams*)params;           // - (void) listUpdated:(CBList*)list error:(NSError*)error;

//Update List by Name & User Id
+ (CBList*) updateListByNameNow:(NSString*)slug userId:(int)user_id params:(CBUpdateListParams*)params;
+ (CBList*) updateListByNameNow:(NSString*)slug userId:(int)user_id params:(CBUpdateListParams*)params error:(NSError**)error;
+ (CBRequestId*) updateListByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBUpdateListParams*)params;           // - (void) listUpdated:(CBList*)list error:(NSError*)error;

//Update List by Name & Screen Name
+ (CBList*) updateListByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBUpdateListParams*)params;
+ (CBList*) updateListByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBUpdateListParams*)params error:(NSError**)error;
+ (CBRequestId*) updateListByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBUpdateListParams*)params;           // - (void) listUpdated:(CBList*)list error:(NSError*)error;

//Delete List by Id
+ (void) deleteListByIdNow:(int)list_id;
+ (void) deleteListByIdNow:(int)list_id error:(NSError**)error;
+ (CBRequestId*) deleteListById:(int)list_id delegate:(id)delegate selector:(SEL)selector;           // - (void) listDeleted:(NSError*)error;

//Delete List by Name & User Id
+ (void) deleteListByNameNow:(NSString*)slug userId:(int)user_id;
+ (void) deleteListByNameNow:(NSString*)slug userId:(int)user_id error:(NSError**)error;
+ (CBRequestId*) deleteListByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector;           // - (void) listDeleted:(NSError*)error;

//Delete List by Name & Screen Name
+ (void) deleteListByNameNow:(NSString*)slug screenName:(NSString*)screen_name;
+ (void) deleteListByNameNow:(NSString*)slug screenName:(NSString*)screen_name error:(NSError**)error;
+ (CBRequestId*) deleteListByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;           // - (void) listDeleted:(NSError*)error;

@end
