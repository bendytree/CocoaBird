//
//  CBUserCategory.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/17/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBUserCategory : CBEntity {
    
}

@property (retain) NSString* slug;
@property (retain) NSString* name;
@property (retain) NSNumber* size;

@end
