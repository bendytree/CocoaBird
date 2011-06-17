//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+SavedSearches.h"
#import "CocoaBirdSettings.h"


@implementation CBGetSavedSearchesParams
@synthesize user_id, screen_name, include_entities, skip_status;
@end

@implementation CBCreateSavedSearchParams
@synthesize query;
@end



@implementation CocoaBird (SavedSearches)

#pragma Get Saved Searches

+ (NSArray*) getSavedSearchesNow:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/saved_searches.json" method:@"GET" params:nil type:CBTwitterResponseTypeArray class:[CBSavedSearch class] error:error];
}

+ (CBRequestId*) getSavedSearches:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/saved_searches.json" method:@"GET" params:nil type:CBTwitterResponseTypeArray class:[CBSavedSearch class] delegate:delegate selector:selector];    
}


#pragma Get Saved Search

+ (CBSavedSearch*) getSavedSearchNow:(int)search_id error:(NSError**)error
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/saved_searches/show/%i.json", search_id];
    return [self processRequestSynchronous:url method:@"GET" params:nil type:CBTwitterResponseTypeObject class:[CBSavedSearch class] error:error];
}

+ (CBRequestId*) getSavedSearch:(int)search_id delegate:(id)delegate selector:(SEL)selector
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/saved_searches/show/%i.json", search_id];
    return [self processRequestAsynchronous:url method:@"GET" params:nil type:CBTwitterResponseTypeObject class:[CBSavedSearch class] delegate:delegate selector:selector];    
}


#pragma Create Saved Search

+ (CBSavedSearch*) createSavedSearchNow:(NSString*)query error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/saved_searches/create.json" method:@"POST" params:nil type:CBTwitterResponseTypeObject class:[CBSavedSearch class] error:error];
}

+ (CBRequestId*) createSavedSearch:(NSString*)query delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/saved_searches/create.json" method:@"POST" params:nil type:CBTwitterResponseTypeObject class:[CBSavedSearch class] delegate:delegate selector:selector];    
}


#pragma Delete Saved Search

+ (CBSavedSearch*) deleteSavedSearchNow:(id)search_id error:(NSError**)error
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/saved_searches/destroy/%i.json", search_id];
    return [self processRequestSynchronous:url method:@"POST" params:nil type:CBTwitterResponseTypeObject class:[CBSavedSearch class] error:error];
}

+ (CBRequestId*) deleteSavedSearch:(id)search_id delegate:(id)delegate selector:(SEL)selector
{
    NSString* url = [NSString stringWithFormat:@"api.twitter.com/1/saved_searches/destroy/%i.json", search_id];
    return [self processRequestAsynchronous:url method:@"POST" params:nil type:CBTwitterResponseTypeObject class:[CBSavedSearch class] delegate:delegate selector:selector];    
}


@end
