//
//  CocoaBirdReflection.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBirdReflection.h"
#import <objc/runtime.h>

@implementation CocoaBirdReflection


+ (NSDictionary*) convertObjectToCoreType:(id)obj
{
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
    for(NSString* propertyName in [self propertyNamesForClass:[obj class]]){
        id val = [obj valueForKey:propertyName];
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


#pragma Binding Properties


#pragma Property Binding

static NSDateFormatter* _dateFormatter = NULL;
+ (NSDateFormatter*) dateFormatter
{
    @synchronized(self)
    {
        if(_dateFormatter == NULL)
            _dateFormatter = [[NSDateFormatter alloc] init];
    }
    return _dateFormatter;
}

+ (NSDate*) parseDate:(NSString*)str
{
    NSDateFormatter* df = [self dateFormatter];
    NSDate* date = nil;
    [df setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    date = [df dateFromString:str];
    if(date) return date;
    
    [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    date = [df dateFromString:str];
    if(date) return date;
    
    return nil;
}

+ (id) buildObject:(Class)cls fromCoreType:(id)ct
{
    //is the original an array?
    if([self class:[ct class] descendsFrom:[NSArray class]])
    {
        NSArray* originalArray = ct;
        NSMutableArray* items = [NSMutableArray array];
        for(NSDictionary* originalItem in originalArray){
            [items addObject:[self buildObject:cls fromCoreType:originalItem]];
        }
        return items;
    }
    
    //if not an array, ct must be a Dictionary
    if([self class:[ct class] descendsFrom:[NSDictionary class]] == NO)
        return nil;
        
    NSDictionary* dic = ct;
    id obj = [[[cls alloc] init] autorelease];
    
    NSDictionary* arrayClasses = [NSDictionary dictionary];
    if([obj respondsToSelector:@selector(arrayPropertyClasses)]){
        arrayClasses = [obj performSelector:@selector(arrayPropertyClasses)];
    }
    
    for(NSString* propertyName in [CocoaBirdReflection propertyNamesForClass:cls]){        
        Class propertyType = [CocoaBirdReflection getTypeOfProperty:propertyName onClass:cls];
        id propertyVal = [dic objectForKey:propertyName];
        Class valType = [propertyVal class];
        if(!propertyVal || [NSNull null] == propertyVal) continue;
        
        //save original value of dicitonary in this specially named property
        if([propertyName isEqualToString:@"orig"])
        {
            [obj setValue:ct forKey:@"orig"];
            continue;
        }
        
        //NSLog(@"%@.%@ = '%@'", cls, propertyName, propertyVal);
        
        //Property is a Date, Value is a String
        if([CocoaBirdReflection class:propertyType descendsFrom:[NSDate class]]
                 && [CocoaBirdReflection class:valType descendsFrom:[NSString class]]){
            [obj setValue:[self parseDate:propertyVal] forKey:propertyName];
            
        //Arrays
        }else if([CocoaBirdReflection class:propertyType descendsFrom:[NSArray class]]){ 
            //Is a custom type defined?
            if([arrayClasses objectForKey:propertyName]){
                Class arrayClass = [arrayClasses objectForKey:propertyName];
                [obj setValue:[self buildObject:arrayClass fromCoreType:propertyVal] forKey:propertyName];
            }else{
                //No custom type, so just assign the array
                [obj setValue:propertyVal forKey:propertyName];
            }
        
        // Same type, so just assign
        }else if([CocoaBirdReflection class:valType descendsFrom:propertyType]){
            [self setValue:propertyVal forKey:propertyName];
        
        // Convert custom object
        }else if([CocoaBirdReflection class:propertyType descendsFrom:[NSDictionary class]]){
            [obj setValue:[self buildObject:propertyType fromCoreType:propertyVal] forKey:propertyName];
            
        }
    }
    
    return obj;
}

+ (void) setAllPropertiesToNil:(id)obj
{
    for(NSString* propertyName in [self propertyNamesForClass:[obj class]]){
        [obj setValue:nil forKey:propertyName];
    }
}


@end
