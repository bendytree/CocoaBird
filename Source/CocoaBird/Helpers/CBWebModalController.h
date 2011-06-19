//
//  CBWebModalController.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CBWebModalController : UIViewController<UIWebViewDelegate, UIActionSheetDelegate> {
    
    IBOutlet UIBarButtonItem* btnForward;
    IBOutlet UIBarButtonItem* btnBack;
    IBOutlet UIBarButtonItem* btnRefresh;
    IBOutlet UIBarButtonItem* btnTakeAction;
    IBOutlet UIWebView* web;
    IBOutlet UIActivityIndicatorView* spinner;
    
}

- (id)initWithUrl:(NSString*)_initialUrl;

@property (retain) NSString* initialUrl;

- (IBAction) pressedForward;
- (IBAction) pressedBack;
- (IBAction) pressedRefresh;
- (IBAction) pressedTakeAction;
- (IBAction) pressedClose;

@end
