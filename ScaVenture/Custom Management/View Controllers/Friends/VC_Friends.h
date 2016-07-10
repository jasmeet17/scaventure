//
//  VC_Friends.h
//  ScaVenture
//
//  Created by ArshAulakh on 03/12/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_Base.h"
#import "tbCell_following.h"
#import "VC_FriendsSearch.h"

@interface VC_Friends : VC_Base {
    NSArray *arr_names;
    NSArray *arr_status;
    NSMutableDictionary *sections;
}

@property (weak, nonatomic) IBOutlet UITableView *tbView_following;
@end
