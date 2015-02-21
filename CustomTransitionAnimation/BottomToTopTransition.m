//
//  BottomToTopTransition.m
//  CustomTransitionAnimation
//
//  Created by 臧其龙 on 15/2/22.
//  Copyright (c) 2015年 zangqilong. All rights reserved.
//

#import "BottomToTopTransition.h"

@implementation BottomToTopTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    
    NSTimeInterval animaitonDuration = [self transitionDuration:transitionContext];
    
     toVC.view.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
    
    [containerView addSubview:toVC.view];
    
    [UIView animateWithDuration:animaitonDuration animations:^{
         toVC.view.transform = CGAffineTransformIdentity;
      //  fromVC.view.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
       // fromVC.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}

@end
