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



@interface CocoaBird (Help)

//Test
+ (NSString*) testNow:(NSError**)error;
+ (CBRequestId*) test:(id)delegate selector:(SEL)selector;    // - (void) testLoaded:(NSString*)result error:(NSError*)error;

//Get Help Configuration
+ (CBHelpConfiguration*) getHelpConfigurationNow:(NSError**)error;
+ (CBRequestId*) getHelpConfiguration:(id)delegate selector:(SEL)selector;    // - (void) configurationLoaded:(CBHelpConfiguration*)configuration error:(NSError*)error;

//Get Languages
+ (NSArray*) getLanguagesNow:(NSError**)error;
+ (CBRequestId*) getLanguages:(id)delegate selector:(SEL)selector;    // - (void) languagesLoaded:(NSArray*)languages error:(NSError*)error;

@end


