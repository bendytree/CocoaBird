//
//  CocoaBird+Statuses.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBirdBase.h"
#import "CocoaBird+Core.h"



@interface CBSearchStatusesParams : CBQueryParams {}
@property (retain) NSString* q;
@property (retain) NSString* lang;
@property (retain) NSString* locale;
@property (retain) NSNumber* rpp;
@property (retain) NSNumber* page;
@property (retain) NSNumber* since_id;
@property (retain) NSString* until;
@property (retain) NSString* geocode;
@property (retain) NSNumber* show_user;
@property (retain) NSString* result_type;
@end


@class CBSearchResults;

@interface CocoaBird (Search)

//Search Statuses 
+ (CBSearchResults*) searchStatusesNow:(CBSearchStatusesParams*)params error:(NSError**)error;
+ (NSString*) searchStatuses:(CBSearchStatusesParams*)params delegate:(id)delegate selector:(SEL)selector;           // - (void) searchLoaded:(CBSearchResults*)results error:(NSError*)error;

@end


