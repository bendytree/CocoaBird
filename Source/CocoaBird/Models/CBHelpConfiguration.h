//
//  CBHelpConfiguration.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/15/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBHelpConfiguration : CBEntity {
    
}

@property (retain) NSNumber* characters_reserved_per_media;
@property (retain) NSNumber* max_media_per_upload;
@property (retain) NSArray* non_username_paths;
@property (retain) NSNumber* photo_size_limit;
@property (retain) NSDictionary* photo_sizes;
@property (retain) NSNumber* short_url_length_https;
@property (retain) NSNumber* short_url_length;

@end
