//
//  CBSavedSearch.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/15/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBSavedSearch : CBEntity {
    
}

@property (retain) NSString* position;
@property (retain) NSString* name;
@property (retain) NSDate* created_at;
@property (retain) NSString* id_str;
@property (retain) NSNumber* id;
@property (retain) NSString* query;

@end
