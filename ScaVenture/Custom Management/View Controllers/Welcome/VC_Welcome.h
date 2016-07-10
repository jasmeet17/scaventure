//
//  ViewController.h
//  ScaVenture
//
//  Created by ArshAulakh on 15/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VC_Welcome : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (weak, nonatomic) IBOutlet UIButton *btn_LoginWithFB;
@property (weak, nonatomic) IBOutlet UIButton *btn_Login;
@property (weak, nonatomic) IBOutlet UIButton *btn_SignUp;
@property (weak, nonatomic) IBOutlet UIView *view_bottom;
- (IBAction)btnClicked_LoginWithFB:(id)sender;
- (IBAction)btnClicked_Login:(id)sender;
- (IBAction)btnClicked_SignUp:(id)sender;

@end

