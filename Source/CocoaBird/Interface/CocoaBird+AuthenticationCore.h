//
//  CocoaBird+AuthenticationCore.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBirdBase.h"
#import "CocoaBird+Authentication.h"
#import "CBLoginWebController.h"

@interface CocoaBird (AuthenticationCore)

+ (void) sendClosedNotification:(CBLoginResult)result error:(NSError*)error;
+ (NSMutableDictionary*) loginDelegates;

@end
