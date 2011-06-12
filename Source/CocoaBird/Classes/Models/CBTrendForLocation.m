//
//  CBTrendForLocation.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CBTrendForLocation.h"
#import "CBTrendLocation.h"
#import "CBTrend.h"

@implementation CBTrendForLocation

@synthesize created_at, trends, locations, as_of;

- (NSDictionary*) arrayPropertyClasses
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
            [CBTrend class], @"trends", 
            [CBTrendLocation class], @"locations",
            nil];
}

@end
