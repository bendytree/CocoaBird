//
//  CBLists.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBLists : CBEntity {
    
}

@property (retain) NSArray* lists;
@property (retain) NSNumber* next_cursor;
@property (retain) NSNumber* previous_cursor;
@property (retain) NSString* next_cursor_str;
@property (retain) NSString* previous_cursor_str;

@end
