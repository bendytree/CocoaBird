//
//  CBAccountTotals.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/17/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBAccountTotals : CBEntity {
    
}

@property (retain) NSNumber* friends;
@property (retain) NSNumber* followers;
@property (retain) NSNumber* updates;
@property (retain) NSNumber* favorites;

@end
