//
//  CocoaBird+Tweets.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBird.h"
#import "CocoaBird+Core.h"
#import "CBModels.h"



@interface CocoaBird (Generic)

// Generic Requests
+ (id) performGenericRequestNow:(NSString*)url method:(NSString*)method params:(NSDictionary*)params error:(NSError**)error;
+ (CBRequestId*) performGenericRequest:(NSString*)url method:(NSString*)method params:(NSDictionary*)params delegate:(id)delegate selector:(SEL)selector;

@end


