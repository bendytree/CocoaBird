//
//  CocoaBird+CancellingRequests.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CocoaBird+CancellingRequests.h"
#import "CBRequestData.h"
#import "CocoaBird+Core.h"

@implementation CocoaBird (CancellingRequests)


+ (void) cancelRequest:(CBRequestId*)requestId
{
    CBRequestData* data = [self getRequestDataAndRemoveById:requestId];
    [data.request clearDelegatesAndCancel];
}

+ (void) cancelAllRequests
{
    while([[self currentRequests] count] > 0)
    {
        CBRequestData* data = [[self currentRequests] objectAtIndex:0];
        [self cancelRequest:data.id];
    }
}

+ (void) cancelAllRequestsForDelegate:(id)delegate
{
    while([[self currentRequests] count] > 0)
    {
        CBRequestData* data = [[self currentRequests] objectAtIndex:0];
        if(data.delegate == delegate)
        {
            [self cancelRequest:data.id];
        }
    }
}


@end




