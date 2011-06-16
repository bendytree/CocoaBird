//
//  CocoaBird+Tweets.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBird.h"
#import "CocoaBird+Core.h"
#import "CBModels.h"


@interface CBReportSpamParams : CBQueryParams {}
@property (retain) NSNumber* user_id;
@property (retain) NSString* screen_name;
@property (retain) NSNumber* include_entities;
@property (retain) NSNumber* skip_status;
@end


@interface CocoaBird (ReportSpam)

//Report Spam
+ (CBUser*) reportSpamNow:(CBReportSpamParams*)params error:(NSError**)error;
+ (NSString*) reportSpam:(CBReportSpamParams*)params delegate:(id)delegate selector:(SEL)selector;    // - (void) spamReported:(CBUser*)user error:(NSError*)error;

@end


