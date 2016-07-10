//
//  VC_BaseNav.h
//  ScaVenture
//
//  Created by ArshAulakh on 27/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VC_Base : UIViewController {
    UIButton *backButton;
    UIButton *leftButton;
    UIButton *rightButton;
}

- (void)configureNavBarWithCustomBackButton:(BOOL)flag_BackBtn andTitle:(NSString *)title;
- (void)configureNavBarWithCustomBackButton:(BOOL)flag_BackBtn andTitle:(NSString *)title andCustomRightButton:(BOOL)flag_rightButton withImage:(UIImage *)image_right andTarget:(id)target_rightBtn andSelector:(SEL)action_rightBtn;
- (void)configureNavBarWithCustomLeftButtonWithImage:(UIImage *)image_left andTarget:(id)target_leftBtn andSelector:(SEL)action_leftBtn andTitle:(NSString *)title andShowCustomRightButton:(BOOL)flag_rightButton withImage:(UIImage *)image_right andTarget:(id)target_rightBtn andSelector:(SEL)action_rightBtn;

- (void)hideNavBar:(BOOL)flag;

@end
