//
//  CBSearchResults.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/17/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"


@interface CBSearchResultMetadata : CBEntity {}
@property (retain) NSString* result_type;
@property (retain) NSNumber* recent_retweets;
@end

@interface CBSearchResult : CBEntity {}
@property (retain) NSString* text;
@property (retain) NSNumber* to_user_id;
@property (retain) NSString* to_user;
@property (retain) NSString* from_user;
@property (retain) CBSearchResultMetadata* metadata;
@property (retain) NSNumber* id;
@property (retain) NSNumber* from_user_id;
@property (retain) NSString* iso_language_code;
@property (retain) NSString* source;
@property (retain) NSString* profile_image_url;
@property (retain) NSDate* created_at;
@end


@interface CBSearchResults : CBEntity {}
@property (retain) NSArray* results;
@property (retain) NSNumber* since_id;
@property (retain) NSNumber* max_id;
@property (retain) NSString* refresh_url;
@property (retain) NSNumber* next_page;
@property (retain) NSNumber* completed_in;
@property (retain) NSNumber* page;
@property (retain) NSString* query;
@end
