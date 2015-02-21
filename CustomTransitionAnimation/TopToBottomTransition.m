//
//  TopToBottomTransition.m
//  CustomTransitionAnimation
//
//  Created by 臧其龙 on 15/2/22.
//  Copyright (c) 2015年 zangqilong. All rights reserved.
//

#import "TopToBottomTransition.h"

@implementation TopToBottomTransition

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
    
   // toVC.view.transform = CGAffineTransformMakeTranslation(-kScreenWidth, 0);
    
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    
    [UIView animateWithDuration:animaitonDuration animations:^{
       // toVC.view.transform = CGAffineTransformIdentity;
        fromVC.view.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        fromVC.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];

}

@end
