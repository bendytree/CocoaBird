//
//  CocoaBird+Statuses.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBirdBase.h"
#import "CocoaBird+Core.h"



@interface CBGetStatusParams : CBQueryParams {}
@property (retain) NSNumber* trim_user;
@property (retain) NSNumber* include_entities;
@end


@interface CBUpdateStatusParams : CBQueryParams {}
@property (retain) NSString* status;
@property (retain) NSNumber* in_reply_to_status_id;
@property (retain) NSNumber* lat;
@property (retain) NSNumber* long_;      //i'm trying to think of what languages DONT have long as a keyword. Frick'n twitter api.  Who thought 'in_reply_to_status_id' was short enough, but 'longitude' needed to be shortened to 'long'?
@property (retain) NSString* place_id;
@property (retain) NSNumber* display_coordinates;
@property (retain) NSNumber* trim_user;
@property (retain) NSNumber* include_entities;
@end


@interface CBRetweetParams : CBQueryParams {}
@property (retain) NSNumber* trim_user;
@property (retain) NSNumber* include_entities;
@end


@interface CBRetweetedByParams : CBQueryParams {}
@property (retain) NSNumber* page;
@property (retain) NSNumber* count;
@end


@interface CBRetweetedByIdsParams : CBQueryParams {}
@property (retain) NSNumber* page;
@property (retain) NSNumber* count;
@end





@class CBStatus;

@interface CocoaBird (Tweets)

//Show Status
+ (CBStatus*) getStatusNow:(unsigned long long)id;
+ (CBStatus*) getStatusNow:(unsigned long long)id params:(CBGetStatusParams*)params;
+ (CBStatus*) getStatusNow:(unsigned long long)id params:(CBGetStatusParams*)params error:(NSError**)error;
+ (NSString*) getStatus:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector;           // - (void) statusLoaded:(CBStatus*)status error:(NSError*)error;
+ (NSString*) getStatus:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector params:(CBGetStatusParams*)params;

//Update Status
+ (CBStatus*) updateStatusNow:(NSString*)status;
+ (CBStatus*) updateStatusNow:(NSString*)status params:(CBUpdateStatusParams*)params;
+ (CBStatus*) updateStatusNow:(NSString*)status params:(CBUpdateStatusParams*)params error:(NSError**)error;
+ (NSString*) updateStatus:(NSString*)status delegate:(id)delegate selector:(SEL)selector;         // - (void) statusLoaded:(CBStatus*)status error:(NSError*)error;
+ (NSString*) updateStatus:(NSString*)status delegate:(id)delegate selector:(SEL)selector params:(CBUpdateStatusParams*)params;

//Delete Status
+ (void) deleteStatusNow:(unsigned long long)id;
+ (void) deleteStatusNow:(unsigned long long)id error:(NSError**)error;
+ (NSString*) deleteStatus:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector;           // - (void) statusDeleted:(NSError*)error;

//Retweet
+ (CBStatus*) retweetNow:(unsigned long long)id;
+ (CBStatus*) retweetNow:(unsigned long long)id params:(CBRetweetParams*)params;
+ (CBStatus*) retweetNow:(unsigned long long)id params:(CBRetweetParams*)params error:(NSError**)error;
+ (NSString*) retweet:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector;           // - (void) retweetComplete:(CBStatus*)status error:(NSError*)error;
+ (NSString*) retweet:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector params:(CBRetweetParams*)params;

//Retweeted By
+ (NSArray*) getRetweetedByNow:(unsigned long long)id;
+ (NSArray*) getRetweetedByNow:(unsigned long long)id params:(CBRetweetedByParams*)params;
+ (NSArray*) getRetweetedByNow:(unsigned long long)id params:(CBRetweetedByParams*)params error:(NSError**)error;
+ (NSString*) getRetweetedBy:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector;           // - (void) statusLoaded:(NSArray*)users error:(NSError*)error;
+ (NSString*) getRetweetedBy:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector params:(CBRetweetedByParams*)params;

//Retweeted By Ids
+ (NSArray*) getRetweetedByIdsNow:(unsigned long long)id;
+ (NSArray*) getRetweetedByIdsNow:(unsigned long long)id params:(CBRetweetedByIdsParams*)params;
+ (NSArray*) getRetweetedByIdsNow:(unsigned long long)id params:(CBRetweetedByIdsParams*)params error:(NSError**)error;
+ (NSString*) getRetweetedByIds:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector;           // - (void) statusLoaded:(NSArray*)userIds error:(NSError*)error;
+ (NSString*) getRetweetedByIds:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector params:(CBRetweetedByIdsParams*)params;

@end


