//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
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
    return [self processRequestSynchronous:@"http://api.twitter.com/1/report_spam.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBUser class] error:error];
}

+ (NSString*) reportSpam:(CBReportSpamParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/report_spam.json" method:@"POST" params:params type:CBTwitterResponseTypeObject class:[CBUser class] delegate:delegate selector:selector];    
}

@end
