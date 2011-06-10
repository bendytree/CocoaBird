//
//  CocoaBird+AuthenticationCore.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBirdBase.h"

@interface CocoaBird (AuthenticationCore)

+ (void) sendClosedNotification;
+ (NSMutableDictionary*) loginDelegates;

@end
