//
//  CBWebModalController.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/18/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CBWebModalController.h"
#import "CocoaBirdModal.h"

@implementation CBWebModalController

@synthesize initialUrl;

- (id)initWithUrl:(NSString*)_initialUrl
{
    self = [super initWithNibName:@"CBWebModalController" bundle:nil];
    if (self) {
        self.initialUrl = _initialUrl;
    }
    return self;
}

- (void)dealloc
{
    self.initialUrl = nil;
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


- (void) updateButtonEnablement:(BOOL)doAllow
{
    btnBack.enabled = doAllow && web.canGoBack;
    btnForward.enabled = doAllow && web.canGoForward;
    btnRefresh.enabled = doAllow;
    btnTakeAction.enabled = doAllow;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    web.delegate = self;
    web.alpha = 0;
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.initialUrl]]];
    
    [self updateButtonEnablement:NO];
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
    return YES;//(interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) fadeWebOut:(BOOL)fadeOut
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


#pragma Web Delegate

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    [self fadeWebOut:YES];
    [self updateButtonEnablement:NO];
    
    return YES;
}

- (void) webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    [self fadeWebOut:NO];
    [self updateButtonEnablement:YES];
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}


#pragma UI Events

- (IBAction) pressedForward
{
    [web goForward];
}

- (IBAction) pressedBack
{
    [web goBack];
}

- (IBAction) pressedRefresh
{
    [web reload];
}

- (IBAction) pressedTakeAction
{
    UIActionSheet* sheet = [[[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil] autorelease];
    [sheet addButtonWithTitle:@"Open with Safari"];
    [sheet addButtonWithTitle:@"Cancel"];
    sheet.cancelButtonIndex = 1;
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(actionSheet.cancelButtonIndex == buttonIndex)
        return;

    [[UIApplication sharedApplication] openURL:[web.request URL]]; 
}

- (IBAction) pressedClose
{
    [CocoaBirdModal dismiss:self];
}


@end
