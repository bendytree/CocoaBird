//
//  CBLists.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/12/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CBLists.h"
#import "CBList.h"

@implementation CBLists

@synthesize lists, next_cursor, previous_cursor, next_cursor_str, previous_cursor_str;

- (NSDictionary*) arrayPropertyClasses
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
            [CBList class], @"lists", 
            nil];
}

@end
