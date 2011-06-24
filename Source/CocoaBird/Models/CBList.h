//
//  CBList.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/12/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"
#import "CBUser.h"

@interface CBList : CBEntity {
    
}

@property (retain) CBUser* user;
@property (retain) NSString* name;
@property (retain) NSNumber* subscriber_count;
@property (retain) NSNumber* following;
@property (retain) NSString* mode;
@property (retain) NSString* description;
@property (retain) NSString* uri;
@property (retain) NSNumber* id;
@property (retain) NSString* id_str;
@property (retain) NSString* slug;
@property (retain) NSString* full_name;
@property (retain) NSNumber* member_count;

@end
