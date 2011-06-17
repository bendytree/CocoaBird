//
//  CocoaBird+Tweets.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBird+Security.h"
#import "CocoaBirdSettings.h"



@implementation CocoaBird (Security)

+ (void) setUseSSL:(BOOL)useSSL
{
    [CocoaBirdSettings setUseSSL:useSSL];
}

@end
