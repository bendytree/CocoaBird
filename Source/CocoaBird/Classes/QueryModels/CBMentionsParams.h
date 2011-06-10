//
//  CBMentionsParams.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBQueryParams.h"

@interface CBMentionsParams : CBQueryParams {
    
}


@property (assign) NSNumber* since_id;
@property (assign) NSNumber* max_id;
@property (assign) NSNumber* count;
@property (assign) NSNumber* page;
@property (assign) NSNumber* trim_user;
@property (assign) NSNumber* include_rts;
@property (assign) NSNumber* include_entities;

@end
