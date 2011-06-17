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


@interface CBGetSavedSearchesParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* include_entities;
@property (retain) NSNumber* skip_status;
@end

@interface CBCreateSavedSearchParams : CBQueryParams {}
@property (retain) NSString* query;
@end


@interface CocoaBird (SavedSearches)

//Get Saved Searches
+ (NSArray*) getSavedSearchesNow:(NSError**)error;
+ (CBRequestId*) getSavedSearches:(id)delegate selector:(SEL)selector;    // - (void) savedSearchesLoaded:(NSArray*)savedSearches error:(NSError*)error;

//Get Saved Search
+ (CBSavedSearch*) getSavedSearchNow:(int)search_id error:(NSError**)error;
+ (CBRequestId*) getSavedSearch:(int)search_id delegate:(id)delegate selector:(SEL)selector;    // - (void) savedSearchLoaded:(CBSavedSearch*)savedSearch error:(NSError*)error;

//Create Saved Search
+ (CBSavedSearch*) createSavedSearchNow:(NSString*)query error:(NSError**)error;
+ (CBRequestId*) createSavedSearch:(NSString*)query delegate:(id)delegate selector:(SEL)selector;    // - (void) savedSearchCreated:(CBSavedSearch*)savedSearch error:(NSError*)error;

//Delete Saved Search
+ (CBSavedSearch*) deleteSavedSearchNow:(id)search_id error:(NSError**)error;
+ (CBRequestId*) deleteSavedSearch:(id)search_id delegate:(id)delegate selector:(SEL)selector;    // - (void) savedSearchDeleted:(CBSavedSearch*)savedSearch error:(NSError*)error;

@end


