//
//  CBReflection.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CBReflection.h"
#import <objc/runtime.h>

@implementation CBReflection


+ (bool) class:(Class)classA descendsFrom:(Class)classB
{
    while(1)
    {
        if(classA == classB) return YES;
        id superClass = class_getSuperclass(classA);
        if(classA == superClass) return (superClass == classB);
        classA = superClass;
    }
}

+ (NSArray*) propertyNamesForClass:(Class)cls
{
    NSMutableArray* names = [NSMutableArray array];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(cls, &outCount);
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName) {
            NSString *propertyName = [NSString stringWithCString:propName encoding:NSASCIIStringEncoding];
            [names addObject:propertyName];
        }
    }
    free(properties);   
    return names;
}

+ (Class) getTypeOfProperty:(NSString*)name onClass:(Class)class {
    
    objc_property_t property = class_getProperty(class, [name UTF8String]);
    if (property == NULL)
        return nil;
    
    NSString* attributes = [NSString stringWithCString:property_getAttributes(property) encoding:NSASCIIStringEncoding];
    NSString* attribute = [[[attributes componentsSeparatedByString:@","] objectAtIndex:0] substringFromIndex:1];
    
    if([attribute length] > 3)
    {
        NSString* typeName = [attribute substringWithRange:NSMakeRange(2, [attribute length] - 3)];
        Class cls = NSClassFromString(typeName);
        return cls;
    }
    
    return [NSNumber class];
}


@end
