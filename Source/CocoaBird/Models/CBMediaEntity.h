//
//  CBMediaEntity.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/5/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"
#import "CBMediaSizes.h"

@interface CBMediaEntity : CBEntity {
    
}

@property (retain) NSNumber* id;
@property (retain) NSString* id_str;
@property (retain) NSString* media_url;
@property (retain) NSString* media_url_https;
@property (retain) NSString* url;
@property (retain) NSString* display_url;
@property (retain) NSString* expanded_url;
@property (retain) CBMediaSizes* sizes;
@property (retain) NSString* type;
@property (retain) NSArray* indices;

@end
