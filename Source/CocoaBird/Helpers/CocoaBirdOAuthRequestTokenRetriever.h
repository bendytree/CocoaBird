//
//  CocoaBirdOAuthTokenRetriever.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/4/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OAToken.h"
#import "OADataFetcher.h"

@protocol CocoaBirdOAuthRequestTokenRetrieverDelegate
- (void) tokenRetrieverGotRequestToken;
- (void) tokenRetrieverUnableToGetRequestToken:(NSError*)error;

- (void) tokenRetrieverGotAccessToken:(NSString*)key secret:(NSString*)secret screenname:(NSString*)screenname;
- (void) tokenRetrieverUnableToGetAccessToken:(NSError*)error;
@end

@interface CocoaBirdOAuthRequestTokenRetriever : NSObject {
    
}

@property (retain) OAToken* requestToken;
@property (retain) OADataFetcher* fetcher;
@property (assign) id<CocoaBirdOAuthRequestTokenRetrieverDelegate> delegate;

- (void) beginLoadingAccessTokenWithPin:(NSString*)pin;
- (void) beginLoadingRequestToken;
- (NSString*) authorizationUrl;
- (BOOL) hasRequestToken;

@end
