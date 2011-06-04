//
//  TestCocoaBirdAppDelegate.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TestCocoaBirdAppDelegate.h"
#import "ASIHTTPRequest.h"
#import "RootController.h"
#import "CocoaBird.h"

@implementation TestCocoaBirdAppDelegate

@synthesize window=_window, controller, cocoaBird;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.controller = [[[RootController alloc] init] autorelease];
    [self.window addSubview:self.controller.view];
    [self.controller.view setFrame:[[UIScreen mainScreen] applicationFrame]];
    
    [CocoaBird setConsumerKey:@"FD36QhvLRLZYPLdl1Qfg" andSecret:@"V6Wx1HK1L8RVYKyA3lbmz36CstMaQ9EnIP7RKoPaE"];
    
    if(![CocoaBird isAuthenticated]){
        [CocoaBird addAuthenticationDelegate:self];
        [CocoaBird launchAuthentication];
    }
    
    [self.window makeKeyAndVisible];
    return YES;
} 

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

#pragma Cocoa Bird

- (void) cocoaBirdAuthenticationEnded
{
    NSLog(@"cocoaBirdAuthenticationEnded");
}

- (void)dealloc
{
    [CocoaBird removeAuthenticationDelegate:self];
    
    self.controller = nil;
    self.cocoaBird = nil;
    
    [_window release];
    [super dealloc];
}

@end
