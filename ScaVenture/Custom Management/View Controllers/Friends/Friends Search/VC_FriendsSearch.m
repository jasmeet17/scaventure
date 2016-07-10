//
//  VC_FriendsSearch.m
//  ScaVenture
//
//  Created by ArshAulakh on 04/12/14.
//
//

#import "VC_FriendsSearch.h"

@interface VC_FriendsSearch ()

@end

@implementation VC_FriendsSearch

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
    [self configureNavBarWithCustomBackButton:YES andTitle:@"Friends Search"];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [_btn_friendRequests setTitle:@"Follow Requests" forState:UIControlStateNormal];
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [_btn_friendRequests setTitle:@"Friend Requests" forState:UIControlStateNormal];
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [_btn_friendRequests setTitle:@"Friend Requests" forState:UIControlStateNormal];
    [searchBar resignFirstResponder];
}

@end
