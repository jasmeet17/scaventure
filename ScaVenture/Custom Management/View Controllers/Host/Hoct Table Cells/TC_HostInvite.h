//
//  TC_HostInvite.h
//  ScaVenture
//
//  Created by Abhi on 24/01/15.
//
//

#import <UIKit/UIKit.h>

@interface TC_HostInvite : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *tf_AddDescription;


@property (weak, nonatomic) IBOutlet UILabel *lbl_buyInPoints;
@property (weak, nonatomic) IBOutlet UILabel *lbl_timeLimitHours;
@property (weak, nonatomic) IBOutlet UILabel *lbl_ScavAmount;
@property (weak, nonatomic) IBOutlet UILabel *lbl_PlayerNumber;



@property (weak, nonatomic) IBOutlet UISlider *otl_buyInSlider;
@property (weak, nonatomic) IBOutlet UISlider *otl_TimeLimitSlider;
@property (weak, nonatomic) IBOutlet UISlider *otl_ScavAmountSlider;
@property (weak, nonatomic) IBOutlet UISlider *otl_PlayerSlider;

@property (weak, nonatomic) IBOutlet UIButton *btn_ChooseFriend;

@property (weak, nonatomic) IBOutlet UIButton *btn_HostGame;

// Share Cell Outlets
@property (weak, nonatomic) IBOutlet UIButton *btn_FacebookShare;
@property (weak, nonatomic) IBOutlet UIButton *btn_TwitterShare;
@property (weak, nonatomic) IBOutlet UIButton *btn_InstagramShare;

// Collection View CHoose Scav
@property (weak, nonatomic) IBOutlet UICollectionView *otl_CollectionViewScav;



@end
