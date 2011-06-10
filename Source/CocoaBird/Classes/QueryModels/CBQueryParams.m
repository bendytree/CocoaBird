//
//  CBQueryParameters.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CBQueryParams.h"
#import "CBReflection.h"

@implementation CBQueryParams


- (void) applyToRequest:(ASIFormDataRequest*)request
{
    for(NSString* propertyName in [CBReflection propertyNamesForClass:[self class]]){
        id val = [self valueForKey:propertyName];
        if(val && val != [NSNull null])
        {
            [self setValue:val forKey:propertyName];
        }
    }
}


#pragma Cleanup

- (void) dealloc {
    
    for(NSString* propertyName in [CBReflection propertyNamesForClass:[self class]]){
        [self setValue:nil forKey:propertyName];
    }
    
    [super dealloc];
}

@end
