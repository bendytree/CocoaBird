//
//  CBReflection.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CBReflection : NSObject {
    
}

+ (bool) class:(Class)classA descendsFrom:(Class)classB;
+ (NSArray*) propertyNamesForClass:(Class)cls;
+ (Class) getTypeOfProperty:(NSString*)name onClass:(Class)cls;

@end
