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

@interface CBTrendLocationsParams : CBQueryParams {}
@property (retain) NSString* lat;
@property (retain) NSString* long_;
@end


@interface CocoaBird (LocalTrends)

//Trend Locations
+ (NSArray*) getTrendLocationsNow;
+ (NSArray*) getTrendLocationsNow:(CBTrendLocationsParams*)params;
+ (NSArray*) getTrendLocationsNow:(CBTrendLocationsParams*)params error:(NSError**)error;
+ (NSString*) getTrendLocations:(id)delegate selector:(SEL)selector;         // - (void) trendLocationsLoaded:(NSArray*)trendLocations error:(NSError*)error;
+ (NSString*) getTrendLocations:(id)delegate selector:(SEL)selector params:(CBTrendLocationsParams*)params;

//Trend Locations
+ (NSArray*) getTrendsForLocationNow:(int)woeid;
+ (NSArray*) getTrendsForLocationNow:(int)woeid error:(NSError**)error;
+ (NSString*) getTrendsForLocation:(int)woeid delegate:(id)delegate selector:(SEL)selector;         // - (void) trendsForLocationLoaded:(NSArray*)trends error:(NSError*)error;

@end


