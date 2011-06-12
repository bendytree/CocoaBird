//
//  CBTrendLocation.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"
#import "CBPlaceType.h"

@interface CBTrendLocation : CBEntity {
    
}

@property (retain) NSString* name;
@property (retain) NSNumber* woeid;
@property (retain) CBPlaceType* placeType;
@property (retain) NSString* country;
@property (retain) NSString* url;
@property (retain) NSString* countryCode;

@end
