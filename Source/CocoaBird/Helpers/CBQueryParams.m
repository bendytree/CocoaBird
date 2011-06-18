//
//  CBQueryParameters.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CBQueryParams.h"
#import "CocoaBirdReflection.h"

@implementation CBQueryParams


+ (id) params
{
    return [[[self alloc] init] autorelease];
}


#pragma Cleanup

- (void) dealloc {
    
    [CocoaBirdReflection setAllPropertiesToNil:self];
    
    [super dealloc];
}

@end
