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
#import "CBTrendsResponse.h"

@interface CBGetTrendsParams : CBQueryParams {}
@property (retain) NSString* date;
@property (retain) NSString* exclude;
@end


@interface CocoaBird (Trends)

//Trends
+ (CBTrendsResponse*) getTrendsNow;
+ (CBTrendsResponse*) getTrendsNow:(CBGetTrendsParams*)params;
+ (CBTrendsResponse*) getTrendsNow:(CBGetTrendsParams*)params error:(NSError**)error;
+ (CBRequestId*) getTrends:(id)delegate selector:(SEL)selector;         // - (void) trendsLoaded:(CBTrendsResponse*)trends error:(NSError*)error;
+ (CBRequestId*) getTrends:(id)delegate selector:(SEL)selector params:(CBGetTrendsParams*)params;

//Current Trends
+ (CBTrendsResponse*) getCurrentTrendsNow;
+ (CBTrendsResponse*) getCurrentTrendsNow:(CBGetTrendsParams*)params;
+ (CBTrendsResponse*) getCurrentTrendsNow:(CBGetTrendsParams*)params error:(NSError**)error;
+ (CBRequestId*) getCurrentTrends:(id)delegate selector:(SEL)selector;         // - (void) currentTrendsLoaded:(CBTrendsResponse*)currentTrends error:(NSError*)error;
+ (CBRequestId*) getCurrentTrends:(id)delegate selector:(SEL)selector params:(CBGetTrendsParams*)params;

//Daily Trends
+ (CBTrendsResponse*) getDailyTrendsNow;
+ (CBTrendsResponse*) getDailyTrendsNow:(CBGetTrendsParams*)params;
+ (CBTrendsResponse*) getDailyTrendsNow:(CBGetTrendsParams*)params error:(NSError**)error;
+ (CBRequestId*) getDailyTrends:(id)delegate selector:(SEL)selector;         // - (void) dailyTrendsLoaded:(CBTrendsResponse*)dailyTrends error:(NSError*)error;
+ (CBRequestId*) getDailyTrends:(id)delegate selector:(SEL)selector params:(CBGetTrendsParams*)params;

//Weekly Trends
+ (CBTrendsResponse*) getWeeklyTrendsNow;
+ (CBTrendsResponse*) getWeeklyTrendsNow:(CBGetTrendsParams*)params;
+ (CBTrendsResponse*) getWeeklyTrendsNow:(CBGetTrendsParams*)params error:(NSError**)error;
+ (CBRequestId*) getWeeklyTrends:(id)delegate selector:(SEL)selector;         // - (void) weeklyTrendsLoaded:(CBTrendsResponse*)weeklyTrends error:(NSError*)error;
+ (CBRequestId*) getWeeklyTrends:(id)delegate selector:(SEL)selector params:(CBGetTrendsParams*)params;

@end


