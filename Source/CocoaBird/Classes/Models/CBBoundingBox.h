//
//  MyClass.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEntity.h"

@interface CBBoundingBox : CBEntity {
    
}

@property (retain) NSString* type;
@property (retain) NSArray* coordinates;

@end
