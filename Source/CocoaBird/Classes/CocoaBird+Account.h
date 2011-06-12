//
//  CocoaBird+Account.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBirdBase.h"
#import "CocoaBird+Core.h"

#import "CBUser.h"
#import "CBRateLimitStatus.h"
#import "CBAccountSettings.h"

@interface CBVerifyCredentialsParams : CBQueryParams {}
@property (retain) NSNumber* skip_status;
@property (retain) NSNumber* include_entities;
@end

@interface CBAccountSettingsParams : CBQueryParams {}
@property (retain) NSNumber* trend_location_woeid;
@property (retain) NSNumber* sleep_time_enabled;
@property (retain) NSNumber* start_sleep_time;
@property (retain) NSNumber* end_sleep_time;
@property (retain) NSString* time_zone;
@property (retain) NSString* lang;
@end

@interface CBUpdateProfileParams : CBQueryParams {}
@property (retain) NSString* name;
@property (retain) NSString* url;
@property (retain) NSString* location;
@property (retain) NSString* description;
@property (retain) NSNumber* skip_status;
@property (retain) NSNumber* include_entities;
@end


@interface CocoaBird (Account)

//Verify Credentials
+ (CBUser*) verifyCredentialsNow;
+ (CBUser*) verifyCredentialsNow:(CBVerifyCredentialsParams*)params;
+ (CBUser*) verifyCredentialsNow:(CBVerifyCredentialsParams*)params error:(NSError**)error;
+ (NSString*) verifyCredentials:(id)delegate selector:(SEL)selector;           // - (void) credentialsVerified:(CBUser*)user error:(NSError*)error;
+ (NSString*) verifyCredentials:(id)delegate selector:(SEL)selector params:(CBVerifyCredentialsParams*)params;

//Rate Limit Status
+ (CBRateLimitStatus*) getRateLimitStatusNow;
+ (CBRateLimitStatus*) getRateLimitStatusNow:(NSError**)error;
+ (NSString*) getRateLimitStatus:(id)delegate selector:(SEL)selector;           // - (void) rateLimitStatus:(CBRateLimitStatus*)status error:(NSError*)error;

//Settings
+ (CBAccountSettings*) getAccountSettingsNow;
+ (CBAccountSettings*) getAccountSettingsNow:(CBAccountSettingsParams*)params;
+ (CBAccountSettings*) getAccountSettingsNow:(CBAccountSettingsParams*)params error:(NSError**)error;
+ (NSString*) getAccountSettings:(id)delegate selector:(SEL)selector;           // - (void) accountSettingsLoaded:(CBAccountSettings*)settings error:(NSError*)error;
+ (NSString*) getAccountSettings:(id)delegate selector:(SEL)selector params:(CBAccountSettingsParams*)params;

//Update Profile
+ (CBUser*) updateProfileNow;
+ (CBUser*) updateProfileNow:(CBUpdateProfileParams*)params;
+ (CBUser*) updateProfileNow:(CBUpdateProfileParams*)params error:(NSError**)error;
+ (NSString*) updateProfile:(id)delegate selector:(SEL)selector;           // - (void) profileUpdated:(CBUser*)user error:(NSError*)error;
+ (NSString*) updateProfile:(id)delegate selector:(SEL)selector params:(CBUpdateProfileParams*)params;

// TODO: totals, update profile image, color, background 

@end

