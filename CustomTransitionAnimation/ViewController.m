//
//  ViewController.m
//  CustomTransitionAnimation
//
//  Created by 臧其龙 on 15/2/21.
//  Copyright (c) 2015年 zangqilong. All rights reserved.
//

#import "ViewController.h"
#import "TransitionFromFirstToSecond.h"
#import "SecondViewController.h"
#import "TopToBottomTransition.h"
#import "BottomToTopTransition.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.transitioningDelegate = self;
 //   self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark UIViewController methods

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Set outself as the navigation controller's delegate so we're asked for a transitioning object
  //  self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Stop being the navigation controller's delegate
//    if (self.navigationController.delegate == self) {
//        self.navigationController.delegate = nil;
//    }
}

//- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
//{
//    if (fromVC == self && [toVC isKindOfClass:[SecondViewController class]]) {
//        TransitionFromFirstToSecond *transition = [[TransitionFromFirstToSecond alloc] init];
//
//        return transition;
//    }
//    else {
//        return nil;
//    }
//}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[TopToBottomTransition alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[BottomToTopTransition alloc] init];
}

- (IBAction)pushToSecond:(id)sender
{
    SecondViewController *sec = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"secondvc"];
    sec.transitioningDelegate = self;
    [self presentViewController:sec animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
