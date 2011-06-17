//
//  CBRequestData.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBird.h"

@class ASIFormDataRequest, CBRequestId;

@interface CBRequestData : NSObject {
    
}

- (id) initWithId:(NSString*)_id request:(ASIFormDataRequest*)_request type:(CBTwitterResponseType)_type class:(Class)_class delegate:(id)_delegate selector:(SEL)_selector;

@property (retain) CBRequestId* id;
@property (retain) ASIFormDataRequest* request;
@property (assign) CBTwitterResponseType type;
@property (retain) Class class;
@property (assign) id delegate;
@property (assign) SEL selector;

@end
