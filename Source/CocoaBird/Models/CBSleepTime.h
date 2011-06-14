//
//  CBSleepTime.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBSleepTime : CBEntity {
    
}

@property (retain) NSNumber* end_time;
@property (retain) NSNumber* enabled;
@property (retain) NSNumber* start_time;

@end
