//
//  CBEntities.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CBEntities.h"
#import "CBMediaEntity.h"
#import "CBUrlEntity.h"
#import "CBUserMentionEntity.h"
#import "CBHashTagEntity.h"

@implementation CBEntities

@synthesize media, urls, hashtags, user_mentions;



- (NSDictionary*) arrayPropertyClasses
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
            [CBMediaEntity class], @"media", 
            [CBUrlEntity class], @"urls",
            [CBUserMentionEntity class], @"user_mentions",
            [CBHashTagEntity class], @"hashtags",
            nil];
}

@end
