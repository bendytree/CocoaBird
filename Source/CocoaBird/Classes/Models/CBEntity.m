//
//  CBEntity.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CBEntity.h"
#import <objc/runtime.h>


@interface CBEntity()
- (void) bindProperties;
@end


@implementation CBEntity

@synthesize orig;

- (id) initWithDictionary:(NSDictionary*)dic {       
    self = [super init];
    if (self) {
        
        self.orig = dic;
        
        [self bindProperties];
        
    }
    return self;
}

- (NSDictionary*) arrayPropertyClasses
{
    return [NSDictionary dictionary];
}


#pragma Reflection

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


#pragma Property Binding

- (void) bindProperties
{
    NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    
    NSDictionary* arrayClasses = [self arrayPropertyClasses];
    
    for(NSString* propertyName in [CBEntity propertyNamesForClass:[self class]]){        
        Class propertyType = [CBEntity getTypeOfProperty:propertyName onClass:[self class]];
        id dicVal = [self.orig objectForKey:propertyName];
        Class valType = [dicVal class];
        if(!dicVal || [NSNull null] == dicVal) continue;
        
        NSLog(@"%@.%@ = '%@'", [self class], propertyName, dicVal);

        //Property is a CBEntity
        if([CBEntity class:propertyType descendsFrom:[CBEntity class]]){
            id newVal = [[[propertyType alloc] initWithDictionary:dicVal] autorelease];
            [self setValue:newVal forKey:propertyName];
            
        // Convert string to date
        }else if([CBEntity class:propertyType descendsFrom:[NSDate class]]
           && [CBEntity class:valType descendsFrom:[NSString class]]){
            [self setValue:[dateFormatter dateFromString:dicVal] forKey:propertyName];
            
        //Arrays
        }else if([CBEntity class:propertyType descendsFrom:[NSArray class]]){ 
            //Is a custom type defined?
            if([arrayClasses objectForKey:propertyName]){
                Class arrayClass = [arrayClasses objectForKey:propertyName];
                NSMutableArray* newArray = [NSMutableArray array];
                for(NSDictionary* dicArrayVal in dicVal){
                    id newVal = [[[arrayClass alloc] initWithDictionary:dicArrayVal] autorelease];
                    [newArray addObject:newVal];
                }
                [self setValue:newArray forKey:propertyName];
                
                
            }else{
                //No custom type, so just assign the array
                [self setValue:dicVal forKey:propertyName];
            }
        
        // Same type, so just assign
        }else if([CBEntity class:valType descendsFrom:propertyType]){
            [self setValue:dicVal forKey:propertyName];
        }
    }
}


#pragma Cleanup

- (void) dealloc {
    
    for(NSString* propertyName in [CBEntity propertyNamesForClass:[self class]]){
        [self setValue:nil forKey:propertyName];
    }
    
    [super dealloc];
}

@end
