//
//  CBTrendForLocation.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBTrendsForLocation : CBEntity {
    
}

@property (retain) NSDate* created_at;
@property (retain) NSArray* trends;
@property (retain) NSArray* locations;
@property (retain) NSDate* as_of;

@end
