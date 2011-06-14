//
//  CBTrend.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBTrend : CBEntity {
    
}

@property (retain) NSString* name;
@property (retain) NSString* url;
@property (retain) NSArray* events;
@property (retain) NSArray* promoted_content;
@property (retain) NSString* query;

@end
