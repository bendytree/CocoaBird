//
//  RootController.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootController.h"
#import "CocoaBird.h"
#import "CBStatus.h"

@implementation RootController

- (id)init
{
    self = [super initWithNibName:@"RootController" bundle:nil];
    if (self) {
        // Custom initialization
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
    
    CBRemoveMemberFromListParams* params = [CBRemoveMemberFromListParams params];
    params.slug = @"test";
    params.owner_screen_name = @"crookedwoody";
    params.screen_name = @"bendytree";
    NSError* error = nil;
    [CocoaBird removeMemberFromListNow:params error:&error];
    NSLog(@"error: %@", error);
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
