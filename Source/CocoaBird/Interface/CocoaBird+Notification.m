//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Notification.h"
#import "CocoaBirdSettings.h"


@implementation CBEnableNotificationsParams
@synthesize user_id, screen_name, include_entities, skip_status;
@end

@implementation CBDisableNotificationsParams
@synthesize user_id, screen_name, include_entities, skip_status;
@end



@implementation CocoaBird (Notification)


#pragma Enable Notifications

+ (CBUser*) enableNotificationsNow:(CBEnableNotificationsParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/notifications/follow.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBUser class] error:error];
}

+ (CBRequestId*) enableNotifications:(CBEnableNotificationsParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/notifications/follow.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBUser class] delegate:delegate selector:selector];    
}


#pragma Disable Notifications

+ (CBUser*) disableNotificationsNow:(CBDisableNotificationsParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/notifications/leave.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBUser class] error:error];
}

+ (CBRequestId*) disableNotifications:(CBDisableNotificationsParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/notifications/leave.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBUser class] delegate:delegate selector:selector];    
}


@end
