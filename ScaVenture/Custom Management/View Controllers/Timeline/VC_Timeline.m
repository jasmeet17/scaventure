//
//  VC_Timeline.m
//  ScaVenture
//
//  Created by ArshAulakh on 10/12/14.
//
//

#import "VC_Timeline.h"

@interface VC_Timeline ()

@end

@implementation VC_Timeline

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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [self configureNavBarWithCustomBackButton:YES andTitle:@"Timeline"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0 || indexPath.row==2) {
        return 140;
    } else {
        return 66;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.row==0 || indexPath.row==2) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell_details"];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell_following"];
    }
    
    [[[cell viewWithTag:2] layer] setCornerRadius:25];
    return cell;
}

@end