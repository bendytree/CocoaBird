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

+ (CBStatus*) getStatusNow:(unsigned long long)id
{
    return [self getStatusNow:id params:nil];
}

+ (CBStatus*) getStatusNow:(unsigned long long)id params:(CBGetStatusParams*)params
{
    return [self getStatusNow:id params:params error:nil];
}

+ (CBStatus*) getStatusNow:(unsigned long long)id params:(CBGetStatusParams*)params error:(NSError**)error
{
    NSString* url = [NSString stringWithFormat:@"http://api.twitter.com/1/statuses/show/%qu.json", id];
    return [self processRequestSynchronous:url params:params type:CBTwitterResponseTypeStatus error:error];
}

+ (NSString*) getStatus:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector
{
    return [self getStatus:id delegate:delegate selector:selector params:nil];
}

+ (NSString*) getStatus:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector params:(CBGetStatusParams*)params
{
    NSString* url = [NSString stringWithFormat:@"http://api.twitter.com/1/statuses/show/%qu.json", id];
    return [self processRequestAsynchronous:url params:params type:CBTwitterResponseTypeStatus delegate:delegate selector:selector];    
}



#pragma Update Status

+ (CBStatus*) updateStatusNow:(NSString*)status
{
    return [self updateStatusNow:status params:nil];
}

+ (CBStatus*) updateStatusNow:(NSString*)status params:(CBUpdateStatusParams*)params
{
    return [self updateStatusNow:status params:params error:nil];
}

+ (CBStatus*) updateStatusNow:(NSString*)status params:(CBUpdateStatusParams*)params error:(NSError**)error
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



#pragma Destroy Status

+ (void) destroyStatusNow:(unsigned long long)id
{    
    [self destroyStatusNow:id error:nil];
}

+ (void) destroyStatusNow:(unsigned long long)id error:(NSError**)error
{
    NSString* url = [NSString stringWithFormat:@"http://api.twitter.com/1/statuses/destroy/%qu.json", id];
    [self processRequestSynchronous:url params:nil type:CBTwitterResponseTypeNone error:error];
}

+ (NSString*) destroyStatus:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector
{
    return [self getStatus:id delegate:delegate selector:selector params:nil];
}

+ (NSString*) destroyStatus:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector params:(CBGetStatusParams*)params
{
    NSString* url = [NSString stringWithFormat:@"http://api.twitter.com/1/statuses/destroy/%qu.json", id];
    return [self processRequestAsynchronous:url params:params type:CBTwitterResponseTypeStatus delegate:delegate selector:selector];    
}

@end
