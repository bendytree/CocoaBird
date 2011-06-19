//
//  CBLoginWebController.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CocoaBirdOAuthTokenRetriever.h"
#import "CocoaBird+Authentication.h"


typedef enum {
    CBLoginResultCancelled,
    CBLoginResultError,
    CBLoginResultSuccess,
} CBLoginResult;


@protocol CBLoginWebControllerDelegate
- (void) loginWebControllerFinished:(CBLoginResult)result error:(NSError*)error;
@end


@interface CBLoginWebController : UIViewController<UIWebViewDelegate, CocoaBirdOAuthTokenRetrieverDelegate> {
    
    IBOutlet UIWebView* web;
    BOOL hasBegunFirstLoad;
    BOOL isFirstLoad;
    
}

@property (retain) CocoaBirdOAuthTokenRetriever* tokenRetriever;
@property (assign) id<CBLoginWebControllerDelegate> delegate;

@end
