//
//  CBAccountSettings.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/12/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"
#import "CBSleepTime.h"
#import "CBTimeZone.h"

@interface CBAccountSettings : CBEntity {
    
}

@property (retain) CBSleepTime* sleep_time;
@property (retain) NSArray* trend_location;
@property (retain) NSString* language;
@property (retain) NSNumber* always_use_https;
@property (retain) NSNumber* discoverable_by_email;
@property (retain) CBTimeZone* time_zone;
@property (retain) NSNumber* geo_enabled;

@end
