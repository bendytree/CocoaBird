//
//  CBPublicTimelineParameters.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBQueryParams.h"

@interface CBPublicTimelineParams : CBQueryParams {
    
}

@property (retain) NSNumber* trim_user;
@property (retain) NSNumber* include_entities;

@end
