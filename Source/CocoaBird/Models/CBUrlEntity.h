//
//  CBUrlEntity.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBUrlEntity : CBEntity {
    
}

@property (retain) NSString* url;
@property (retain) NSString* display_url;
@property (retain) NSString* expanded_url;
@property (retain) NSArray* indices;

@end
