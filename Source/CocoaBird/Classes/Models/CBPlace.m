//
//  CBPlace.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CBPlace.h"


@implementation CBPlace


@synthesize name, polylines, country_code, country,
            attributes, url, id, bounding_box, contained_within,
            geometry, full_name, place_type;



- (NSDictionary*) arrayPropertyClasses
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
            [CBPlace class], @"contained_within", 
            nil];
}

@end
