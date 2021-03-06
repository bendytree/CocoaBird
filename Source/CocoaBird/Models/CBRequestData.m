//
//  CBRequestData.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/9/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import "CBRequestData.h"


@implementation CBRequestData

@synthesize id, request, type, class, delegate, selector, context;

- (id) initWithId:(CBRequestId*)_id request:(ASIFormDataRequest*)_request type:(CBTwitterResponseType)_type class:(Class)_class delegate:(id)_delegate selector:(SEL)_selector
{
    self = [super init];
    if (self) {
        
        self.id = _id;
        self.request = _request;
        self.type = _type;
        self.class = _class;
        self.delegate = _delegate;
        self.selector = _selector;
        
    }
    return self;
}

- (void) fireDelegateWithResult:(id)result error:(NSError*)error
{
    if(!self.delegate || !self.selector) return;
    
    NSInvocation* invo = [NSInvocation invocationWithMethodSignature:[self.delegate methodSignatureForSelector:self.selector]];
    [invo setTarget:self.delegate];
    [invo setSelector:self.selector];
    
    if(self.type == CBTwitterResponseTypeVoid){
        [invo setArgument:error atIndex:3];
        [invo setArgument:self.context atIndex:4];
    }else{
        [invo setArgument:result atIndex:2];
        [invo setArgument:error atIndex:3];
        [invo setArgument:self.context atIndex:4];
    }
    
    [invo invoke];
}

- (void)dealloc {
    
    self.id = nil;
    self.request = nil;
    self.type = 0;
    self.class = nil;
    self.delegate = nil;
    self.selector = nil;
    
    [super dealloc];
}

@end
