//
//  ViewController.m
//  ScaVenture
//
//  Created by ArshAulakh on 15/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_Welcome.h"

@interface VC_Welcome ()

@end

@implementation VC_Welcome

#pragma mark -
#pragma mark -System Methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark -Initialization Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupWelcomeScroll];
}

-(void)setupWelcomeScroll {
    //VC_Welcome page control appearance customization
    UIPageControl *pageControl = [UIPageControl appearanceWhenContainedIn:[VC_Welcome class], nil];
    pageControl.pageIndicatorTintColor = [UIColor colorWithRed:(110/255.0f) green:(195/255.0f) blue:(253/255.0f) alpha:1.0f];
    pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:(46/255.0f) green:(70/255.0f) blue:(83/255.0f) alpha:1.0f];
    pageControl.backgroundColor = [UIColor clearColor];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    UIViewController *welcome1 = [self.storyboard instantiateViewControllerWithIdentifier:@"Welcome1"];
    [welcome1.view setBackgroundColor:[UIColor clearColor]];
    NSArray *viewControllers = @[welcome1];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - _view_bottom.frame.size.height);
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

#pragma mark -
#pragma mark -PageViewController DataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if ([viewController.title isEqualToString:@"Welcome1"]) {
        return nil;
    } else if ([viewController.title isEqualToString:@"Welcome2"]) {
        UIViewController *VC =  [self.storyboard instantiateViewControllerWithIdentifier:@"Welcome1"];
        [VC.view setBackgroundColor:[UIColor clearColor]];
        return VC;
    } else if ([viewController.title isEqualToString:@"Welcome3"]) {
        UIViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"Welcome2"];
        [VC.view setBackgroundColor:[UIColor clearColor]];
        return VC;
    } else if ([viewController.title isEqualToString:@"Welcome4"]) {
        UIViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"Welcome3"];
        [VC.view setBackgroundColor:[UIColor clearColor]];
        return VC;
    }
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if ([viewController.title isEqualToString:@"Welcome4"]) {
        return nil;
    } else if ([viewController.title isEqualToString:@"Welcome3"]) {
        UIViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"Welcome4"];
        [VC.view setBackgroundColor:[UIColor clearColor]];
        return VC;
    } else if ([viewController.title isEqualToString:@"Welcome2"]) {
        UIViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"Welcome3"];
        [VC.view setBackgroundColor:[UIColor clearColor]];
        return VC;
    } else if ([viewController.title isEqualToString:@"Welcome1"]) {
        UIViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"Welcome2"];
        [VC.view setBackgroundColor:[UIColor clearColor]];
        return VC;
    }
    return nil;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 4;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
   return 0;
}

#pragma mark -
#pragma mark -FB Login Functionality

- (IBAction)btnClicked_LoginWithFB:(id)sender {
}

#pragma mark -
#pragma mark -Email Login Functionality

- (IBAction)btnClicked_Login:(id)sender {
}

#pragma mark -
#pragma mark -Email Signup Functionality

- (IBAction)btnClicked_SignUp:(id)sender {
}

@end
