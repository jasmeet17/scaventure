//
//  VC_Shop.h
//  ScaVenture
//
//  Created by ArshAulakh on 27/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VC_Shop : VC_Base <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tbView_hostCredits;
@property (weak, nonatomic) IBOutlet UITableView *tbView_earnPoints;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewActive_hostCredits;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewActive_earnPoints;
- (IBAction)bntClicked_hostCredits:(id)sender;
- (IBAction)btnClicked_earnPoints:(id)sender;

@end
