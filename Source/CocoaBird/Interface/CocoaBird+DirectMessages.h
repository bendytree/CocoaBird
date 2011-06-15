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

@interface CBGetSentDirectMessagesParams : CBQueryParams {}
@property (assign) NSNumber* since_id;
@property (assign) NSNumber* max_id;
@property (assign) NSNumber* count;
@property (assign) NSNumber* page;
@property (assign) NSNumber* skip_status;
@property (assign) NSNumber* include_entities;
@end

@interface CBSendDirectMessageParams : CBQueryParams {}
@property (assign) NSString* screen_name;
@property (assign) NSNumber* user_id;
@property (assign) NSString* text;
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

//Sent Direct Messages
+ (NSArray*) getSentDirectMessagesNow;
+ (NSArray*) getSentDirectMessagesNow:(CBGetSentDirectMessagesParams*)params;
+ (NSArray*) getSentDirectMessagesNow:(CBGetSentDirectMessagesParams*)params error:(NSError**)error;
+ (NSString*) getSentDirectMessages:(id)delegate selector:(SEL)selector;           // - (void) sentDirectMessagesLoaded:(NSArray*)directMessages error:(NSError*)error;
+ (NSString*) getSentDirectMessages:(id)delegate selector:(SEL)selector params:(CBGetSentDirectMessagesParams*)params;

//Send Direct Message
+ (CBDirectMessage*) sendDirectMessageNow:(NSString*)text toUserId:(int)user_id;
+ (CBDirectMessage*) sendDirectMessageNow:(NSString*)text toUserId:(int)user_id error:(NSError**)error;
+ (CBDirectMessage*) sendDirectMessageNow:(NSString*)text toScreenName:(NSString*)screen_name;
+ (CBDirectMessage*) sendDirectMessageNow:(NSString*)text toScreenName:(NSString*)screen_name error:(NSError**)error;
+ (CBDirectMessage*) sendDirectMessageNow:(CBSendDirectMessageParams*)params;
+ (CBDirectMessage*) sendDirectMessageNow:(CBSendDirectMessageParams*)params error:(NSError**)error;
+ (NSString*) sendDirectMessage:(NSString*)text toUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector;
+ (NSString*) sendDirectMessage:(NSString*)text toScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;
+ (NSString*) sendDirectMessage:(id)delegate selector:(SEL)selector params:(CBSendDirectMessageParams*)params;           // - (void) directMessageSent:(CBDirectMessage*)directMessage error:(NSError*)error;

//Delete Direct Message
+ (CBDirectMessage*) deleteDirectMessageNow:(unsigned long long)id;
+ (CBDirectMessage*) deleteDirectMessageNow:(unsigned long long)id error:(NSError**)error;
+ (NSString*) deleteDirectMessage:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector;           // - (void) directMessageDeleted:(CBDirectMessage*)directMessage error:(NSError*)error;

@end
