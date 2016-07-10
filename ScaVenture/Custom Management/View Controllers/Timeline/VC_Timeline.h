//
//  VC_Timeline.h
//  ScaVenture
//
//  Created by ArshAulakh on 10/12/14.
//
//

#import "VC_Base.h"

@interface VC_Timeline : VC_Base <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tbView_timeline;

@end
