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


+ (id) params
{
    return [[[self alloc] init] autorelease];
}

- (NSDictionary*) toDictionary
{
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
    for(NSString* propertyName in [CBReflection propertyNamesForClass:[self class]]){
        id val = [self valueForKey:propertyName];
        if(val && val != [NSNull null])
        {
            //trim the trailing _ (for well named options such as long)
            if([propertyName characterAtIndex:[propertyName length]-1] == '_')
                propertyName = [propertyName substringToIndex:[propertyName length]-1];
            
            [dic setObject:val forKey:propertyName];
        }
    }
    return dic;
}


#pragma Cleanup

- (void) dealloc {
    
    for(NSString* propertyName in [CBReflection propertyNamesForClass:[self class]]){
        [self setValue:nil forKey:propertyName];
    }
    
    [super dealloc];
}

@end
