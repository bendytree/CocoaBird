//
//  CBQueryParameters.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"

@interface CBQueryParams : NSObject {
    
}

- (void) applyToRequest:(ASIFormDataRequest*)request;

@end
