//
//  VC_Profile.h
//  ScaVenture
//
//  Created by ArshAulakh on 30/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VC_Profile : UIViewController <UITableViewDataSource, UITableViewDelegate>

// (strong, nonatomic) IBOutlet UIScrollView *sv_Main;

@property (weak, nonatomic) IBOutlet UIButton *btn_About;

@property (weak, nonatomic) IBOutlet UIScrollView *sv_Profile;
@property (weak, nonatomic) IBOutlet UIImageView *imv_profileImage;
@property (weak, nonatomic) IBOutlet UITableView *tbView_profile;

- (IBAction)btnClicked_back:(id)sender;

@end
