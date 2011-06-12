//
//  CocoaBirdBase.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBQueryParams.h"
#import "CocoaBirdBase.h"

@class CBRequestData;

typedef enum {
    CBTwitterResponseTypeNatural,  // such as array of strings or numbers
    CBTwitterResponseTypeUsers,
    CBTwitterResponseTypeUser,
    CBTwitterResponseTypeStatuses,
    CBTwitterResponseTypeStatus,
    CBTwitterResponseTypeRateLimitStatus,
    CBTwitterResponseTypeAccountSettings,
    CBTwitterResponseTypeTrends,
    CBTwitterResponseTypeTrendLocations,
    CBTwitterResponseTypeTrendsForLocation,
    CBTwitterResponseTypeNone
} CBTwitterResponseType;


@interface CocoaBird (Core)

//Processing Requests
+ (id) processRequestSynchronous:(NSString*)url params:(CBQueryParams*)params type:(CBTwitterResponseType)type error:(NSError**)error;
+ (NSString*) processRequestAsynchronous:(NSString*)url params:(CBQueryParams*)params type:(CBTwitterResponseType)type delegate:(id)delegate selector:(SEL)selector;
+ (CBRequestData*) getRequestDataAndRemoveById:(NSString*)requestId;
+ (NSMutableArray*) currentRequests;

@end

