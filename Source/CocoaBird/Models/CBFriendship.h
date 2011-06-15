//
//  CBFriendship.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBRelationshipTarget : CBEntity {}
@property (retain) NSNumber* following;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* id;
@property (retain) NSNumber* followed_by;
@property (retain) NSString* id_str;
@end

@interface CBRelationshipSource : CBEntity {}
@property (retain) NSNumber* following;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* id;
@property (retain) NSNumber* followed_by;
@property (retain) NSString* id_str;
@property (retain) NSNumber* notifications_enabled;
@property (retain) NSNumber* can_dm;
@property (retain) NSNumber* want_retweets;
@property (retain) NSNumber* all_replies;
@property (retain) NSNumber* marked_spam;
@property (retain) NSNumber* blocking;
@end

@interface CBRelationship : CBEntity {}
@property (retain) CBRelationshipTarget* target;
@property (retain) CBRelationshipSource* source; 
@end

@interface CBFriendship : CBEntity {}
@property (retain) CBRelationship* relationship;
@end

@interface CBFriendIds : CBEntity {}
@property (retain) NSArray* ids;
@property (retain) NSNumber* previous_cursor;
@property (retain) NSString* previous_cursor_str;
@property (retain) NSNumber* next_cursor;
@property (retain) NSString* next_cursor_str;
@end

@interface CBFollowerIds : CBEntity {}
@property (retain) NSArray* ids;
@property (retain) NSNumber* previous_cursor;
@property (retain) NSString* previous_cursor_str;
@property (retain) NSNumber* next_cursor;
@property (retain) NSString* next_cursor_str;
@end




