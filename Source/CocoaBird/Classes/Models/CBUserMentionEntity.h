//
//  CBUserMentionEntity.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBUserMentionEntity : CBEntity {
    
}

@property (retain) NSNumber* id;
@property (retain) NSString* id_str;
@property (retain) NSString* screen_name;
@property (retain) NSString* name;
@property (retain) NSArray* indices;

@end
