//
//  CocoaBirdAuthenticatorViewController.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CocoaBirdAuthenticator.h"

@interface CocoaBirdAuthenticatorViewController : UIViewController<UIWebViewDelegate> {
    
    IBOutlet UIWebView* web;
    BOOL isFirstLoad;;
    
}

- (IBAction) pressedCancel;

@end
