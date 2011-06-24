//
//  CocoaBirdSerializer.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/18/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CocoaBirdSerializer : NSObject {
    
}

+ (NSString*) serialize:(id)obj;
+ (NSString*) serialize:(id)obj error:(NSError**)error;

+ (id) deserialize:(NSString*)json as:(Class)cls;
+ (id) deserialize:(NSString*)json as:(Class)cls error:(NSError**)error;

@end
