//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Legal.h"
#import "CocoaBirdSettings.h"

@implementation CBGetPrivacyParams
@synthesize lang;
@end

@implementation CocoaBird (Legal)

#pragma Get Terms of Service

+ (CBTermsOfService*) getTermsOfServiceNow:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/legal/tos.json" method:@"GET" params:nil type:CBTwitterResponseTypeObject class:[CBTermsOfService class] error:error];
}

+ (NSString*) getTermsOfService:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/legal/tos.json" method:@"GET" params:nil type:CBTwitterResponseTypeObject class:[CBTermsOfService class] delegate:delegate selector:selector];    
}


#pragma Get Privacy

+ (CBPrivacy*) getPrivacyNow:(CBGetPrivacyParams*)params error:(NSError**)error
{
    return [self processRequestSynchronous:@"http://api.twitter.com/1/legal/privacy.json" method:@"GET" params:nil type:CBTwitterResponseTypeObject class:[CBPrivacy class] error:error];
}

+ (NSString*) getPrivacy:(CBGetPrivacyParams*)params delegate:(id)delegate selector:(SEL)selector
{
    return [self processRequestAsynchronous:@"http://api.twitter.com/1/legal/privacy.json" method:@"GET" params:nil type:CBTwitterResponseTypeObject class:[CBPrivacy class] delegate:delegate selector:selector];    
}


@end
