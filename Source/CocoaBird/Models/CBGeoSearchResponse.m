//
//  CBGeoSearchResponse.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/15/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CBGeoSearchResponse.h"
#import "CBPlace.h"

@implementation CBGeoSearchResult
@synthesize places;

- (NSDictionary*) arrayPropertyClasses
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
            [CBPlace class], @"places",
            nil];
}
@end

@implementation CBGeoSearchResponseQueryParams
@synthesize name, coordinates, granularity, accuracy, autocomplete, query;
@end

@implementation CBGeoSearchResponseQuery
@synthesize url, type, params;
@end

@implementation CBGeoSearchResponse
@synthesize result, query;
@end