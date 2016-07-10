//
//  VC_Settings.m
//  ScaVenture
//
//  Created by ArshAulakh on 29/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_Settings.h"

@interface VC_Settings ()

@end

@implementation VC_Settings

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureNavBarWithCustomBackButton:YES andTitle:@"Settings"];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 14;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    switch (indexPath.row) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"header_pushNotifs"];
            [[[cell viewWithTag:1] layer] setBorderColor:[UIColor colorWithRed:(39/256.0f) green:(172/256.0f) blue:(215/256.0f) alpha:1.0f].CGColor];
            [[[cell viewWithTag:1] layer] setCornerRadius:16.0f];
            [[[cell viewWithTag:1] layer] setBorderWidth:2.0f];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_chatNotifs"];
            [[[cell viewWithTag:1] layer] setBorderColor:[UIColor colorWithRed:(39/256.0f) green:(172/256.0f) blue:(215/256.0f) alpha:1.0f].CGColor];
            [[[cell viewWithTag:1] layer] setCornerRadius:16.0f];
            [[[cell viewWithTag:1] layer] setBorderWidth:2.0f];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_friendNotifs"];
            [[[cell viewWithTag:1] layer] setBorderColor:[UIColor colorWithRed:(39/256.0f) green:(172/256.0f) blue:(215/256.0f) alpha:1.0f].CGColor];
            [[[cell viewWithTag:1] layer] setCornerRadius:16.0f];
            [[[cell viewWithTag:1] layer] setBorderWidth:2.0f];
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_inviteNotifs"];
            [[[cell viewWithTag:1] layer] setBorderColor:[UIColor colorWithRed:(39/256.0f) green:(172/256.0f) blue:(215/256.0f) alpha:1.0f].CGColor];
            [[[cell viewWithTag:1] layer] setCornerRadius:16.0f];
            [[[cell viewWithTag:1] layer] setBorderWidth:2.0f];
            break;
        case 4:
            cell = [tableView dequeueReusableCellWithIdentifier:@"header_support"];
            break;
        case 5:
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_help"];
            break;
        case 6:
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_report"];
            break;
        case 7:
            cell = [tableView dequeueReusableCellWithIdentifier:@"header_about"];
            break;
        case 8:
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_blog"];
            break;
        case 9:
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_privacy"];
            break;
        case 10:
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_terms"];
            break;
        case 11:
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_about"];
            break;
        case 12:
            cell = [tableView dequeueReusableCellWithIdentifier:@"header_account"];
            break;
        case 13:
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_logout"];
            break;
        default:
            break;
    }
    return cell;
}

@end
