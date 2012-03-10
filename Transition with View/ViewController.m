//
//  ViewController.m
//  Transition with View
//
//  Created by Lion User on 3/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize rearsideView, frontsideView, containerView, completionLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [rearsideView removeFromSuperview];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)flipToBack {
    [UIView transitionFromView:frontsideView toView:rearsideView
                      duration:2.0
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    completion:^(BOOL dc){[self didComplete:dc];}];
}

- (void)flipToFront {
    [UIView transitionFromView:rearsideView toView:frontsideView
                      duration:2.0
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    completion:^(BOOL dc){[self didComplete:dc];}];
}

- (IBAction) doFlip:(id)sender
{
    if (rearsideView.superview) {
        [self flipToFront];
    } else {
        [self flipToBack];
    }
}

- (IBAction) cancelAnimations:(id)sender
{
    [containerView.layer removeAllAnimations];
}

- (void) didComplete:(BOOL)yeah
{
    completionLabel.alpha = 1.0;
    completionLabel.text = [NSString stringWithFormat:@"Completed: %@",
        yeah ? @"YES":@"NO"];
    [UIView animateWithDuration:0.5 delay:1.5 
        options:UIViewAnimationOptionTransitionNone 
        animations:^{completionLabel.alpha = 0.0;} 
        completion:NULL];
}

@end
