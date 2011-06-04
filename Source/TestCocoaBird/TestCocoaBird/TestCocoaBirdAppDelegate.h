//
//  TestCocoaBirdAppDelegate.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootController.h"
#import "CocoaBird.h"


@interface TestCocoaBirdAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (retain) RootController* controller;
@property (retain) CocoaBird* cocoaBird;

@end
