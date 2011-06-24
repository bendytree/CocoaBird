//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CocoaBird+Geo.h"
#import "CocoaBirdSettings.h"


@implementation CBSearchGeoParams
@synthesize lat, long_, query, ip, granularity, accuracy, max_results, contained_within, place_id;
@end

@implementation CBSearchForSimilarPlacesParams
@synthesize lat, long_, name, contained_within;
@end

@implementation CBReverseGeocodeParams
@synthesize lat, long_, granularity, accuracy, max_results;
@end

@implementation CBCreatePlaceParams
@synthesize lat, long_, name, contained_within, token;
@end



@implementation CocoaBird (Geo)

#pragma Search Geo

+ (CBGeoSearchResponse*) searchGeoNow:(CBSearchGeoParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/geo/search.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBGeoSearchResponse class] error:error];
}

+ (CBRequestId*) searchGeo:(id)delegate selector:(SEL)selector params:(CBSearchGeoParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/geo/search.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBGeoSearchResponse class] delegate:delegate selector:selector];    
}


#pragma Search for Similar Places

+ (CBGeoSearchResponse*) searchForSimilarPlacesNow:(CBSearchForSimilarPlacesParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/geo/similar_places.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBGeoSearchResponse class] error:error];
}

+ (CBRequestId*) searchForSimilarPlaces:(id)delegate selector:(SEL)selector params:(CBSearchForSimilarPlacesParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/geo/similar_places.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBGeoSearchResponse class] delegate:delegate selector:selector];    
}


#pragma Reverse Geocode

+ (CBGeoSearchResponse*) reverseGeocodeNow:(CBReverseGeocodeParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/geo/reverse_geocode.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBGeoSearchResponse class] error:error];
}

+ (CBRequestId*) reverseGeocode:(id)delegate selector:(SEL)selector params:(CBReverseGeocodeParams*)params
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/geo/reverse_geocode.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBGeoSearchResponse class] delegate:delegate selector:selector];    
}


#pragma Get Place

+ (CBPlace*) getPlaceNow:(NSString*)place_id error:(NSError**)error
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/geo/id/%@.json", place_id];
    return [self processRequestSynchronous:url method:@"GET" params:nil type:CBTwitterResponseTypeCustom class:[CBPlace class] error:error];
}

+ (CBRequestId*) getPlace:(NSString*)place_id delegate:(id)delegate selector:(SEL)selector
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/geo/id/%@.json", place_id];
    return [self processRequestAsynchronous:url method:@"GET" params:nil type:CBTwitterResponseTypeCustom class:[CBPlace class] delegate:delegate selector:selector];    
}


#pragma Create Place

+ (CBPlace*) createPlaceNow:(CBCreatePlaceParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/geo/place.json" method:@"POST" params:params type:CBTwitterResponseTypeCustom class:[CBPlace class] error:error];
}

+ (CBRequestId*) createPlace:(CBCreatePlaceParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/geo/place.json" method:@"POST" params:params type:CBTwitterResponseTypeCustom class:[CBPlace class] delegate:delegate selector:selector];       
}



@end
