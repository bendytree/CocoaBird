//
//  CBTweetsParams.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBQueryParams.h"


@interface CBPublicTimelineParams : CBQueryParams {}
@property (retain) NSNumber* trim_user;
@property (retain) NSNumber* include_entities;
@end


@interface CBHomeTimelineParams : CBQueryParams {}
@property (assign) NSNumber* since_id;
@property (assign) NSNumber* max_id;
@property (assign) NSNumber* count;
@property (assign) NSNumber* page;
@property (assign) NSNumber* trim_user;
@property (assign) NSNumber* include_entities;
@end


@interface CBUserTimelineParams : CBQueryParams {}
@property (assign) NSNumber* user_id;
@property (assign) NSString* screen_name;
@property (assign) NSNumber* since_id;
@property (assign) NSNumber* max_id;
@property (assign) NSNumber* count;
@property (assign) NSNumber* page;
@property (assign) NSNumber* trim_user;
@property (assign) NSNumber* include_rts;
@property (assign) NSNumber* include_entities;
@end


@interface CBMentionsParams : CBQueryParams {}
@property (assign) NSNumber* since_id;
@property (assign) NSNumber* max_id;
@property (assign) NSNumber* count;
@property (assign) NSNumber* page;
@property (assign) NSNumber* trim_user;
@property (assign) NSNumber* include_rts;
@property (assign) NSNumber* include_entities;
@end


@interface CBRetweetedByMeParams : CBQueryParams {}
@property (assign) NSNumber* since_id;
@property (assign) NSNumber* max_id;
@property (assign) NSNumber* count;
@property (assign) NSNumber* page;
@property (assign) NSNumber* trim_user;
@property (assign) NSNumber* include_entities;
@end


@interface CBRetweetedToMeParams : CBQueryParams {}
@property (assign) NSNumber* since_id;
@property (assign) NSNumber* max_id;
@property (assign) NSNumber* count;
@property (assign) NSNumber* page;
@property (assign) NSNumber* trim_user;
@property (assign) NSNumber* include_entities;
@end

@interface CBRetweetsOfMeParams : CBQueryParams {}
@property (assign) NSNumber* since_id;
@property (assign) NSNumber* max_id;
@property (assign) NSNumber* count;
@property (assign) NSNumber* page;
@property (assign) NSNumber* trim_user;
@property (assign) NSNumber* include_entities;
@end


