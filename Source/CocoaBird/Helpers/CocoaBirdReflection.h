//
//  CocoaBirdReflection.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/8/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CocoaBirdReflection : NSObject {
    
}

+ (bool) class:(Class)classA descendsFrom:(Class)classB;
+ (NSArray*) propertyNamesForClass:(Class)cls;
+ (Class) getTypeOfProperty:(NSString*)name onClass:(Class)cls;
+ (NSDictionary*) convertObjectToCoreType:(id)obj;
+ (id) buildObject:(Class)cls fromCoreType:(id)ct;
+ (void) setAllPropertiesToNil:(id)obj;

@end
