//
//  CBRateLimitStatus.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBRateLimitStatus : CBEntity {
    
}

@property (retain) NSNumber* hourly_limit;
@property (retain) NSNumber* reset_time_in_seconds;
@property (retain) NSNumber* remaining_hits;
@property (retain) NSDate* reset_time;

@end
