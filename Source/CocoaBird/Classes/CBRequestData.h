//
//  CBRequestData.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaBird.h"

@class ASIFormDataRequest;

@interface CBRequestData : NSObject {
    
}

- (id) initWithId:(NSString*)id request:(ASIFormDataRequest*)request type:(CBTwitterResponseType)type delegate:(id)delegate selector:(SEL)selector;

@property (retain) NSString* id;
@property (retain) ASIFormDataRequest* request;
@property (assign) CBTwitterResponseType type;
@property (assign) id delegate;
@property (assign) SEL selector;

@end
