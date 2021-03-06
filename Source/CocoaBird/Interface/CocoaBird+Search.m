//
//  CocoaBird+Statuses.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CocoaBird+Search.h"
#import "CBModels.h"


@implementation CBSearchStatusesParams
@synthesize q, lang, locale, rpp, page, since_id, until, geocode, show_user, result_type;
@end



@implementation CocoaBird (Search)

#pragma Search Statuses 

+ (CBSearchResults*) searchStatusesNow:(CBSearchStatusesParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"search.twitter.com/search.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBSearchResults class] error:error];
}

+ (CBRequestId*) searchStatuses:(CBSearchStatusesParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"search.twitter.com/search.json" method:@"GET" params:params type:CBTwitterResponseTypeCustom class:[CBSearchResults class] delegate:delegate selector:selector];    
}

@end
