//
//  CBListSubscribers.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/14/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBListSubscribers : CBEntity {
    
}

@property (retain) NSArray* users;
@property (retain) NSNumber* next_cursor;
@property (retain) NSNumber* previous_cursor;
@property (retain) NSString* next_cursor_str;
@property (retain) NSString* previous_cursor_str;

@end
