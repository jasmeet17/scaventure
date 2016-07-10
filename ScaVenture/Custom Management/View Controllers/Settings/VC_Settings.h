//
//  VC_Settings.h
//  ScaVenture
//
//  Created by ArshAulakh on 29/11/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VC_Base.h"

@interface VC_Settings : VC_Base <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tbView_settings;

@end
