//
//  CBTweetsParams.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CBTweetsParams.h"

@implementation CBPublicTimelineParams
@synthesize trim_user, include_entities;
@end


@implementation CBHomeTimelineParams
@synthesize since_id, max_id, count, page, trim_user, include_entities;
@end


@implementation CBUserTimelineParams
@synthesize user_id, screen_name, since_id, max_id, count, page, trim_user, include_rts, include_entities;
@end


@implementation CBMentionsParams
@synthesize since_id, max_id, count, page, trim_user, include_rts, include_entities;
@end


@implementation CBRetweetedByMeParams
@synthesize since_id, max_id, count, page, trim_user, include_entities;
@end


@implementation CBRetweetedToMeParams
@synthesize since_id, max_id, count, page, trim_user, include_entities;
@end


@implementation CBRetweetsOfMeParams
@synthesize since_id, max_id, count, page, trim_user, include_entities;
@end



