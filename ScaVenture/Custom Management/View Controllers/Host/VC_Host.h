//
//  VC_HostViewController.h
//  ScaVenture
//
//  Created by ArshAulakh on 03/12/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_Base.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface VC_Host : VC_Base <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tbView_host;
@property (weak, nonatomic) IBOutlet UIView *viewActive_host;
@property (weak, nonatomic) IBOutlet UITableView *tbView_manage;
@property (weak, nonatomic) IBOutlet UIView *viewActive_manage;
@property (weak, nonatomic) IBOutlet UITextField *tf_AddDescription;


@property (weak, nonatomic) IBOutlet UIButton *btn_Host;
@property (weak, nonatomic) IBOutlet UIButton *btn_Manage;
@property (weak, nonatomic) IBOutlet UIButton *btn_InviteOnly;
@property (weak, nonatomic) IBOutlet UIButton *btn_Public;





- (IBAction)btnClicked_host:(id)sender;
- (IBAction)btnClicked_manage:(id)sender;
// Method to change whether Public or Privaye Mode
- (IBAction)acn_Invite_Public:(id)sender;



@end
