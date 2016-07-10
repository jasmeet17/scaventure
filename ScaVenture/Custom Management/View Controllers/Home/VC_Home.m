//
//  VC_Home.m
//  ScaVenture
//
//  Created by ArshAulakh on 27/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_Home.h"

@interface VC_Home ()

@end

@implementation VC_Home

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue    :(UIStoryboardSegue *)segue sender:(id)sender {
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
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [self.navigationController.navigationBar setHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:NO];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLayoutSubviews
{
    
    [[NSUserDefaults standardUserDefaults] setFloat:CGRectGetHeight(_imv_ProfileImage.frame) forKey:@"profile_height"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (IBAction)btnClicked_share:(id)sender {
    UIActivityViewController *AVCObj = [[UIActivityViewController alloc]initWithActivityItems:nil applicationActivities:nil];
    //[[NSArray alloc]initWithObjects:@"ABC", nil]
    //NSArray *excludedActivities = @[UIActivityTypePrint,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll,UIActivityTypeAddToReadingList];
//    [AVCObj setExcludedActivityTypes:excludedActivities];
    [self presentViewController:AVCObj animated:YES completion:nil];
}

@end
