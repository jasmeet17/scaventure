//
//  VC_SignIn.h
//  ScaVenture
//
//  Created by ArshAulakh on 27/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPClient.h"
#import "NavigationBase.h"

@interface VC_SignIn : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *tf_email;
@property (weak, nonatomic) IBOutlet UITextField *tf_password;


- (IBAction)act_Login:(id)sender;

- (IBAction)act_ForgotPassword:(id)sender;

- (IBAction)act_SignIn:(id)sender;

- (IBAction)act_LoginFaceBook:(id)sender;


@end
