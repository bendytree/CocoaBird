//
//  CocoaBirdAuthenticatorViewController.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBirdAuthenticatorViewController.h"
#import "CocoaBirdModal.h"
#import "CocoaBirdAuthenticator.h"
#import "CocoaBirdSettings.h"

@interface CocoaBirdAuthenticatorViewController (private)
- (NSString*) findPin;
- (void) sendUserToAuthorizationPage;
@end

@implementation CocoaBirdAuthenticatorViewController

@synthesize tokenRetriever;

- (id)init
{
    self = [super initWithNibName:@"CocoaBirdAuthenticatorViewController" bundle:nil];
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
    
    //otherwise, if a request is in progress then it will blow up
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
    
    web.delegate = self;
    
    if([self.tokenRetriever hasRequestToken])
        [self sendUserToAuthorizationPage];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


#pragma mark - End Results

- (void) quit
{
    [CocoaBirdModal dismiss:self];
    
    [CocoaBirdAuthenticator sendClosedNotification];
}


#pragma mark - Web Delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	NSData* data = [request HTTPBody];
	char* raw = data ? (char *) [data bytes] : "";
	
	if (raw && strstr(raw, "cancel=")) {
		[self quit];
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
		
        //scroll to the login area
        [web performSelector: @selector(stringByEvaluatingJavaScriptFromString:) withObject: @"window.scrollBy(0,200)" afterDelay: 0];
	} else {
        //Did it work?
		NSString* pin = [self findPin];
		if (pin.length) {
            [self.tokenRetriever beginLoadingAccessTokenWithPin:pin];			
		}else{
            //Could do "copy pin" stuff here if we can't find it
        }
	}
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
    
    [self quit];
}

- (void) tokenRetrieverGotAccessToken:(NSString*)key secret:(NSString*)secret screenname:(NSString*)screenname
{
    NSLog(@"tokenRetrieverGotAccessToken");
    
    [CocoaBirdSettings setAuthenticationToken:key secret:secret screenname:screenname];
    
    [self quit];
}

- (void) tokenRetrieverUnableToGetAccessToken:(NSError*)error
{
    NSLog(@"tokenRetrieverUnableToGetAccessToken: %@", error);
    
    [self quit];
}


#pragma mark - Events

- (IBAction) pressedCancel
{
    [self quit];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
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
	// Look for either 'oauth-pin' or 'oauth_pin' in the raw HTML
	NSString			*js = @"var d = document.getElementById('oauth-pin'); if (d == null) d = document.getElementById('oauth_pin'); if (d) d = d.innerHTML; d;";
	NSString			*pin = [[web stringByEvaluatingJavaScriptFromString: js] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	
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



@end
