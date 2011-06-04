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
@end

@implementation CocoaBirdAuthenticatorViewController

- (id)init
{
    self = [super initWithNibName:@"CocoaBirdAuthenticatorViewController" bundle:nil];
    if (self) {
        isFirstLoad = YES;
        
        [CocoaBirdSettings assertTokensAreSet];
    }
    return self;
}

- (void)dealloc
{
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
    
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://twitter.com/oauth/authorize"]]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


#pragma mark - End Results

- (void) userWantsToQuit
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
		[self userWantsToQuit];
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
		[web performSelector: @selector(stringByEvaluatingJavaScriptFromString:) withObject: @"window.scrollBy(0,200)" afterDelay: 0];
		isFirstLoad = NO;
	} else {
        //Did it work?
		NSString* pin = [self findPin];
		if (pin.length) {
			
            	[self requestURL:@"http://twitter.com/oauth/access_token" token: [CocoaBirdSettings oAuthToken] onSuccess: @selector(setAccessToken:withData:) onFail: @selector(outhTicketFailed:data:)];
			
		}
        
        //Could do "copy pin" stuff here
	}
}

- (void) setAccessToken: (OAServiceTicket *) ticket withData: (NSData *) data {
	if (!ticket.didSucceed || !data) return;
	
	NSString *dataString = [[[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding] autorelease];
	if (!dataString) return;
    
	if (self.pin.length && [dataString rangeOfString: @"oauth_verifier"].location == NSNotFound) dataString = [dataString stringByAppendingFormat: @"&oauth_verifier=%@", self.pin];
	
	NSString				*username = [self extractUsernameFromHTTPBody:dataString];
    
	if (username.length > 0) {
		[self setUsername: username password: nil];
		if ([_delegate respondsToSelector: @selector(storeCachedTwitterOAuthData:forUsername:)]) [(id) _delegate storeCachedTwitterOAuthData: dataString forUsername: username];
	}
	
	[_accessToken release];
	_accessToken = [[OAToken alloc] initWithHTTPResponseBody:dataString];
}







- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}


#pragma mark - Events

- (IBAction) pressedCancel
{
    [self userWantsToQuit];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


#pragma Helpers

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
