//
//  CocoaBirdModal.h
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/4/11.
//  Copyright 2011 Bendy Tree, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CocoaBirdModal : NSObject {
    
}

+ (void) present:(UIViewController*)controller;
+ (void) dismiss;
+ (void) dismiss:(UIViewController*)_controller;

@end
