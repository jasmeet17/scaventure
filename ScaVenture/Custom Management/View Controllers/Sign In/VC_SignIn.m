//
//  VC_SignIn.m
//  ScaVenture
//
//  Created by ArshAulakh on 27/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_SignIn.h"
#import <FacebookSDK/FacebookSDK.h>
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"

@interface VC_SignIn ()

@end

@implementation VC_SignIn

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //change the place Holder Color
    [_tf_email setValue:[UIColor whiteColor]
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

#pragma mark- Buttons Action
- (IBAction)act_Login:(id)sender {
    
    NavigationBase *vc = (NavigationBase *)[self.storyboard instantiateViewControllerWithIdentifier:@"NavController"];
    [self presentViewController:vc animated:NO completion:nil];
    
    /*
    if(_tf_password.text.length==0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if(_tf_password.text.length==0 && _tf_email.text.length==0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Please enter all details." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
       
        NSMutableDictionary *parameters = [NSMutableDictionary new];
        [parameters setObject:_tf_email.text forKey:@"email"];
        [parameters setObject:_tf_password.text forKey:@"password"];
        
        NSURL *baseURL = [NSURL URLWithString:WEB_BASE_URL];
        
        NSLog(@"the parameters --%@-",parameters);
        
        AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
        NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:@"web_service/login" parameters:parameters];
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
    
    */
    
}

- (IBAction)act_ForgotPassword:(id)sender {
    UIAlertView* dialog = [[UIAlertView alloc] initWithTitle:@"" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    [dialog setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [dialog setTitle:@"Please enter Email you entered at the time of Registration"];
    [[dialog textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeEmailAddress];
    dialog.tag=1;
    [dialog show];
}

- (IBAction)act_SignIn:(id)sender {
}

- (IBAction)act_LoginFaceBook:(id)sender {
    NSArray *readPermissions = @[@"email",@"friends_birthday",@"friends_likes",@"friends_interests",@"user_birthday",@"user_interests",@"user_likes",@"user_location",@"user_birthday",@"user_photos",@"user_relationships",@"friends_photos"];
    
    
    
    
    [FBSession openActiveSessionWithReadPermissions:readPermissions
                                       allowLoginUI:YES
                                  completionHandler:^(FBSession *session,
                                                      FBSessionState state,
                                                      NSError *error) {
                                      if(!session.accessTokenData.accessToken)
                                      {
                                          
                                      }
                                      else
                                      {
                                          
                                          NSString* Access_Token=session.accessTokenData.accessToken;
                                          
                                          NSLog(@"access token --%@--",Access_Token);
                                          
                                          
                                          
                                      }
                                  }];
    

}

#pragma mark- alertview Delegate
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (alertView.tag) {
        case 1: // for Forgot Password
        {
            NSString *temp= [[alertView textFieldAtIndex:0].text stringByReplacingOccurrencesOfString:@" " withString:@""];
            
            NSString *emailRegEx = @"[0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}";
            NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
            
            
            if(temp.length==0)
            {
                //                    [self showTheAlert:@"Please enter Email." tagValue:0 setDelegate:nil];
            }
            else if(![emailTest evaluateWithObject:temp])
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Invalid Email!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            else
            {
                NSMutableDictionary *parameters = [NSMutableDictionary new];
                [parameters setObject:temp forKey:@"email"];
                
                NSURL *baseURL = [NSURL URLWithString:WEB_BASE_URL];
                
                AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
                NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:@"web_service/forgot_password" parameters:parameters];
                AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
                
                
                [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
                 {
                     
                     NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:(NSData *)responseObject options:kNilOptions error:nil];
                     NSLog(@"Works  --%@--",dict);
                     
                     if([[dict objectForKey:@"status"] integerValue]==1){
                         UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Message" message:[dict objectForKey:@"msg"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                         [alert show];
                         
                         
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

            break;
            
        default:
            break;
    }
}

#pragma mark-- Dismiss the AlertView

// method to dismiss the alertView when LOG in successfuk
-(void) dismiss:(UIAlertView *) alert{
    [alert dismissWithClickedButtonIndex:0 animated:YES];
    
    NavigationBase *vc = (NavigationBase *)[self.storyboard instantiateViewControllerWithIdentifier:@"NavController"];
    [self presentViewController:vc animated:NO completion:nil];
    

}

@end
