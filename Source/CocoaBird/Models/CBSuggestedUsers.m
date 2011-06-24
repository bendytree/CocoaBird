//
//  CBSuggestedUsers.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/17/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CBSuggestedUsers.h"


@implementation CBSuggestedUsers

@synthesize slug, name, size, users;



- (NSDictionary*) arrayPropertyClasses
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
            [CBUser class], @"users", 
            nil];
}

@end
