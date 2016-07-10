//
//  VC_Friends.m
//  ScaVenture
//
//  Created by ArshAulakh on 03/12/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_Friends.h"

@interface VC_Friends ()

@end

@implementation VC_Friends

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [self configureNavBarWithCustomBackButton:YES andTitle:@"Friends" andCustomRightButton:YES withImage:[UIImage imageNamed:@"Friend_Search-btn.png"] andTarget:self andSelector:@selector(goToSearch:)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureTableData];
}

- (void)configureTopBarRightButton {
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *img = [UIImage imageNamed:@"Friend_Search-btn.png"];
    [searchButton setImage:img forState:UIControlStateNormal];
    searchButton.frame = CGRectMake(0, 0, img.size.width, img.size.height);
    [searchButton addTarget:self action:@selector(goToSearch:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:searchButton]];
}

- (void)configureTableData {
    arr_names = @[@"Anne Hathaway",@"Adam West",@"Aaron Taylor",@"David Hayes",@"Trevor Trobley",@"Tamika Dawn"];
    arr_status = @[@"Orphan Anne",@"ImBatman-69",@"Fishing-In-Dark",@"Raver-Hive",@"Orphan Anne",@"Rawr-sexybeast"];
    
    sections = [[NSMutableDictionary alloc] init];
    
    BOOL found;
    
    for (NSString *temp in arr_names)
    {
        NSString *c = [temp substringToIndex:1];
        
        found = NO;
        
        for (NSString *str in [sections allKeys])
        {
            if ([str isEqualToString:c])
            {
                found = YES;
            }
        }
        
        if (!found)
        {
            [sections setValue:[[NSMutableArray alloc] init] forKey:c];
        }
    }
    
    for (NSString *temp in arr_names)
    {
        [[sections objectForKey:[temp substringToIndex:1]] addObject:temp];
    }
    
    //Configure Header Color
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setFont:[UIFont fontWithName:@"HelveticaNeue-Regular" size:12.0f]];
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setTextColor:[UIColor colorWithRed:(39/255.0f) green:(172/255.0f) blue:(215/255.0f) alpha:1.0f]];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[sections allKeys]count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 33;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_header"];
    [(UILabel *)[cell viewWithTag:1] setText:[[[sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_footer"];
    return cell;
}

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[[sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section];
}
*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[sections valueForKey:[[[sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section]] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    tbCell_following *cell = [tableView dequeueReusableCellWithIdentifier:@"tbCell_following"];
    NSString *titleText = [[sections valueForKey:[[[sections allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    [cell.lbl_name setText:titleText];
    [cell.lbl_username setText:[arr_status objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)goToSearch:(id)sender {
    VC_FriendsSearch *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"VC_FriendsSearch"];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
