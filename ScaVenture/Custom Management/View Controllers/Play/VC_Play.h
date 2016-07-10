//
//  VC_Play.h
//  ScaVenture
//
//  Created by ArshAulakh on 03/12/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_Base.h"
#import <QuartzCore/QuartzCore.h>

@interface VC_Play : VC_Base


// UnderLine Between Game, Invite, public Buttons
@property (weak, nonatomic) IBOutlet UIView *viewOutline1;
@property (weak, nonatomic) IBOutlet UIView *viewOutline2;
@property (weak, nonatomic) IBOutlet UIView *viewOutline3;

@property (weak, nonatomic) IBOutlet UIButton *btn_Game;
@property (weak, nonatomic) IBOutlet UIButton *btn_Invites;

@property (weak, nonatomic) IBOutlet UIView *view_game;
@property (weak, nonatomic) IBOutlet UIScrollView *scrView_game;
@property (weak, nonatomic) IBOutlet UITableView *tbView_game;


@property (weak, nonatomic) IBOutlet UIView *otl_Indicator;
@property (weak, nonatomic) IBOutlet UIView *otl_ViewGame;




- (IBAction)acn_Game_Invite:(id)sender;

@end
