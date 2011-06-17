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


@interface CBEnableNotificationsParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* include_entities;
@property (retain) NSNumber* skip_status;
@end

@interface CBDisableNotificationsParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* include_entities;
@property (retain) NSNumber* skip_status;
@end


@interface CocoaBird (Notification)

//Enable Notifications
+ (CBUser*) enableNotificationsNow:(CBEnableNotificationsParams*)params error:(NSError**)error;
+ (CBRequestId*) enableNotifications:(CBEnableNotificationsParams*)params delegate:(id)delegate selector:(SEL)selector;    // - (void) notificationsEnabled:(CBUser*)user error:(NSError*)error;

//Disable Notifications
+ (CBUser*) disableNotificationsNow:(CBDisableNotificationsParams*)params error:(NSError**)error;
+ (CBRequestId*) disableNotifications:(CBDisableNotificationsParams*)params delegate:(id)delegate selector:(SEL)selector;    // - (void) notificationsDisabled:(CBUser*)user error:(NSError*)error;

@end


