//
//  CBDirectMessage.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"
#import "CBUser.h"

@interface CBDirectMessage : CBEntity {
    
}

@property (retain) NSDate* created_at;
@property (retain) NSString* sender_screen_name;
@property (retain) CBUser* sender;
@property (retain) NSNumber* sender_id;
@property (retain) NSString* text;
@property (retain) NSNumber* id;
@property (retain) NSString* recipient_screen_name;
@property (retain) CBUser* recipient;
@property (retain) NSNumber* recipient_id;

@end
