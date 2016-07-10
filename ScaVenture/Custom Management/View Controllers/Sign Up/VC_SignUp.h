//
//  VC_SignUp.h
//  ScaVenture
//
//  Created by ArshAulakh on 27/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface VC_SignUp : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *tf_fullName;
@property (weak, nonatomic) IBOutlet UITextField *tf_phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *tf_email;
@property (weak, nonatomic) IBOutlet UITextField *tf_password;
@property (weak, nonatomic) IBOutlet UITextField *tf_confirmPassword;

- (IBAction)act_SignUp:(id)sender;



@end
