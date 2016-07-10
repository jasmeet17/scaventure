//
//  VC_Home.h
//  ScaVenture
//
//  Created by ArshAulakh on 27/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VC_Base.h"

@interface VC_Home : VC_Base

@property (weak, nonatomic) IBOutlet UIImageView *imv_ProfileImage;


- (IBAction)btnClicked_share:(id)sender;

@end
