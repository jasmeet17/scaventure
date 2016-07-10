//
//  VC_Shop.m
//  ScaVenture
//
//  Created by ArshAulakh on 27/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_Shop.h"

@interface VC_Shop ()

@end

@implementation VC_Shop

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
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [self configureNavBarWithCustomBackButton:YES andTitle:@"Shop"];
    [self bntClicked_hostCredits:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView==_tbView_hostCredits) {
        return 5;
    } else {
        return 4;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView==_tbView_hostCredits) {
        if (indexPath.row==0) {
            return 88;
        } else {
            return 44;
        }
    } else {
        return 66;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (tableView==_tbView_hostCredits) {
        if (indexPath.row==0) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_purchasing"];
        } else if (indexPath.row==1 || indexPath.row==2) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_coins"];
        } else {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_coinsNPoints"];
        }
    } else {
        switch (indexPath.row) {
            case 0:
                cell = [tableView dequeueReusableCellWithIdentifier:@"cell_like"];
                break;
            case 1:
                cell = [tableView dequeueReusableCellWithIdentifier:@"cell_follow"];
                break;
            case 2:
                cell = [tableView dequeueReusableCellWithIdentifier:@"cell_subscribe"];
                break;
            case 3:
                cell = [tableView dequeueReusableCellWithIdentifier:@"cell_share"];
                break;
            default: NSLog(@"Unknown index");
                break;
        }
    }
    return cell;
}

- (IBAction)bntClicked_hostCredits:(id)sender {
    [_tbView_earnPoints setHidden:YES];
    [_imgViewActive_earnPoints setHidden:YES];
    
    [_tbView_hostCredits setHidden:NO];
    [_imgViewActive_hostCredits setHidden:NO];
}

- (IBAction)btnClicked_earnPoints:(id)sender {
    [_imgViewActive_hostCredits setHidden:YES];
    [_tbView_hostCredits setHidden:YES];
    
    [_tbView_earnPoints setHidden:NO];
    [_imgViewActive_earnPoints setHidden:NO];
}

@end
