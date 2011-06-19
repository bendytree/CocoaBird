//
//  CBLoginWebController.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CBLoginWebController.h"

#import "CocoaBirdModal.h"
#import "CocoaBirdSettings.h"
#import "CocoaBird+AuthenticationCore.h"


@interface CBLoginWebController (private)
- (NSString*) findPin;
- (void) sendUserToAuthorizationPage;
- (void) fadeWebViewOut:(BOOL)fadeOut;
@end


@implementation CBLoginWebController

@synthesize tokenRetriever, delegate;

- (id) init
{
    self = [super initWithNibName:@"CBLoginWebController" bundle:nil];
    if (self) {
        isFirstLoad = YES;
        hasBegunFirstLoad = NO;
        
        [CocoaBirdSettings assertConsumerKeyAndSecretAreSet];
        
        self.tokenRetriever = [[[CocoaBirdOAuthTokenRetriever alloc] init] autorelease];
        self.tokenRetriever.delegate = self;
        [self.tokenRetriever beginLoadingRequestToken];
    }
    return self;
}

- (void)dealloc
{
    self.tokenRetriever = nil;
    self.delegate = nil;
    
    //if a request is in progress then make sure callback doesn't blow up
    web.delegate = nil;
	[web loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString: @""]]];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    web.delegate = self;
    
    [web setAlpha:0];
    
    if([self.tokenRetriever hasRequestToken])
        [self sendUserToAuthorizationPage];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}




#pragma mark - End Results

- (void) quit:(CBLoginResult)result error:(NSError*)error
{
    [self.delegate loginWebControllerFinished:result error:error];
}


#pragma mark - Web Delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    [self fadeWebViewOut:YES];
    
	NSData* data = [request HTTPBody];
	char* raw = data ? (char *) [data bytes] : "";
	
    NSString* requestUrl = [[request URL] absoluteString];
    
    //NSString* body = [NSString stringWithUTF8String:raw];
    
	if (raw && (strstr(raw, "cancel=") || strstr(raw, "deny=") || [requestUrl rangeOfString:@"denied="].length)) {
		[self quit:CBLoginResultCancelled error:nil];
		return NO;
	}
    
	return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    //nothing needed
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	if (isFirstLoad) {
   		isFirstLoad = NO;
        [self fadeWebViewOut:NO];
		
        //scroll to the login area
        [web performSelector: @selector(stringByEvaluatingJavaScriptFromString:) withObject: @"window.scrollBy(0,200)" afterDelay: 0];
        return;
	} 
    
    NSString* pin = [self findPin];
    if(pin.length){
        [self.tokenRetriever beginLoadingAccessTokenWithPin:pin];	
        return;
	}
    
    [self fadeWebViewOut:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}


#pragma mark - Retriever Delegate

- (void) tokenRetrieverGotRequestToken
{
    NSLog(@"tokenRetrieverGotRequestToken");
    
    [self sendUserToAuthorizationPage];
}

- (void) tokenRetrieverUnableToGetRequestToken:(NSError*)error
{
    NSLog(@"tokenRetrieverUnableToGetRequestToken: %@", error);
    
    [self quit:CBLoginResultError error:error];
}

- (void) tokenRetrieverGotAccessToken:(NSString*)key secret:(NSString*)secret screenname:(NSString*)screenname
{
    NSLog(@"tokenRetrieverGotAccessToken");
    
    [CocoaBirdSettings setAuthenticationToken:key secret:secret screenname:screenname];
    
    [self quit:CBLoginResultSuccess error:nil];
}

- (void) tokenRetrieverUnableToGetAccessToken:(NSError*)error
{
    NSLog(@"tokenRetrieverUnableToGetAccessToken: %@", error);
    
    [self quit:CBLoginResultError error:error];
}


#pragma Helpers

- (void) sendUserToAuthorizationPage
{
    if(hasBegunFirstLoad) return;
    
    NSLog(@"loading url in webview: %@", self.tokenRetriever.authorizationUrl);
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.tokenRetriever.authorizationUrl]]];
    hasBegunFirstLoad = YES;
}


- (NSString*) findPin
{
    // Special thanks to SA_OAuthTwitterController for this concept/code
	// Look for either 'oauth-pin' or 'oauth_pin' in the raw HTML
	NSString* js = @"var d = document.getElementById('oauth-pin'); if (d == null) d = document.getElementById('oauth_pin'); if (d) d = d.innerHTML; d;";
	NSString* pin = [[web stringByEvaluatingJavaScriptFromString: js] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	
	if (pin.length == 7) {
		return pin;
	} else {
		// New version of Twitter PIN page
		js = @"var d = document.getElementById('oauth-pin'); if (d == null) d = document.getElementById('oauth_pin'); " \
		"if (d) { var d2 = d.getElementsByTagName('code'); if (d2.length > 0) d2[0].innerHTML; }";
		pin = [[web stringByEvaluatingJavaScriptFromString: js] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
		
		if (pin.length == 7) {
			return pin;
		}
	}
	
	return nil;
}


- (void) fadeWebViewOut:(BOOL)fadeOut
{
    [UIView beginAnimations:@"fadeOut" context:nil];
    [UIView setAnimationDuration:.2];
    [web setAlpha:fadeOut ? 0 : 1];
    [UIView commitAnimations];
    
    if(fadeOut){
        [spinner startAnimating];
    }else{
        [spinner stopAnimating];
    }
}


@end
