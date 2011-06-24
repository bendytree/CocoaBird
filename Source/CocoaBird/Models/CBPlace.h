//
//  CBPlace.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/5/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"
#import "CBPlaceAttributes.h"
#import "CBBoundingBox.h"
#import "CBCoordinates.h"

@interface CBPlace : CBEntity {
    
}

@property (retain) NSString* name;
@property (retain) NSArray* polylines;
@property (retain) NSString* country_code;
@property (retain) NSString* country;
@property (retain) CBPlaceAttributes* attributes;
@property (retain) NSString* url;
@property (retain) NSString* id;
@property (retain) CBBoundingBox* bounding_box;
@property (retain) NSArray* contained_within;
@property (retain) CBCoordinates* geometry;
@property (retain) NSString* full_name;
@property (retain) NSString* place_type;

@end
