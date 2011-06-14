//
//  CBEntities.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// Documented at: http://dev.twitter.com/pages/tweet_entities

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBEntities : CBEntity {
    
}

@property (retain) NSArray* media;
@property (retain) NSArray* urls;
@property (retain) NSArray* hashtags;
@property (retain) NSArray* user_mentions;

@end
