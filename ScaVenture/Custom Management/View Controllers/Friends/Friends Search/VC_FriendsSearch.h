//
//  VC_FriendsSearch.h
//  ScaVenture
//
//  Created by ArshAulakh on 04/12/14.
//
//

#import "VC_Base.h"

@interface VC_FriendsSearch : VC_Base <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btn_friendRequests;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar_friends;
@end
