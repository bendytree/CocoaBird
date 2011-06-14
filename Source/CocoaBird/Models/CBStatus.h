//
//  CBStatus.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"
#import "CBUser.h"
#import "CBCoordinates.h"
#import "CBEntities.h"
#import "CBPlace.h"

@interface CBStatus : CBEntity {
    
}

@property (retain) CBCoordinates* coordinates;
@property (retain) NSNumber* favorited;
@property (retain) NSDate* created_at;
@property (retain) NSNumber* truncated;
@property (retain) CBEntities* entities;
@property (retain) NSString* text;
@property (retain) NSArray* contributors;               // Array of user ids (ints) - http://mettadore.com/analysis/twitter-adds-delegation-to-api-via-contributors/
@property (retain) NSNumber* id;
@property (retain) CBCoordinates* geo;
@property (retain) NSNumber* in_reply_to_user_id;
@property (retain) CBPlace* place;
@property (retain) NSString* in_reply_to_screen_name;
@property (retain) CBUser* user;
@property (retain) NSString* source;
@property (retain) NSNumber* in_reply_to_status_id;



@end
