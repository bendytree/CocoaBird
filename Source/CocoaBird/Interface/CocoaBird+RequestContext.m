//
//  CocoaBird+CancellingRequests.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+CancellingRequests.h"
#import "CBRequestData.h"
#import "CocoaBird+Core.h"

@implementation CocoaBird (RequestContext)

+ (void) setRequestContext:(id)context
{
    [CocoaBird pushRequestContext:context];
}


@end




