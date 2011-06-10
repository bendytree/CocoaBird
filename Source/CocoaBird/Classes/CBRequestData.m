//
//  CBRequestData.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CBRequestData.h"


@implementation CBRequestData

@synthesize id, request, type, delegate, selector;

- (id) initWithId:(NSString*)_id request:(ASIFormDataRequest*)_request type:(CBTwitterResponseType)_type delegate:(id)_delegate selector:(SEL)_selector
{
    self = [super init];
    if (self) {
        
        self.id = _id;
        self.request = _request;
        self.type = _type;
        self.delegate = _delegate;
        self.selector = _selector;
        
    }
    return self;
}

- (void)dealloc {
    
    self.id = nil;
    self.request = nil;
    self.type = 0;
    self.delegate = nil;
    self.selector = nil;
    
    [super dealloc];
}

@end