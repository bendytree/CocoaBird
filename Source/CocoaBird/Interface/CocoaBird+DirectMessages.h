//
//  CocoaBird+Tweets.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBird.h"
#import "CocoaBird+Core.h"



@interface CBGetDirectMessagesParams : CBQueryParams {}
@property (assign) NSNumber* since_id;
@property (assign) NSNumber* max_id;
@property (assign) NSNumber* count;
@property (assign) NSNumber* page;
@property (assign) NSNumber* skip_status;
@property (assign) NSNumber* include_entities;
@end


@interface CocoaBird (DirectMessages)

//Direct Messages
+ (NSArray*) getDirectMessagesNow;
+ (NSArray*) getDirectMessagesNow:(CBGetDirectMessagesParams*)params;
+ (NSArray*) getDirectMessagesNow:(CBGetDirectMessagesParams*)params error:(NSError**)error;
+ (NSString*) getDirectMessages:(id)delegate selector:(SEL)selector;           // - (void) directMessagesLoaded:(NSArray*)directMessages error:(NSError*)error;
+ (NSString*) getDirectMessages:(id)delegate selector:(SEL)selector params:(CBGetDirectMessagesParams*)params;

@end
