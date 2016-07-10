//
//  VC_ShowImage.h
//  ScaVenture
//
//  Created by Abhi on 18/01/15.
//
//

#import "VC_Base.h"

@interface VC_ShowImage : VC_Base

@property short currentIndex;      // for the Image userWant to see
@property (weak, nonatomic) IBOutlet UIImageView *otl_ImageOnScreen;

@end
