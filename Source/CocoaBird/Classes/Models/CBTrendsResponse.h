//
//  CBTrendsResponse.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBTrendsResponse : CBEntity {
    
}

@property (retain) NSDictionary* trends;
@property (retain) NSNumber* as_of;

@end
