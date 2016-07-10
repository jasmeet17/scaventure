//
//  VC_EditProfile.h
//  ScaVenture
//
//  Created by ArshAulakh on 03/12/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VC_EditProfile : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *imv_EditProfileImage;
@property (weak, nonatomic) IBOutlet UIImageView *imv_CoverPhoto;
@property (weak, nonatomic) IBOutlet UITableView *tbView_editProfile;

- (IBAction)btnClicked_back:(id)sender;
- (IBAction)editCoverPhoto:(id)sender;
- (IBAction)editProfilePic:(id)sender;
- (IBAction)btn_ChangeName:(id)sender;
- (IBAction)btn_ChangeAbout:(id)sender;
- (IBAction)btn_EditProfile:(id)sender;





@end
