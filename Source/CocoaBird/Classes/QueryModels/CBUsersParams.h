//
//  CBUsersParams.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBQueryParams.h"


@interface CBGetUserParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* skip_status;
@property (retain) NSNumber* include_entities;
@end


@interface CBGetUsersParams : CBQueryParams {}
@property (retain) NSString* user_id;           // comma separated list of user ids
@property (retain) NSString* screen_name;       // comma separated list of screen names
@property (retain) NSNumber* skip_status;
@property (retain) NSNumber* include_entities;
@end


@interface CBSearchUsersParams : CBQueryParams {}
@property (retain) NSString* q;
@property (retain) NSNumber* per_page;
@property (retain) NSNumber* page;
@property (retain) NSNumber* skip_status;
@property (retain) NSNumber* include_entities;
@end



