//
//  CBTimeZone.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/12/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBTimeZone : CBEntity {
    
}

@property (retain) NSString* name;
@property (retain) NSString* tzinfo_name;
@property (retain) NSNumber* utc_offset;

@end
