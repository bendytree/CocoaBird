//
//  CocoaBird+Tweets.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBird.h"
#import "CocoaBird+Core.h"
#import "CBModels.h"


@interface CBSearchGeoParams : CBQueryParams {}
@property (retain) NSNumber* lat;
@property (retain) NSString* long_;
@property (retain) NSString* query;
@property (retain) NSString* ip;
@property (retain) NSString* granularity;
@property (retain) NSString* accuracy;
@property (retain) NSNumber* max_results;
@property (retain) NSString* contained_within;
@property (retain) NSString* place_id;
@end

@interface CBSearchForSimilarPlacesParams : CBQueryParams {}
@property (retain) NSNumber* lat;
@property (retain) NSString* long_;
@property (retain) NSString* name;
@property (retain) NSString* contained_within;
@end

@interface CBReverseGeocodeParams : CBQueryParams {}
@property (retain) NSNumber* lat;
@property (retain) NSString* long_;
@property (retain) NSString* granularity;
@property (retain) NSString* accuracy;
@property (retain) NSNumber* max_results;
@end

@interface CBCreatePlaceParams : CBQueryParams {}
@property (retain) NSNumber* lat;
@property (retain) NSString* long_;
@property (retain) NSString* name;
@property (retain) NSString* contained_within;
@property (retain) NSString* token;
@end


@interface CocoaBird (Geo)

//Search Geo
+ (CBGeoSearchResponse*) searchGeoNow:(CBSearchGeoParams*)params error:(NSError**)error;
+ (NSString*) searchGeo:(id)delegate selector:(SEL)selector params:(CBSearchGeoParams*)params;    // - (void) geoLoaded:(CBGeoSearchResponse*)response error:(NSError*)error;

//Search for Similar Places
+ (CBGeoSearchResponse*) searchForSimilarPlacesNow:(CBSearchForSimilarPlacesParams*)params error:(NSError**)error;
+ (NSString*) searchForSimilarPlaces:(id)delegate selector:(SEL)selector params:(CBSearchForSimilarPlacesParams*)params;    // - (void) similarPlacesLoaded:(CBGeoSearchResponse*)response error:(NSError*)error;

//Reverse Geocode
+ (CBGeoSearchResponse*) reverseGeocodeNow:(CBReverseGeocodeParams*)params error:(NSError**)error;
+ (NSString*) reverseGeocode:(id)delegate selector:(SEL)selector params:(CBReverseGeocodeParams*)params;    // - (void) reverseGeocodeLoaded:(CBGeoSearchResponse*)response error:(NSError*)error;

//Get Place
+ (CBPlace*) getPlaceNow:(NSString*)place_id error:(NSError**)error;
+ (NSString*) getPlace:(NSString*)place_id delegate:(id)delegate selector:(SEL)selector;    // - (void) placeLoaded:(CBPlace*)place error:(NSError*)error;

//Create Place
+ (CBPlace*) createPlaceNow:(CBCreatePlaceParams*)params error:(NSError**)error;
+ (NSString*) createPlace:(CBCreatePlaceParams*)params delegate:(id)delegate selector:(SEL)selector;    // - (void) placeCreated:(CBPlace*)place error:(NSError*)error;

@end


