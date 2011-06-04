//
//  CocoaBirdModal.m
//  TestCocoaBird
//
//  Created by JOSHUA WRIGHT on 6/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaBirdModal.h"

@implementation CocoaBirdModal


static NSMutableArray* _controllers = NULL;
+ (NSMutableArray*) controllers
{
    @synchronized(self)
    {
        if(_controllers == NULL)
            _controllers = [[NSMutableArray alloc] init];
    }
    return _controllers;
}


+ (void) present:(UIViewController*)controller
{
    [[self controllers] addObject:controller];
    
    //Find the current window
    UIView* window = [[UIApplication sharedApplication] keyWindow]; /* nil if makeKeyAndVisible not yet called */
    if(!window)
        window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    
    //Remove the window's current subviews
    NSMutableArray* subs = [NSMutableArray array];
    for(UIView* sub in window.subviews){
        [sub removeFromSuperview];
        [subs addObject:sub];
    }
    
    //Add our view as 'the first one' so it gets rotation events, see: http://stackoverflow.com/questions/2508630/orientation-in-a-uiview-added-to-a-uiwindow
    [window addSubview:controller.view];
    
    //Add the subviews back
    for(UIView* sub in subs)
        [window addSubview:sub];
    
    //Move our view to the front
    [window bringSubviewToFront:controller.view];
    
    //Fill the screen, account for status bar (if it exists)
    //Starting position is below the screen (so it can slide up)
    CGRect aFrame = [[UIScreen mainScreen] applicationFrame];
    [controller.view setFrame:CGRectMake(aFrame.origin.x, aFrame.origin.y+aFrame.size.height, aFrame.size.width, aFrame.size.height)];
    
    //Slide it up (like a modal)
    [UIView beginAnimations:@"ModalPresent" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:.3];
    [controller.view setFrame:CGRectMake(aFrame.origin.x, aFrame.origin.y, aFrame.size.width, aFrame.size.height)];
    [UIView commitAnimations];
}

+ (void) dismiss
{
    for(UIViewController* c in [self controllers]){
        [self dismiss:c];
    }
}

+ (void) dismiss:(UIViewController*)_controller
{   
    //Remove then re-add so the 2nd view becomes the first view & gets
    //rotation event BEFORE our animation out (so we REVEAL the correct view)
    UIView* superview = _controller.view.superview;
    [_controller.view removeFromSuperview];
    [superview addSubview:_controller.view];
    
    //Slide it down (like a modal)
    [UIView beginAnimations:@"ModalDismiss" context:_controller];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:.3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(dismissComplete:finished:context:)];
    [_controller.view setFrame:CGRectMake(_controller.view.frame.origin.x, _controller.view.frame.origin.y+_controller.view.frame.size.height, _controller.view.frame.size.width, _controller.view.frame.size.height)];
    [UIView commitAnimations];
}

+ (void) dismissComplete:(NSString*)animationId finished:(NSNumber *)finished context:(UIViewController*)_controller
{
    [_controller.view removeFromSuperview];
    
    [[self controllers] removeObject:_controller];
}

@end
