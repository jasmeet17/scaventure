//
//  VC_BaseNav.m
//  ScaVenture
//
//  Created by ArshAulakh on 27/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_Base.h"

@interface VC_Base ()

@end

@implementation VC_Base

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureButtons];
}

- (void)configureButtons {
    //back Button
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    UIImage *img = [UIImage imageNamed:@"back-main-btn.png"];
    [backButton setImage:img forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    
    //left Button
    leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = backButton.frame;
    
    //right Button
    rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 44, 44);
}

- (void)configureNavBarWithCustomBackButton:(BOOL)flag_BackBtn andTitle:(NSString *)title {
    [self.navigationItem setTitle:title];
    if (flag_BackBtn) {
        [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:backButton]];
    }
}

- (void)configureNavBarWithCustomBackButton:(BOOL)flag_BackBtn andTitle:(NSString *)title andCustomRightButton:(BOOL)flag_rightButton withImage:(UIImage *)image_right andTarget:(id)target_rightBtn andSelector:(SEL)action_rightBtn {
    [self configureNavBarWithCustomBackButton:YES andTitle:title];
    
    if (flag_rightButton) {
        [rightButton setImage:image_right forState:UIControlStateNormal];
        [rightButton addTarget:target_rightBtn action:action_rightBtn forControlEvents:UIControlEventTouchUpInside];
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:rightButton]];
    }
}

- (void)configureNavBarWithCustomLeftButtonWithImage:(UIImage *)image_left andTarget:(id)target_leftBtn andSelector:(SEL)action_leftBtn andTitle:(NSString *)title andShowCustomRightButton:(BOOL)flag_rightButton withImage:(UIImage *)image_right andTarget:(id)target_rightBtn andSelector:(SEL)action_rightBtn {
    //configure Left Btn
    [leftButton setImage:image_left forState:UIControlStateNormal];
    [leftButton addTarget:target_leftBtn action:action_leftBtn forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:leftButton]];
    
    //if showing configure right button
    if (flag_rightButton) {
        [rightButton setImage:image_right forState:UIControlStateNormal];
        [rightButton addTarget:target_rightBtn action:action_rightBtn forControlEvents:UIControlEventTouchUpInside];
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:rightButton]];
    }
}

- (void)hideNavBar:(BOOL)flag {
    [self.navigationController.navigationBar setHidden:flag];
}

- (void)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
