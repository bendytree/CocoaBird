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


@interface CBGetListsParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSString* cursor;
@end


@interface CocoaBird (Lists)

//Lists by User Id
+ (NSArray*) getListsByUserIdNow:(int)user_id;
+ (NSArray*) getListsByUserIdNow:(int)user_id params:(CBGetListsParams*)params;
+ (NSArray*) getListsByUserIdNow:(int)user_id params:(CBGetListsParams*)params error:(NSError**)error;
+ (NSString*) getListsByUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector;           // - (void) listsLoaded:(NSArray*)lists error:(NSError*)error;
+ (NSString*) getListsByUserId:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetListsParams*)params;

//Lists by Screen Name
+ (NSArray*) getListsNow;
+ (NSArray*) getListsByScreenNameNow:(NSString*)screen_name;
+ (NSArray*) getListsByScreenNameNow:(NSString*)screen_name params:(CBGetListsParams*)params;
+ (NSArray*) getListsByScreenNameNow:(NSString*)screen_name params:(CBGetListsParams*)params error:(NSError**)error;
+ (NSString*) getLists:(id)delegate selector:(SEL)selector;           // - (void) listsLoaded:(NSArray*)lists error:(NSError*)error;
+ (NSString*) getListsByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;
+ (NSString*) getListsByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetListsParams*)params;

@end
