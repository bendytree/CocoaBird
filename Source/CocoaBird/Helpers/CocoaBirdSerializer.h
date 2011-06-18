//
//  CocoaBirdSerializer.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CocoaBirdSerializer : NSObject {
    
}

+ (id) deserialize:(NSString*)json as:(Class)cls;
+ (id) deserialize:(NSString*)json as:(Class)cls error:(NSError**)error;

@end
