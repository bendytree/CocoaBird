//
//  CocoaBirdAuthenticatorViewController.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CBLoginModalController.h"
#import "CocoaBirdModal.h"
#import "CocoaBirdSettings.h"
#import "CocoaBird+AuthenticationCore.h"



@implementation CBLoginModalController

@synthesize loginWebController;

- (id)init
{
    self = [super initWithNibName:@"CBLoginModalController" bundle:nil];
    if (self) {
        self.loginWebController = [[[CBLoginWebController alloc] init] autorelease];
        self.loginWebController.delegate = self;
    }
    return self;
}

- (void) dealloc
{
    self.loginWebController = nil;
    
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
    
    [self.view addSubview:self.loginWebController.view];
    [self.loginWebController.view setFrame:webPlaceholder.frame];
    [webPlaceholder removeFromSuperview];    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


#pragma mark - Events

- (void) quit:(CBLoginResult)result error:(NSError*)error
{
    [CocoaBird sendClosedNotification:result error:error];
    [CocoaBirdModal dismiss:self];
}

- (IBAction) pressedCancel
{
    [self quit:CBLoginResultCancelled error:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void) loginWebControllerFinished:(CBLoginResult)result error:(NSError*)error
{
    [self quit:result error:error];
}



@end
