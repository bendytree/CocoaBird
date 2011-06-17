//
//  CBRequest.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CBRequestId.h"
#import "CocoaBird+CancellingRequests.h"

@implementation CBRequestId

- (void) cancel
{
    return [CocoaBird cancelRequest:self];
}

@end
