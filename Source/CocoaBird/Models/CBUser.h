//
//  CBUser.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/5/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBUser : CBEntity {
    
}

@property (retain) NSString* name;
@property (retain) NSString* profile_sidebar_border_color;
@property (retain) NSNumber* profile_background_tile;
@property (retain) NSString* profile_sidebar_fill_color;
@property (retain) NSDate* created_at;
@property (retain) NSString* profile_image_url;
@property (retain) NSString* location;
@property (retain) NSString* profile_link_color;
@property (retain) NSNumber* follow_request_sent;
@property (retain) NSString* url;
@property (retain) NSNumber* favourites_count;
@property (retain) NSNumber* contributors_enabled;
@property (retain) NSNumber* utc_offset;
@property (retain) NSNumber* id;
@property (retain) NSNumber* profile_use_background_image;
@property (retain) NSString* profile_text_color;
@property (retain) NSNumber* protected;
@property (retain) NSNumber* followers_count;
@property (retain) NSString* lang;
@property (retain) NSNumber* notifications; //bool
@property (retain) NSString* time_zone;
@property (retain) NSNumber* verified;
@property (retain) NSString* profile_background_color;
@property (retain) NSNumber* geo_enabled;
@property (retain) NSString* description;
@property (retain) NSNumber* friends_count;
@property (retain) NSNumber* statuses_count;
@property (retain) NSString* profile_background_image_url;
@property (retain) NSNumber* following;
@property (retain) NSString* screen_name;

@end
