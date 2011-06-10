//
//  CBStatusesParams.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CBStatusesParams.h"


@implementation CBGetStatusParams
@synthesize trim_user, include_entities;
@end


@implementation CBUpdateStatusParams
@synthesize status, in_reply_to_status_id, lat, long_, place_id, display_coordinates, trim_user, include_entities;
@end


