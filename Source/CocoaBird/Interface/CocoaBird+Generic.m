//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CocoaBird+Generic.h"



@implementation CocoaBird (Generic)

#pragma Test

+ (id) performGenericRequestNow:(NSString*)url method:(NSString*)method params:(NSDictionary*)params error:(NSError**)error
{
    return [self processRequestSynchronous:url method:method dicParams:params type:CBTwitterResponseTypeNatural class:nil error:error];
}

+ (CBRequestId*) performGenericRequest:(NSString*)url method:(NSString*)method params:(NSDictionary*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:url method:method dicParams:params type:CBTwitterResponseTypeNatural class:nil delegate:delegate selector:selector];    
}

@end
