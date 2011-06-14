//
//  CocoaBirdAuthenticatorViewController.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CocoaBirdOAuthTokenRetriever.h"

@interface CocoaBirdAuthenticatorViewController : UIViewController<UIWebViewDelegate, CocoaBirdOAuthTokenRetrieverDelegate> {
    
    IBOutlet UIWebView* web;
    BOOL hasBegunFirstLoad;
    BOOL isFirstLoad;
    
}

@property (retain) CocoaBirdOAuthTokenRetriever* tokenRetriever;

- (IBAction) pressedCancel;

@end
