//
//  CBFriendship.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/14/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CBFriendship.h"



@implementation CBRelationship
@synthesize target, source;
@end

@implementation CBRelationshipTarget
@synthesize following, screen_name, id, followed_by, id_str;
@end

@implementation CBRelationshipSource
@synthesize following, screen_name, id, followed_by, id_str, notifications_enabled,
            can_dm, want_retweets, all_replies, marked_spam, blocking;
@end

@implementation CBFriendship
@synthesize relationship;
@end

@implementation CBFriendIds
@synthesize ids, previous_cursor, previous_cursor_str, next_cursor, next_cursor_str;
@end

@implementation CBFollowerIds
@synthesize ids, previous_cursor, previous_cursor_str, next_cursor, next_cursor_str;
@end

