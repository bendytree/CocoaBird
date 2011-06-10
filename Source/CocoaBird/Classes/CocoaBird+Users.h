//
//  CocoaBird+Users.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBird.h"
#import "CocoaBird+Core.h"

@interface CocoaBird (Users)

//Get User By Id
+ (CBUser*) getUserByIdNow:(int)user_id;
+ (CBUser*) getUserByIdNow:(int)user_id params:(CBGetUserParams*)params;
+ (CBUser*) getUserByIdNow:(int)user_id params:(CBGetUserParams*)params error:(NSError**)error;
+ (NSString*) getUserById:(int)user_id delegate:(id)delegate selector:(SEL)selector;           // - (void) userLoaded:(CBUser*)status error:(NSError*)error;
+ (NSString*) getUserById:(int)user_id delegate:(id)delegate selector:(SEL)selector params:(CBGetUserParams*)params;

//Get User By Screen Name
+ (CBUser*) getUserByScreenNameNow:(NSString*)screen_name;
+ (CBUser*) getUserByScreenNameNow:(NSString*)screen_name params:(CBGetUserParams*)params;
+ (CBUser*) getUserByScreenNameNow:(NSString*)screen_name params:(CBGetUserParams*)params error:(NSError**)error;
+ (NSString*) getUserByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector;           // - (void) userLoaded:(CBUser*)status error:(NSError*)error;
+ (NSString*) getUserByScreenName:(NSString*)screen_name delegate:(id)delegate selector:(SEL)selector params:(CBGetUserParams*)params;

@end
