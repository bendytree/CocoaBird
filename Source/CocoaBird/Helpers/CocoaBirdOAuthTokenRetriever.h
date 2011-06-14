//
//  CocoaBirdOAuthTokenRetriever.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OAToken.h"
#import "OADataFetcher.h"

@protocol CocoaBirdOAuthTokenRetrieverDelegate
- (void) tokenRetrieverGotRequestToken;
- (void) tokenRetrieverUnableToGetRequestToken:(NSError*)error;

- (void) tokenRetrieverGotAccessToken:(NSString*)key secret:(NSString*)secret screenname:(NSString*)screenname;
- (void) tokenRetrieverUnableToGetAccessToken:(NSError*)error;
@end

@interface CocoaBirdOAuthTokenRetriever : NSObject {
    
}

@property (retain) OAToken* requestToken;
@property (retain) OADataFetcher* fetcher;
@property (assign) id<CocoaBirdOAuthTokenRetrieverDelegate> delegate;

- (void) beginLoadingAccessTokenWithPin:(NSString*)pin;
- (void) beginLoadingRequestToken;
- (NSString*) authorizationUrl;
- (BOOL) hasRequestToken;

@end
