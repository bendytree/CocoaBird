//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CocoaBird+ReportSpam.h"
#import "CocoaBirdSettings.h"


@implementation CBReportSpamParams
@synthesize user_id, screen_name, include_entities, skip_status;
@end



@implementation CocoaBird (ReportSpam)

#pragma Report Spam

+ (CBUser*) reportSpamNow:(CBReportSpamParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"api.twitter.com/1/report_spam.json" method:@"POST" params:params type:CBTwitterResponseTypeCustom class:[CBUser class] error:error];
}

+ (CBRequestId*) reportSpam:(CBReportSpamParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"api.twitter.com/1/report_spam.json" method:@"POST" params:params type:CBTwitterResponseTypeCustom class:[CBUser class] delegate:delegate selector:selector];    
}

@end
