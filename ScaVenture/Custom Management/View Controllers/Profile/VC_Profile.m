//
//  VC_Profile.m
//  ScaVenture
//
//  Created by ArshAulakh on 30/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_Profile.h"

@interface VC_Profile ()

@end

@implementation VC_Profile

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Initial Setup
    
    //rounding , coloring border Profile Image
    _imv_profileImage.layer.cornerRadius=58.0f;
    _imv_profileImage.layer.borderWidth=2.0f;
    _imv_profileImage.layer.borderColor=[UIColor whiteColor].CGColor;
   // _sv_Profile.contentSize=CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(_sv_Profile.frame) + 300);
    
   // UIScrollView *obj = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    
    
    //[_sv_Main setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 300)];
    
   // _sv_Profile.contentSize=CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(_sv_Profile.frame) + 300);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    _sv_Profile.contentSize=CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(_sv_Profile.frame) + 300);
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            //return 499;
            return [[[NSUserDefaults standardUserDefaults] objectForKey:@"profile_height"] floatValue]+102;
            break;
        case 1:
            return 33;
            break;
        case 2:
            return 91;
            break;
        case 3:
            return 234;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    switch (indexPath.section) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"HeaderCell"];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"RatingCell"];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"AboutCell"];
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:@"PointsCell"];
            break;
        default:
            break;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section>1) {
        return 0;
    }
    return 20;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView=[UIView new];
    [footerView setBackgroundColor:[UIColor clearColor]];
    return footerView;
}

- (IBAction)btnClicked_back:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
