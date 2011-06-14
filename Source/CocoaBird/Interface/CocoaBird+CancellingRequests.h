//
//  CocoaBird+CancellingRequests.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBirdBase.h"

@interface CocoaBird (CancellingRequests)

+ (void) cancelRequest:(NSString*)requestId;
+ (void) cancelAllRequests;

@end
