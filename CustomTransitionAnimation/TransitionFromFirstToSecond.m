//
//  TransitionFromFirstToSecond.m
//  CustomTransitionAnimation
//
//  Created by 臧其龙 on 15/2/21.
//  Copyright (c) 2015年 zangqilong. All rights reserved.
//

#import "TransitionFromFirstToSecond.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation TransitionFromFirstToSecond

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    
    NSTimeInterval animaitonDuration = [self transitionDuration:transitionContext];
    
    toVC.view.transform = CGAffineTransformMakeTranslation(-kScreenWidth, 0);
    
    [containerView addSubview:toVC.view];
    
    [UIView animateWithDuration:animaitonDuration animations:^{
        toVC.view.transform = CGAffineTransformIdentity;
        fromVC.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:^(BOOL finished) {
        fromVC.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];

}

@end
