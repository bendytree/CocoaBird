//
//  CBGeoSearchResponse.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/15/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@class CBCoordinates;


@interface CBGeoSearchResult : CBEntity {}
@property (retain) NSArray* places;
@end

@interface CBGeoSearchResponseQueryParams : CBEntity {}
@property (retain) NSString* name;
@property (retain) CBCoordinates* coordinates;
@property (retain) NSString* granularity;
@property (retain) NSNumber* accuracy;
@property (retain) NSNumber* autocomplete;
@property (retain) NSString* query;
@end

@interface CBGeoSearchResponseQuery : CBEntity {}
@property (retain) NSString* url;
@property (retain) NSString* type;
@property (retain) CBGeoSearchResponseQueryParams* params;
@end

@interface CBGeoSearchResponse : CBEntity {}
@property (retain) CBGeoSearchResult* result;
@property (retain) CBGeoSearchResponseQuery* query;
@end
