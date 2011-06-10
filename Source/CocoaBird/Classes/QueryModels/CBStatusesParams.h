//
//  CBStatusesParams.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBQueryParams.h"


@interface CBShowStatusParams : CBQueryParams {}
@property (retain) NSNumber* id;
@property (retain) NSNumber* trim_user;
@property (retain) NSNumber* include_entities;
@end


@interface CBUpdateStatusParams : CBQueryParams {}
@property (retain) NSString* status;
@property (retain) NSNumber* in_reply_to_status_id;
@property (retain) NSNumber* lat;
@property (retain) NSNumber* long_;      //i'm trying to think of what languages DONT have long as a keyword. Frick'n twitter api.  Who thought 'in_reply_to_status_id' was short enough, but 'longitude' needed to be shortened to 'long'?
@property (retain) NSString* place_id;
@property (retain) NSNumber* display_coordinates;
@property (retain) NSNumber* trim_user;
@property (retain) NSNumber* include_entities;
@end

