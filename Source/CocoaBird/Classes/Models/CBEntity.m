//
//  CBEntity.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CBEntity.h"
#import "CBReflection.h"


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
    NSDateFormatter* df = [CBEntity dateFormatter];
    NSDate* date = nil;
    [df setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    date = [df dateFromString:str];
    if(date) return date;
    
    [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    date = [df dateFromString:str];
    if(date) return date;
    
    return nil;
}

- (void) bindProperties
{
    
    NSDictionary* arrayClasses = [self arrayPropertyClasses];
    
    for(NSString* propertyName in [CBReflection propertyNamesForClass:[self class]]){        
        Class propertyType = [CBReflection getTypeOfProperty:propertyName onClass:[self class]];
        id dicVal = [self.orig objectForKey:propertyName];
        Class valType = [dicVal class];
        if(!dicVal || [NSNull null] == dicVal) continue;
        
        NSLog(@"%@.%@ = '%@'", [self class], propertyName, dicVal);

        //Property is a CBEntity
        if([CBReflection class:propertyType descendsFrom:[CBEntity class]]){
            id newVal = [[[propertyType alloc] initWithDictionary:dicVal] autorelease];
            [self setValue:newVal forKey:propertyName];
            
        // Convert string to date
        }else if([CBReflection class:propertyType descendsFrom:[NSDate class]]
           && [CBReflection class:valType descendsFrom:[NSString class]]){
            [self setValue:[CBEntity parseDate:dicVal] forKey:propertyName];
            
        //Arrays
        }else if([CBReflection class:propertyType descendsFrom:[NSArray class]]){ 
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
        }else if([CBReflection class:valType descendsFrom:propertyType]){
            [self setValue:dicVal forKey:propertyName];
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
