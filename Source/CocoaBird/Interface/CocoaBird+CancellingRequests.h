//
//  CocoaBird+CancellingRequests.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBirdBase.h"

@class CBRequestId;

@interface CocoaBird (CancellingRequests)

+ (void) cancelRequest:(CBRequestId*)requestId;
+ (void) cancelAllRequests;
+ (void) cancelAllRequestsForDelegate:(id)delegate;

@end
