//
//  CBSuggestedUsers.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"
#import "CBUser.h"

@interface CBSuggestedUsers : CBEntity {
    
}

@property (retain) NSString* slug;
@property (retain) NSString* name;
@property (retain) NSNumber* size;
@property (retain) NSArray* users;

@end
