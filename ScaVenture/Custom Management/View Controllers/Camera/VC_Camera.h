//
//  VC_Camera.h
//  ScaVenture
//
//  Created by ArshAulakh on 03/12/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_Base.h"
#import <AVFoundation/AVFoundation.h>

@interface VC_Camera : VC_Base

@property(nonatomic, retain) AVCaptureStillImageOutput *stillImageOutput;


//@property (weak, nonatomic) IBOutlet UIImageView *capturedImage;

@property (weak, nonatomic) IBOutlet UIView *otl_BlueLineView;


- (IBAction)snapImage:(id)sender;
- (IBAction)switchCamera:(id)sender;
- (IBAction)switchOnFlash:(id)sender;


@end
