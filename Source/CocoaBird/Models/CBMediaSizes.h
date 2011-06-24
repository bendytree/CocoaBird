//
//  CBMediaSizes.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/5/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"
#import "CBMediaSize.h"

@interface CBMediaSizes : CBEntity {
    
}

@property (retain) CBMediaSize* large;
@property (retain) CBMediaSize* medium;
@property (retain) CBMediaSize* small;
@property (retain) CBMediaSize* thumb;

@end
