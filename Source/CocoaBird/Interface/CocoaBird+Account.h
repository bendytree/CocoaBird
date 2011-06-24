//
//  CocoaBird+Account.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/12/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBird.h"
#import "CocoaBird+Core.h"
#import "CBModels.h"


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

@interface CBUpdateProfileColorsParams : CBQueryParams {}
@property (retain) NSString* profile_background_color;
@property (retain) NSString* profile_text_color;
@property (retain) NSString* profile_link_color;
@property (retain) NSString* profile_sidebar_fill_color;
@property (retain) NSString* profile_sidebar_border_color;
@property (retain) NSNumber* skip_status;
@property (retain) NSNumber* include_entities;
@end


/** Extends CocoaBird by adding Account info
 
 Account info was added by this class. 
 */

@interface CocoaBird (Account)

/** Verify Credentials
 
 @return Returns the verified user. 
 */
+ (CBUser*) verifyCredentialsNow;


/** Verify Credentials
 
 @param params the parameters for verifying credentials
 @return Returns the verified user. 
 */
+ (CBUser*) verifyCredentialsNow:(CBVerifyCredentialsParams*)params;
+ (CBUser*) verifyCredentialsNow:(CBVerifyCredentialsParams*)params error:(NSError**)error;
+ (CBRequestId*) verifyCredentials:(id)delegate selector:(SEL)selector;           // - (void) credentialsVerified:(CBUser*)user error:(NSError*)error;
+ (CBRequestId*) verifyCredentials:(id)delegate selector:(SEL)selector params:(CBVerifyCredentialsParams*)params;

//Rate Limit Status
+ (CBRateLimitStatus*) getRateLimitStatusNow;
+ (CBRateLimitStatus*) getRateLimitStatusNow:(NSError**)error;
+ (CBRequestId*) getRateLimitStatus:(id)delegate selector:(SEL)selector;           // - (void) rateLimitStatus:(CBRateLimitStatus*)status error:(NSError*)error;

//Settings
+ (CBAccountSettings*) getAccountSettingsNow;
+ (CBAccountSettings*) getAccountSettingsNow:(CBAccountSettingsParams*)params;
+ (CBAccountSettings*) getAccountSettingsNow:(CBAccountSettingsParams*)params error:(NSError**)error;
+ (CBRequestId*) getAccountSettings:(id)delegate selector:(SEL)selector;           // - (void) accountSettingsLoaded:(CBAccountSettings*)settings error:(NSError*)error;
+ (CBRequestId*) getAccountSettings:(id)delegate selector:(SEL)selector params:(CBAccountSettingsParams*)params;

//Update Profile
+ (CBUser*) updateProfileNow;
+ (CBUser*) updateProfileNow:(CBUpdateProfileParams*)params;
+ (CBUser*) updateProfileNow:(CBUpdateProfileParams*)params error:(NSError**)error;
+ (CBRequestId*) updateProfile:(id)delegate selector:(SEL)selector;           // - (void) profileUpdated:(CBUser*)user error:(NSError*)error;
+ (CBRequestId*) updateProfile:(id)delegate selector:(SEL)selector params:(CBUpdateProfileParams*)params;

//Get Totals
+ (CBAccountTotals*) getAccountTotalsNow:(NSError**)error;
+ (CBRequestId*) getAccountTotals:(id)delegate selector:(SEL)selector;           // - (void) totalsLoaded:(CBAccountTotals*)totals error:(NSError*)error;

//Update Profile Colors
+ (CBUser*) updateProfileColorsNow:(CBUpdateProfileColorsParams*)params error:(NSError**)error;
+ (CBRequestId*) updateProfileColors:(CBUpdateProfileColorsParams*)params delegate:(id)delegate selector:(SEL)selector;           // - (void) updateProfileColors:(CBUser*)user error:(NSError*)error;

// TODO: update profile image, background 

@end

