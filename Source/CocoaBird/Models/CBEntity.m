//
//  CBEntity.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CBEntity.h"
#import "CocoaBirdReflection.h"


@implementation CBEntity

@synthesize orig;

- (NSDictionary*) arrayPropertyClasses
{
    return [NSDictionary dictionary];
}



#pragma Cleanup

- (void) dealloc {
    
    [CocoaBirdReflection setAllPropertiesToNil:self];
    
    [super dealloc];
}

@end
