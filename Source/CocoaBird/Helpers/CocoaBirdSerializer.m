//
//  CocoaBirdSerializer.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBirdSerializer.h"
#import "CocoaBirdReflection.h"
#import "SBJSON.h"

@implementation CocoaBirdSerializer

+ (NSString*) serialize:(id)obj
{
    return [self serialize:obj error:nil];
}

+ (NSString*) serialize:(id)obj error:(NSError**)error
{
    SBJSON* serializer = [[SBJSON alloc] init];
    
    id ct = [CocoaBirdReflection convertObjectToCoreType:obj];
    id str = [serializer stringWithObject:ct error:error];
    
    [serializer release];
    
    return str;
}

+ (id) deserialize:(NSString*)json as:(Class)cls
{
    return [self deserialize:json as:cls error:nil];
}

+ (id) deserialize:(NSString*)json as:(Class)cls error:(NSError**)error
{
    SBJSON* serializer = [[SBJSON alloc] init];
    
    id coreType = [serializer objectWithString:json error:error];
    id obj = [CocoaBirdReflection buildObject:cls fromCoreType:coreType];
    
    [serializer release];
    
    return obj;
}

@end
