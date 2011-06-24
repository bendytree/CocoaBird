//
//  CBSearchResults.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/17/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CBSearchResults.h"




@implementation CBSearchResultMetadata
@synthesize result_type, recent_retweets;
@end



@implementation CBSearchResult
@synthesize text, to_user_id, to_user, from_user, metadata, id, from_user_id, iso_language_code, source,
        profile_image_url, created_at;
@end


@implementation CBSearchResults
@synthesize results, since_id, max_id, refresh_url, next_page, completed_in, page, query;
- (NSDictionary*) arrayPropertyClasses
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
            [CBSearchResult class], @"results", 
            nil];
}
@end
