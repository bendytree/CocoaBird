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
#import "CBRequestId.h"

@class CBRequestData;

typedef enum {
    CBTwitterResponseTypeNatural,  // such as array of strings or numbers
    CBTwitterResponseTypeVoid,
    CBTwitterResponseTypeCustom
} CBTwitterResponseType;


@interface CocoaBird (Core)

//Processing Requests
+ (id) processRequestSynchronous:(NSString*)url method:(NSString*)method dicParams:(NSDictionary*)params type:(CBTwitterResponseType)type class:(Class)cls error:(NSError**)error;
+ (id) processRequestSynchronous:(NSString*)url method:(NSString*)method params:(CBQueryParams*)params type:(CBTwitterResponseType)type class:(Class)cls error:(NSError**)error;
+ (CBRequestId*) processRequestAsynchronous:(NSString*)url method:(NSString*)method dicParams:(NSDictionary*)params type:(CBTwitterResponseType)type class:(Class)cls delegate:(id)delegate selector:(SEL)selector;
+ (CBRequestId*) processRequestAsynchronous:(NSString*)url method:(NSString*)method params:(CBQueryParams*)params type:(CBTwitterResponseType)type class:(Class)cls delegate:(id)delegate selector:(SEL)selector;
+ (CBRequestData*) getRequestDataAndRemoveById:(NSString*)requestId;
+ (NSMutableArray*) currentRequests;

//Context
+ (void) pushRequestContext:(id)context;

@end

