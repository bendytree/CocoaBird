//
//  CBPublicTimelineParameters.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CBPublicTimelineParams.h"


@implementation CBPublicTimelineParams

@synthesize trim_user, include_entities;

- (id)init {
    self = [super init];
    if (self) {
        
        self.include_entities = [NSNumber numberWithBool:YES];
        
    }
    return self;
}

@end
