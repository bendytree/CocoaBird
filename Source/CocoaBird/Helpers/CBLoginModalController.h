//
//  CBLoginModalController.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/3/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CocoaBirdOAuthRequestTokenRetriever.h"
#import "CBLoginWebController.h"

@interface CBLoginModalController : UIViewController<CBLoginWebControllerDelegate> {
    
    IBOutlet UIView* webPlaceholder;
    
}

@property (retain) CBLoginWebController* loginWebController;

- (IBAction) pressedCancel;

@end
