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

@class CBStatus;

@interface CocoaBird (Statuses)

//Show Status
+ (CBStatus*) getStatusNow:(unsigned long long)id;
+ (CBStatus*) getStatusNow:(unsigned long long)id params:(CBGetStatusParams*)params;
+ (CBStatus*) getStatusNow:(unsigned long long)id params:(CBGetStatusParams*)params error:(NSError**)error;
+ (NSString*) getStatus:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector;           // - (void) statusLoaded:(CBStatus*)status error:(NSError*)error;
+ (NSString*) getStatus:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector params:(CBGetStatusParams*)params;

//Update Status
+ (CBStatus*) updateStatusNow:(NSString*)status;
+ (CBStatus*) updateStatusNow:(NSString*)status params:(CBUpdateStatusParams*)params;
+ (CBStatus*) updateStatusNow:(NSString*)status params:(CBUpdateStatusParams*)params error:(NSError**)error;
+ (NSString*) updateStatus:(NSString*)status delegate:(id)delegate selector:(SEL)selector;         // - (void) statusLoaded:(CBStatus*)status error:(NSError*)error;
+ (NSString*) updateStatus:(NSString*)status delegate:(id)delegate selector:(SEL)selector params:(CBUpdateStatusParams*)params;

//Destroy Status
+ (void) destroyStatusNow:(unsigned long long)id;
+ (void) destroyStatusNow:(unsigned long long)id error:(NSError**)error;
+ (NSString*) destroyStatus:(unsigned long long)id delegate:(id)delegate selector:(SEL)selector;           // - (void) statusDestroyed:(NSError*)error;

@end


