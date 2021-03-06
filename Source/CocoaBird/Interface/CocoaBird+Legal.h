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


@interface CBGetPrivacyParams : CBQueryParams {}
@property (retain) NSNumber* lang;
@end

@interface CocoaBird (Legal)

//Get Terms of Service
+ (CBTermsOfService*) getTermsOfServiceNow:(NSError**)error;
+ (CBRequestId*) getTermsOfService:(id)delegate selector:(SEL)selector;    // - (void) termsLoaded:(CBTermsOfService*)tos error:(NSError*)error;

//Get Privacy
+ (CBPrivacy*) getPrivacyNow:(CBGetPrivacyParams*)params error:(NSError**)error;
+ (CBRequestId*) getPrivacy:(CBGetPrivacyParams*)params delegate:(id)delegate selector:(SEL)selector;    // - (void) privacyLoaded:(CBPrivacy*)privacy error:(NSError*)error;

@end


