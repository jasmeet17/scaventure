//
//  VC_HostViewController.m
//  ScaVenture
//
//  Created by ArshAulakh on 03/12/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_Host.h"
#import "TC_Manage.h"
#import "TC_HostInvite.h"
#import "VC_Friends.h"
#import "Macro.h"
#import "CC_HostChooseScav.h"
#import "VC_Gallery.h"

@interface VC_Host ()<UIAlertViewDelegate,UIDocumentInteractionControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,sendData>{
    
    NSArray *arr_Manage;
    UILabel *lbl_BuyIn;
    UILabel *lbl_TimeLimit;
    UILabel *lbl_ScavAmount;
    UILabel *lbl_PlayersNumber;
    
    // Will hold the Images choosen as Scavs
    NSMutableArray *arr_ChooseScavs;
    
}

@property UIDocumentInteractionController * documentInteractionController;


@end

@implementation VC_Host

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initializing Arrays
    arr_Manage = @[@"Hollywood Actors",@"Sunday Morning",@"Must love dogs",
                   @"Bartending",@"At the GYM",@"Beautiful girls"];
    
    // Initializations
    arr_ChooseScavs = [[NSMutableArray alloc] init];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [self configureNavBarWithCustomBackButton:YES andTitle:@"Host"];
    [self btnClicked_host:nil];
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

#pragma mark - Table View Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag==1) {
        return 9;
    }else if(tableView.tag==2){
        return arr_Manage.count;
    }else
        return 6;
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag==1) {
        switch (indexPath.row) {
            case 0:
                return 75;
                break;
            case 1:
                return 60;
                break;
            case 2:// table Manage
                return 60;
                break;
            case 3:
                return 60;
                break;
            case 4:
                return 86;
                break;
            case 5:
                return 60;
                break;
            case 6:
                return 86;
                break;
            case 7:
                return 30;
                break;
            case 8:
                return 30;
                break;
            default:
                break;
        }
    } else
        return 44;
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TC_HostInvite *cellHostInvite;
    if (tableView.tag==1) {
        switch (indexPath.row) {
            case 0:
                cellHostInvite = [tableView dequeueReusableCellWithIdentifier:@"cell_title"];
                [cellHostInvite.tf_AddDescription setValue:[UIColor whiteColor]
                                forKeyPath:@"_placeholderLabel.textColor"];
                break;
            case 1:
                cellHostInvite = [tableView dequeueReusableCellWithIdentifier:@"cell_buyIn"];
                [cellHostInvite.otl_buyInSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                cellHostInvite.lbl_buyInPoints.text=[NSString stringWithFormat:@"%dpts",(int)round(cellHostInvite.otl_buyInSlider.value)];
                lbl_BuyIn = cellHostInvite.lbl_buyInPoints;
                cellHostInvite.otl_buyInSlider.tag=150;
                break;
            case 2:
                cellHostInvite = [tableView dequeueReusableCellWithIdentifier:@"cell_timeLimit"];
                [cellHostInvite.otl_TimeLimitSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                cellHostInvite.lbl_timeLimitHours.text=[NSString stringWithFormat:@"%dhrs",(int)round(cellHostInvite.otl_TimeLimitSlider.value)];
                lbl_TimeLimit = cellHostInvite.lbl_timeLimitHours;
                cellHostInvite.otl_TimeLimitSlider.tag=151;
                
                break;
            case 3:
                cellHostInvite = [tableView dequeueReusableCellWithIdentifier:@"cell_scavAmount"];
                [cellHostInvite.otl_ScavAmountSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                cellHostInvite.lbl_ScavAmount.text=[NSString stringWithFormat:@"%d",(int)round(cellHostInvite.otl_ScavAmountSlider.value)];
                lbl_ScavAmount = cellHostInvite.lbl_ScavAmount;
                cellHostInvite.otl_ScavAmountSlider.tag=152;

                break;
            case 4:
                cellHostInvite = [tableView dequeueReusableCellWithIdentifier:@"cell_chooseScav"];
                cellHostInvite.otl_CollectionViewScav.tag=1001;
                
//                cellHostInvite.otl_CollectionViewScav.delegate=self;
//                cellHostInvite.otl_CollectionViewScav.dataSource=self;
                
                break;
            case 5:
                cellHostInvite = [tableView dequeueReusableCellWithIdentifier:@"cell_players"];
                [cellHostInvite.otl_PlayerSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                cellHostInvite.lbl_PlayerNumber.text=[NSString stringWithFormat:@"%d",(int)round(cellHostInvite.otl_PlayerSlider.value)];
                lbl_PlayersNumber = cellHostInvite.lbl_PlayerNumber;
                cellHostInvite.otl_PlayerSlider.tag=153;
                break;
            case 6:
                cellHostInvite = [tableView dequeueReusableCellWithIdentifier:@"cell_chooseFriends"];
                [cellHostInvite.btn_ChooseFriend addTarget:self action:@selector(acn_ChooseFriends:) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 7:
                cellHostInvite = [tableView dequeueReusableCellWithIdentifier:@"cell_share"];
                [cellHostInvite.btn_FacebookShare addTarget:self action:@selector(acn_FacebookShare:) forControlEvents:UIControlEventTouchUpInside];
                [cellHostInvite.btn_TwitterShare addTarget:self action:@selector(acn_TwitterShare:) forControlEvents:UIControlEventTouchUpInside];
                [cellHostInvite.btn_InstagramShare addTarget:self action:@selector(acn_InstagramShare:) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 8:
                cellHostInvite = [tableView dequeueReusableCellWithIdentifier:@"cell_coins"];
                [cellHostInvite.btn_HostGame addTarget:self action:@selector(acn_HostGame:) forControlEvents:UIControlEventTouchUpInside];
                break;
            default:
                break;
        }
    } else{
     
        TC_Manage *cellManage = (TC_Manage *)[tableView dequeueReusableCellWithIdentifier:@"cell_manage"];
        cellManage.lbl_number.layer.cornerRadius=9.0;
        cellManage.lbl_number.layer.borderWidth=2.0;
        cellManage.lbl_number.clipsToBounds=YES;
        cellManage.lbl_number.layer.borderColor=[UIColor whiteColor].CGColor;
        
        cellManage.lbl_LabelCell.text = [arr_Manage objectAtIndex:indexPath.row];
        
        if(indexPath.row%2==0 && indexPath.row>1){
            cellManage.lbl_number.text = [NSString stringWithFormat:@"%d", (int)indexPath.row+3];
        }else{
            cellManage.lbl_number.hidden=YES;
        }
        
        return cellManage;
        
    }
    
    return cellHostInvite;
}

#pragma mark- user Short Methods
// Methos to show the AlertViews
-(void) showTheAlert:(NSString *) message
{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:message message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark- TC_HostInvites Methods
// Method Called on the Change of the Value of the Slider
-(void) sliderValueChanged:(UISlider *) sender{
 
    // Followings are the Tag to update the values acc to the Slider
    // 150 = Buy In
    // 151 = Time Limit
    // 152 = Scav Amount
    // 153 = Players Number
    
    switch (sender.tag) {
        case 150:
        {
            lbl_BuyIn.text = [NSString stringWithFormat:@"%dpts",(int)round(sender.value)];
        }
            break;
        case 151:
        {
            lbl_TimeLimit.text = [NSString stringWithFormat:@"%dhrs",(int)round(sender.value)];
        }
            break;
        case 152:
        {
            lbl_ScavAmount.text = [NSString stringWithFormat:@"%d",(int)round(sender.value)];
        }
            break;
        case 153:
        {
            lbl_PlayersNumber.text = [NSString stringWithFormat:@"%d",(int)round(sender.value)];
        }
            break;
    }
    
    
    
}

#pragma mark -  alertView Delegates
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self btnClicked_manage:_btn_Manage];
}

#pragma mark Methos to Share on Socail Media
// Share on Facebook
-(void) acn_FacebookShare:(UIButton *) sender{
    [self shareOnFacebookTwitter:1];
}
// Share on Twitter
-(void) acn_TwitterShare:(UIButton *) sender{
    [self shareOnFacebookTwitter:2];
}
// Share on Instagram
-(void) acn_InstagramShare:(UIButton *) sender{
    
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://location?id=1"];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        
        UIImage *iconImage = [UIImage imageNamed:@"DummyImage1.png"];
        NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image.igo"];
        [UIImageJPEGRepresentation(iconImage, 1.0) writeToFile:jpgPath atomically:YES];
        
        _documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:jpgPath]];
        _documentInteractionController.UTI = @"com.instagram.exclusivegram";
        _documentInteractionController.annotation = [NSDictionary dictionaryWithObject:@"The textual Content will be shown here." forKey:@"InstagramCaption"];
        
        [_documentInteractionController presentOpenInMenuFromRect: self.view.frame inView: self.view animated: YES ];
    }
    else
    {
        [self showTheAlert:@"Instagaram not available on your device."];
    }

}

// Mothod to Share on twitter and Facebook, before a Game has been Started
//Facebook value = 1 and
//twitter value = 2
-(void) shareOnFacebookTwitter:(short) value{
    
    SLComposeViewController *controller = [SLComposeViewController
                                           composeViewControllerForServiceType:(value==1)?SLServiceTypeFacebook:SLServiceTypeTwitter];
    SLComposeViewControllerCompletionHandler myBlock =
    ^(SLComposeViewControllerResult result){
        if (result == SLComposeViewControllerResultCancelled)
        {
            NSLog(@"Cancelled");
        }
        else
        {
            NSLog(@"Done");
        }
        [controller dismissViewControllerAnimated:YES completion:nil];
    };
    controller.completionHandler =myBlock;
    //Adding the Text to the facebook post value from iOS
    
    controller.completionHandler =myBlock;
    //Adding the Text to the facebook post value from iOS
    [controller setInitialText:@"Hi the Following Text Will be Displayed"];
    //Adding the URL to the facebook post value from iOS
    //    [controller addURL:[NSURL URLWithString:@"http://www.test.com"]];
    //Adding the Text to the facebook post value from iOS
    [controller addImage:[UIImage imageNamed:@"DummyImage1.png"]];
    [self presentViewController:controller animated:YES completion:nil];
    
}

#pragma mark - Collection View DataSources
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if(arr_ChooseScavs.count!=10){
        return arr_ChooseScavs.count+1;
    }else{
        return 10;
        
    }
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //    [obj_collectionViewXaccly registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"XacclySubViewCell"];

    static NSString *identifier = @"ChooseScavCell";
    CC_HostChooseScav *cell = (CC_HostChooseScav *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    // Initilizing the Buttons
    cell.btn_CC_ChooseScav.tag=indexPath.row;
    [cell.btn_CC_ChooseScav addTarget:self action:@selector(chooseScav:) forControlEvents:UIControlEventTouchUpInside];
    
    if(indexPath.row+1<=arr_ChooseScavs.count){
        [cell.btn_CC_ChooseScav setImage:[UIImage imageWithContentsOfFile:[arr_ChooseScavs objectAtIndex:indexPath.row]] forState:UIControlStateNormal];
    }else{
        [cell.btn_CC_ChooseScav setImage:[UIImage imageNamed:@"plusSign.png"] forState:UIControlStateNormal];
    }
        
    
    return cell;
}


#pragma mark - Gallery delegate
// receiving the Images
-(void) theSelectedScavs:(NSArray *)scavs{

    if(scavs.count==0){
        return;
    }
    
    [arr_ChooseScavs removeAllObjects];
    arr_ChooseScavs = [NSMutableArray arrayWithArray: scavs];

    [(UICollectionView *)[self.view viewWithTag:1001] reloadData];
    
        [(UICollectionView *)[self.view viewWithTag:1001] scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:arr_ChooseScavs.count inSection:0] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
        
    
    
}

#pragma mark - Methods Created
// to choose the Scavs from the Gallery ; target for Cells Button
-(void) chooseScav:(UIButton *) sender{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VC_Gallery *objGalleryView = [storyBoard instantiateViewControllerWithIdentifier:@"VC_Gallery"];
    objGalleryView.s_GalleryCalledFor=1;
    objGalleryView.delegate=self;
    [self.navigationController pushViewController:objGalleryView animated:YES];
}

// To choose Friends
-(void) acn_ChooseFriends:(UIButton *) sender{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    VC_Friends *obj_VC_Friends  = [storyboard instantiateViewControllerWithIdentifier:@"VC_Friends"];
    [self.navigationController pushViewController:obj_VC_Friends animated:YES];
    
}

// TO host the Game
-(void) acn_HostGame:(UIButton *) sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your Game has been created." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
}

#pragma mark - IB Actions

- (IBAction)btnClicked_host:(UIButton *)sender {
    
    [sender setTitleColor:HIGHLIGHT_COLOR forState:UIControlStateNormal];
    [_btn_Manage setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_tbView_manage setHidden:YES];
    [_viewActive_manage setHidden:YES];
    [_tbView_host setHidden:NO];
    [_viewActive_host setHidden:NO];
}

- (IBAction)btnClicked_manage:(UIButton *)sender {
    [sender setTitleColor:HIGHLIGHT_COLOR forState:UIControlStateNormal];
    [_btn_Host setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_tbView_manage setHidden:NO];
    [_viewActive_manage setHidden:NO];
    [_tbView_host setHidden:YES];
    [_viewActive_host setHidden:YES];
}

- (IBAction)acn_Invite_Public:(UIButton *)sender {
    [sender setTitleColor:HIGHLIGHT_COLOR forState:UIControlStateNormal];
    if(sender==_btn_InviteOnly){
        [_btn_Public setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        [_btn_InviteOnly setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

@end