//
//  TransitionFromSecondToFirst.m
//  CustomTransitionAnimation
//
//  Created by 臧其龙 on 15/2/21.
//  Copyright (c) 2015年 zangqilong. All rights reserved.
//

#import "TransitionFromSecondToFirst.h"


@implementation TransitionFromSecondToFirst

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    containerView.backgroundColor = [UIColor blackColor];
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
   // toVC.view.backgroundColor = [UIColor redColor];
    
    NSTimeInterval animaitonDuration = [self transitionDuration:transitionContext];
    
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    
    
    [UIView animateWithDuration:animaitonDuration animations:^{
        fromVC.view.transform = CGAffineTransformMakeTranslation(-[UIScreen mainScreen].bounds.size.width, 0);
        fromVC.view.alpha = 0;
        toVC.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        // [fromVC.view removeFromSuperview];
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];

}


@end
