//
//  CocoaBirdOAuthTokenRetriever.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBirdOAuthTokenRetriever.h"
#import "CocoaBirdSettings.h"

#import "OAMutableURLRequest.h"
#import "OAConsumer.h"
#import "OADataFetcher.h"

@interface CocoaBirdOAuthTokenRetriever (private)
- (NSString *) extractUsernameFromHTTPBody:(NSString*)body;
@end


@implementation CocoaBirdOAuthTokenRetriever

@synthesize requestToken, delegate, fetcher;

- (id)init {
    self = [super init];
    if (self) {
        self.fetcher = [[[OADataFetcher alloc] init] autorelease];

    }
    return self;
}


#pragma Request Token

- (BOOL) hasRequestToken
{
    return self.requestToken != nil;
}

- (void) beginLoadingRequestToken
{
    if([self hasRequestToken]) return;
    
    NSLog(@"beginLoadingRequestToken");
    
    OAConsumer* consumer = [[[OAConsumer alloc] initWithKey:[CocoaBirdSettings oAuthConsumerKey] secret:[CocoaBirdSettings oAuthConsumerSecret]] autorelease];
    
    NSURL* url = [NSURL URLWithString:@"http://twitter.com/oauth/request_token"];
    OAMutableURLRequest *request = [[[OAMutableURLRequest alloc] initWithURL:url
                                                                   consumer:consumer
                                                                      token:nil   // we don't have a Token yet
                                                                      realm:nil   // our service provider doesn't specify a realm
                                                          signatureProvider:nil] autorelease]; // use the default method, HMAC-SHA1
    [request setHTTPMethod:@"POST"];
    
        
    [self.fetcher fetchDataWithRequest:request
                         delegate:self
                didFinishSelector:@selector(requestTokenTicket:didFinishWithData:)
                  didFailSelector:@selector(requestTokenTicket:didFailWithError:)];
}

- (void)requestTokenTicket:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data {
    NSLog(@"requestTokenTicket didFinishWithData");
    NSString *responseBody = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
    self.requestToken = [[[OAToken alloc] initWithHTTPResponseBody:responseBody] autorelease];
    [self.delegate tokenRetrieverGotRequestToken];
}

- (void)requestTokenTicket:(OAServiceTicket *)ticket didFailWithError:(NSError*)error {
    NSLog(@"requestTokenTicket failed");
    [self.delegate tokenRetrieverUnableToGetRequestToken:error];
}


- (NSString*) authorizationUrl
{
    NSString* url = [NSString stringWithFormat:@"http://api.twitter.com/oauth/authorize?oauth_token=%@", self.requestToken.key];
    return url;
}


#pragma Access Token

- (void) beginLoadingAccessTokenWithPin:(NSString*)pin
{
    NSLog(@"beginLoadingAccessTokenWithPin:%@", pin);
    
    self.requestToken.verifier = pin;
    
    OAConsumer* consumer = [[[OAConsumer alloc] initWithKey:[CocoaBirdSettings oAuthConsumerKey] secret:[CocoaBirdSettings oAuthConsumerSecret]] autorelease];
    
    NSURL* url = [NSURL URLWithString:@"http://twitter.com/oauth/access_token"];
    OAMutableURLRequest *request = [[[OAMutableURLRequest alloc] initWithURL:url
                                                                    consumer:consumer
                                                                       token:self.requestToken   // we don't have a Token yet
                                                                       realm:nil   // our service provider doesn't specify a realm
                                                           signatureProvider:nil] autorelease]; // use the default method, HMAC-SHA1
    [request setHTTPMethod:@"POST"];
    
    [self.fetcher fetchDataWithRequest:request
                              delegate:self
                     didFinishSelector:@selector(accessTokenTicket:didFinishWithData:)
                       didFailSelector:@selector(accessTokenTicket:didFailWithError:)];    
}


- (void)accessTokenTicket:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data {
    NSLog(@"accessTokenTicket didFinish");
    NSString *responseBody = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
    OAToken* oaToken = [[[OAToken alloc] initWithHTTPResponseBody:responseBody] autorelease];
    
    NSString* token = oaToken.key;
    NSString* secret = oaToken.secret;
    NSString* screenname = [self extractUsernameFromHTTPBody:responseBody];
    
    [self.delegate tokenRetrieverGotAccessToken:token secret:secret screenname:screenname];
}

- (void)accessTokenTicket:(OAServiceTicket *)ticket didFailWithError:(NSError*)error {
    NSLog(@"accessTokenTicket didFailWithError");
    [self.delegate tokenRetrieverUnableToGetAccessToken:error];
}

- (NSString *) extractUsernameFromHTTPBody: (NSString *) body {
	if (!body) return nil;
	
	NSArray					*tuples = [body componentsSeparatedByString: @"&"];
	if (tuples.count < 1) return nil;
	
	for (NSString *tuple in tuples) {
		NSArray *keyValueArray = [tuple componentsSeparatedByString: @"="];
		
		if (keyValueArray.count == 2) {
			NSString				*key = [keyValueArray objectAtIndex: 0];
			NSString				*value = [keyValueArray objectAtIndex: 1];
			
			if ([key isEqualToString:@"screen_name"]) return value;
		}
	}
	
	return nil;
}


- (void)dealloc {
    self.requestToken = nil;
    self.delegate = nil;
    self.fetcher = nil;
    
    [super dealloc];
}

@end
