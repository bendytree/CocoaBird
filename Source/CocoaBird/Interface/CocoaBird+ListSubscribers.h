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

@interface CBGetListSubscribersParams : CBQueryParams {}
@property (retain) NSNumber* list_id;
@property (retain) NSString* slug;
@property (retain) NSNumber* owner_id;
@property (retain) NSString* owner_screen_name;
@property (retain) NSNumber* cursor;
@property (retain) NSNumber* include_entities;
@property (retain) NSNumber* skip_status;
@end

@interface CBIsUserSubscriberOfListParams : CBQueryParams {}
@property (retain) NSNumber* list_id;
@property (retain) NSString* slug;
@property (retain) NSNumber* owner_id;
@property (retain) NSString* owner_screen_name;
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* include_entities;
@property (retain) NSNumber* skip_status;
@end

@interface CBSubscribeToListParams : CBQueryParams {}
@property (retain) NSNumber* list_id;
@property (retain) NSString* slug;
@property (retain) NSNumber* owner_id;
@property (retain) NSString* owner_screen_name;
@end

@interface CBRemoveSubscriberFromListParams : CBQueryParams {}
@property (retain) NSNumber* list_id;
@property (retain) NSString* slug;
@property (retain) NSNumber* owner_id;
@property (retain) NSString* owner_screen_name;
@end


@interface CocoaBird (ListSubscribers)

//List by Id
+ (CBListSubscribers*) getListSubscribersByIdNow:(int)list_id;
+ (CBListSubscribers*) getListSubscribersByIdNow:(int)list_id params:(CBGetListSubscribersParams*)params;
+ (CBListSubscribers*) getListSubscribersByIdNow:(int)list_id params:(CBGetListSubscribersParams*)params error:(NSError**)error;
+ (CBRequestId*) getListSubscribersById:(int)list_id delegate:(id)delegate selector:(SEL)selector;           // - (void) listSubscribersLoaded:(CBListSubscribers*)listSubscribers error:(NSError*)error;
+ (CBRequestId*) getListSubscribersById:(int)list_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListSubscribersParams*)params;

//List by Name & User Id
+ (CBListSubscribers*) getListSubscribersByNameNow:(NSString*)slug userId:(int)user_id;
+ (CBListSubscribers*) getListSubscribersByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListSubscribersParams*)params;
+ (CBListSubscribers*) getListSubscribersByNameNow:(NSString*)slug userId:(int)user_id params:(CBGetListSubscribersParams*)params error:(NSError**)error;
+ (CBRequestId*) getListSubscribersByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector;           // - (void) listSubscribersLoaded:(CBListSubscribers*)listSubscribers error:(NSError*)error;
+ (CBRequestId*) getListSubscribersByName:(NSString*)slug userId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListSubscribersParams*)params;

//List by Name & Screen Name
+ (CBListSubscribers*) getListSubscribersByNameNow:(NSString*)slug screenName:(NSString*)screen_name;
+ (CBListSubscribers*) getListSubscribersByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListSubscribersParams*)params;
+ (CBListSubscribers*) getListSubscribersByNameNow:(NSString*)slug screenName:(NSString*)screen_name params:(CBGetListSubscribersParams*)params error:(NSError**)error;
+ (CBRequestId*) getListSubscribersByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;           // - (void) listSubscribersLoaded:(CBListSubscribers*)listSubscribers error:(NSError*)error;
+ (CBRequestId*) getListSubscribersByName:(NSString*)slug screenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetListSubscribersParams*)params;

//User Is Subscriber of List
+ (CBUser*) isUserSubscriberOfListNow:(CBIsUserSubscriberOfListParams*)params;
+ (CBUser*) isUserSubscriberOfListNow:(CBIsUserSubscriberOfListParams*)params error:(NSError**)error;
+ (CBRequestId*) isUserSubscriberOfList:(CBIsUserSubscriberOfListParams*)params delegate:(id)delegate selector:(SEL)selector;           // - (void) isSubscriberOfListLoaded:(CBUser*)user error:(NSError*)error;

//Add Subscriber to List
+ (CBUser*) subscribeToListByIdNow:(int)list_id;
+ (CBUser*) subscribeToListByIdNow:(int)list_id error:(NSError**)error;
+ (CBUser*) subscribeToListByNameNow:(NSString*)slug screenName:(NSString*)owner_screen_name;
+ (CBUser*) subscribeToListByNameNow:(NSString*)slug screenName:(NSString*)owner_screen_name error:(NSError**)error;
+ (CBUser*) subscribeToListNow:(CBSubscribeToListParams*)params;
+ (CBUser*) subscribeToListNow:(CBSubscribeToListParams*)params error:(NSError**)error;
+ (CBRequestId*) subscribeToListById:(int)list_id delegate:(id)delegate selector:(SEL)selector;
+ (CBRequestId*) subscribeToListByName:(NSString*)slug screenName:(NSString*)owner_screen_name delegate:(id)delegate selector:(SEL)selector;
+ (CBRequestId*) subscribeToList:(CBSubscribeToListParams*)params delegate:(id)delegate selector:(SEL)selector;           // - (void) subscriberWasAdded:(CBUser*)user error:(NSError*)error;

//Remove Subscriber From List
+ (void) removeSubscriberFromListNow:(CBRemoveSubscriberFromListParams*)params error:(NSError**)error;
+ (CBRequestId*) removeSubscriberFromList:(CBRemoveSubscriberFromListParams*)params delegate:(id)delegate selector:(SEL)selector;           // - (void) subscriberRemoved:(NSError*)error;

@end
