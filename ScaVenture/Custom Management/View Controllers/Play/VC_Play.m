//
//  VC_Play.m
//  ScaVenture
//
//  Created by ArshAulakh on 03/12/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_Play.h"
#import "TC_InvitePlayCell.h"

@interface VC_Play ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>{
 

}

@property UITableView *otl_InvitesTable;
@property UILabel *lbl_PTS,*lbl_Available;

@end

@implementation VC_Play

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
    
    // Initialization of the Variables and resources
    
    // Setting up teh View for Invites View Programatically
    CGRect bounds = _otl_ViewGame.frame;
    bounds.origin.x = SCREEN_SIZE.width;
   
    _otl_InvitesTable = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width, 44, SCREEN_SIZE.width, bounds.size.height-170)];
    [_otl_InvitesTable setBackgroundColor:[UIColor colorWithRed:29/255.0 green:61/255.0 blue:83/255.0 alpha:1.0]];
    [_otl_InvitesTable setBackgroundColor:[UIColor colorWithRed:29/255.0 green:61/255.0 blue:83/255.0 alpha:1.0]];
    [_otl_InvitesTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_otl_InvitesTable setTableFooterView:[UIView new]];
    [_otl_InvitesTable registerNib:[UINib nibWithNibName:@"TC_InvitePlayCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TC_InvitePlayCell"];
    _otl_InvitesTable.delegate=self;
    _otl_InvitesTable.dataSource=self;
    
    UIView *invitesSubview = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width, 0, SCREEN_SIZE.width, 44)];
    [invitesSubview setBackgroundColor:[UIColor colorWithRed:36/255.0 green:101/255.0 blue:134/255.0 alpha:1.0]];

    _lbl_PTS = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 24)];
    [_lbl_PTS setTextColor:[UIColor whiteColor]];
    [_lbl_PTS setText:@"(null) PTS"];

    _lbl_Available = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width/2 - 60, 10, 120, 24)];
    [_lbl_Available setTextColor:[UIColor whiteColor]];
    [_lbl_Available setText:@"Available"];
    [_lbl_Available setTextAlignment:NSTextAlignmentCenter];

    
    [invitesSubview addSubview:_lbl_PTS];
    [invitesSubview addSubview:_lbl_Available];
    
    [_viewOutline2 setBackgroundColor:[UIColor clearColor]];
    [_viewOutline3 setBackgroundColor:[UIColor clearColor]];
    
//    [_scrView_game setContentSize:CGSizeMake(self.view.frame.size.width,_scrView_game.frame.size.height *1.5)];
    dispatch_async(dispatch_get_main_queue(), ^{
        [_scrView_game setContentSize:CGSizeMake(self.view.frame.size.width*2,_scrView_game.frame.size.height)];
        [_scrView_game addSubview:invitesSubview];
        [_scrView_game addSubview:_otl_InvitesTable];
        
    });
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [self configureNavBarWithCustomBackButton:YES andTitle:@"Play"];
}

#pragma mark - ScrollView Delegates
-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
    
    
    
    if((scrollView.contentOffset.x/SCREEN_SIZE.width)==0){
        [_btn_Game setTitleColor:HIGHLIGHT_COLOR forState:UIControlStateNormal];
        [_btn_Invites setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_scrView_game setContentOffset:CGPointMake(0, 0) animated:YES];
        [_viewOutline1 setBackgroundColor:HIGHLIGHT_COLOR];
        [_viewOutline2 setBackgroundColor:[UIColor clearColor]];
        
    }else if ((scrollView.contentOffset.x/SCREEN_SIZE.width)==1){
        [_btn_Invites setTitleColor:HIGHLIGHT_COLOR forState:UIControlStateNormal];
        [_btn_Game setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_scrView_game setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:YES];
        [_viewOutline2 setBackgroundColor:HIGHLIGHT_COLOR];
        [_viewOutline1 setBackgroundColor:[UIColor clearColor]];

    }else if((scrollView.contentOffset.x/SCREEN_SIZE.width)==2){
        [_viewOutline2 setBackgroundColor:HIGHLIGHT_COLOR];
    }
}

#pragma mark- Table View Delegates

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView==_tbView_game) {
        return 0;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView==_tbView_game) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tbCell_main"];
        return cell;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView==_tbView_game) {
        return 10;
    }else if (tableView == _otl_InvitesTable){
        return 2;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView==_tbView_game) {
        if(indexPath.row==0){
            return 150.0f;
        }
        else if(indexPath.row==1){
            return 66.0f;
        }else{
            return 190;
        }
        
    }else if(tableView == _otl_InvitesTable){
        return 140;
    }
    return 0;
}

- (UITableViewCell *)tableView: (UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (tableView==_tbView_game) {
        if(indexPath.row==0){
            cell = [tableView dequeueReusableCellWithIdentifier:@"top_cell"];
        }else if(indexPath.row==1){
            cell = [tableView dequeueReusableCellWithIdentifier:@"tbCell_main"];
        }else{
            cell = [tableView dequeueReusableCellWithIdentifier:@"tbCell_detail"];
        }
        
    }else if (tableView == _otl_InvitesTable){
        TC_InvitePlayCell *cellInvite = (TC_InvitePlayCell *)[tableView dequeueReusableCellWithIdentifier:@"TC_InvitePlayCell"];
        return cellInvite;
        
    }
    return cell;
}

#pragma mark - IB Actions
// to Switch between the
- (IBAction)acn_Game_Invite:(UIButton *)sender {
    [sender setTitleColor:HIGHLIGHT_COLOR forState:UIControlStateNormal];
    if(sender==_btn_Game){
        [_viewOutline1 setBackgroundColor:HIGHLIGHT_COLOR];
        [_viewOutline2 setBackgroundColor:[UIColor clearColor]];
        [_btn_Invites setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_scrView_game setContentOffset:CGPointMake(0, 0) animated:YES];

//        dispatch_async(dispatch_get_main_queue(), ^{
//            CGRect bounds = _otl_Indicator.frame;
//            bounds.origin.x = 53.0f;
//            [_otl_Indicator setFrame:bounds];
//        });
        
    }else{
        [_btn_Game setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_viewOutline2 setBackgroundColor:HIGHLIGHT_COLOR];
        [_viewOutline1 setBackgroundColor:[UIColor clearColor]];
        [_scrView_game setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:YES];

//        dispatch_async(dispatch_get_main_queue(), ^{
//            CGRect bounds = _otl_Indicator.frame;
//            bounds.origin.x = 0.0f;
//            [_otl_Indicator setFrame:bounds];
//        });
    }
}
@end
