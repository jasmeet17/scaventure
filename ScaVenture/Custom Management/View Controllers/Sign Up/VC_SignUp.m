//
//  VC_SignUp.m
//  ScaVenture
//
//  Created by ArshAulakh on 27/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_SignUp.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "NavigationBase.h"

@interface VC_SignUp ()
  
@end

@implementation VC_SignUp

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //change the place Holder Color
    [_tf_fullName setValue:[UIColor whiteColor]
                    forKeyPath:@"_placeholderLabel.textColor"];
    [_tf_confirmPassword setValue:[UIColor whiteColor]
                    forKeyPath:@"_placeholderLabel.textColor"];
    [_tf_email setValue:[UIColor whiteColor]
                    forKeyPath:@"_placeholderLabel.textColor"];
    [_tf_phoneNumber setValue:[UIColor whiteColor]
                    forKeyPath:@"_placeholderLabel.textColor"];
    [_tf_password setValue:[UIColor whiteColor]
                    forKeyPath:@"_placeholderLabel.textColor"];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)act_SignUp:(id)sender
{
        for(int i=1; i<=5; i++){
        if(((UITextField *)[self.view viewWithTag:i]).text.length==0){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please fill all details." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
            return;
        }
    }
    
        if([_tf_fullName.text isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }else if ([_tf_phoneNumber.text isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter your Phone Number." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else if ([_tf_email.text isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter Email." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else if ([_tf_password.text isEqualToString:@""] || [_tf_confirmPassword.text isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }else if (![_tf_password.text isEqualToString:_tf_confirmPassword.text])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Password Mismatch." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else{
            NSMutableDictionary *parameters = [NSMutableDictionary new];
            [parameters setObject:_tf_fullName.text forKey:@"name"];
            [parameters setObject:_tf_phoneNumber.text forKey:@"phone_number"];
            [parameters setObject:_tf_email.text forKey:@"email"];
            [parameters setObject:_tf_password.text forKey:@"password"];
            
            NSURL *baseURL = [NSURL URLWithString:WEB_BASE_URL];
            
            NSLog(@"the parameters --%@-",parameters);
            
            AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
            NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:@"web_service/signup" parameters:parameters];
            AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
            
            
            [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
             {
                 
                 NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:(NSData *)responseObject options:kNilOptions error:nil];
                 NSLog(@"Works  --%@--",dict);
                 
                 if([[dict objectForKey:@"status"] integerValue]==1){
                     UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Message" message:[dict objectForKey:@"msg"] delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
                     [alert show];
                     
                     [self performSelector:@selector(dismiss:) withObject:alert afterDelay:1.5];
                     
                 }else{
                     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:[dict objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                     [alert show];
                 }
                 
             }
                                             failure:^(AFHTTPRequestOperation *operation, NSError *error)
             {
                 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                 [alert show];
             }];
            
            [operation start];
        }
    
}

#pragma mark--

// method to dismiss the alertView when LOG in successfuk
-(void) dismiss:(UIAlertView *) alert{
    [alert dismissWithClickedButtonIndex:0 animated:YES];

    NavigationBase *vc = (NavigationBase *)[self.storyboard instantiateViewControllerWithIdentifier:@"NavController"];
    [self presentViewController:vc animated:NO completion:nil];
}
@end
