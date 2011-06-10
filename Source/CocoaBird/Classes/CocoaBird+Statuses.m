//
//  CocoaBird+Statuses.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Statuses.h"

@implementation CocoaBird (Statuses)


#pragma Show Status

+ (NSArray*) getStatusNow:(unsigned long)id
{
    return [self getStatusNow:id params:nil];
}

+ (NSArray*) getStatusNow:(unsigned long)id params:(CBShowStatusParams*)params
{
    params = params ? params : [CBShowStatusParams params];
    params.id = [NSNumber numberWithUnsignedLong:id];
    return [self getStatusNow:id params:params error:nil];
}

+ (NSArray*) getStatusNow:(unsigned long)id params:(CBShowStatusParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/show.json" params:params type:CBTwitterResponseTypeStatus error:error];
}

+ (NSString*) getStatus:(unsigned long)id delegate:(id)delegate selector:(SEL)selector
{
    return [self getStatus:id delegate:delegate selector:selector params:nil];
}

+ (NSString*) getStatus:(unsigned long)id delegate:(id)delegate selector:(SEL)selector params:(CBShowStatusParams*)params
{
    params = params ? params : [CBShowStatusParams params];
    params.id = [NSNumber numberWithUnsignedLong:id];
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/show.json" params:params type:CBTwitterResponseTypeStatus delegate:delegate selector:selector];    
}



#pragma Update Status

+ (NSArray*) updateStatusNow:(NSString*)status
{
    return [self updateStatusNow:status params:nil];
}

+ (NSArray*) updateStatusNow:(NSString*)status params:(CBUpdateStatusParams*)params
{
    return [self updateStatusNow:status params:params error:nil];
}

+ (NSArray*) updateStatusNow:(NSString*)status params:(CBUpdateStatusParams*)params error:(NSError**)error
{
    params = params ? params : [CBUpdateStatusParams params];
    params.status = status;
    return [self processRequestSynchronous:@"http://api.twitter.com/1/statuses/update.json" params:params type:CBTwitterResponseTypeStatus error:error];
}

+ (NSString*) updateStatus:(NSString*)status delegate:(id)delegate selector:(SEL)selector
{
    return [self updateStatus:status delegate:delegate selector:selector params:nil];
}

+ (NSString*) updateStatus:(NSString*)status delegate:(id)delegate selector:(SEL)selector params:(CBUpdateStatusParams*)params
{
    params = params ? params : [CBUpdateStatusParams params];
    params.status = status;
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/statuses/update.json" params:params type:CBTwitterResponseTypeStatus delegate:delegate selector:selector];
}

@end
