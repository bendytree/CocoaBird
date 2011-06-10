//
//  CocoaBird+Statuses.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBirdBase.h"
#import "CBStatusesParams.h"
#import "CocoaBird+Core.h"

@interface CocoaBird (Statuses)

//Show Status
+ (NSArray*) getStatusNow:(unsigned long)id;
+ (NSArray*) getStatusNow:(unsigned long)id params:(CBShowStatusParams*)params;
+ (NSArray*) getStatusNow:(unsigned long)id params:(CBShowStatusParams*)params error:(NSError**)error;
+ (NSString*) getStatus:(unsigned long)id delegate:(id)delegate selector:(SEL)selector;           // - (void) statusLoaded:(CBStatus*)status error:(NSError*)error;
+ (NSString*) getStatus:(unsigned long)id delegate:(id)delegate selector:(SEL)selector params:(CBShowStatusParams*)params;

//Update Status
+ (NSArray*) updateStatusNow:(NSString*)status;
+ (NSArray*) updateStatusNow:(NSString*)status params:(CBUpdateStatusParams*)params;
+ (NSArray*) updateStatusNow:(NSString*)status params:(CBUpdateStatusParams*)params error:(NSError**)error;
+ (NSString*) updateStatus:(NSString*)status delegate:(id)delegate selector:(SEL)selector;         // - (void) statusLoaded:(CBStatus*)status error:(NSError*)error;
+ (NSString*) updateStatus:(NSString*)status delegate:(id)delegate selector:(SEL)selector params:(CBUpdateStatusParams*)params;

@end


