//
//  CBLoginWebController.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/18/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CocoaBirdOAuthRequestTokenRetriever.h"
#import "CocoaBird+Authentication.h"


typedef enum {
    CBLoginResultCancelled,
    CBLoginResultError,
    CBLoginResultSuccess,
} CBLoginResult;


@protocol CBLoginWebControllerDelegate
- (void) loginWebControllerFinished:(CBLoginResult)result error:(NSError*)error;
@end


@interface CBLoginWebController : UIViewController<UIWebViewDelegate, CocoaBirdOAuthRequestTokenRetrieverDelegate> {
    
    IBOutlet UIWebView* web;
    IBOutlet UIActivityIndicatorView* spinner;
    BOOL hasBegunFirstLoad;
    BOOL isFirstLoad;
    
}

@property (retain) CocoaBirdOAuthRequestTokenRetriever* tokenRetriever;
@property (assign) id<CBLoginWebControllerDelegate> delegate;

@end
