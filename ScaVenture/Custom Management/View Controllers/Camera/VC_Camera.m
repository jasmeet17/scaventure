//
//  VC_Camera.m
//  ScaVenture
//
//  Created by ArshAulakh on 03/12/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_Camera.h"
#import <AviarySDK/AviarySDK.h>
#import "VC_Gallery.h"

#define DegreesToRadians(x) ((x) * M_PI / 180.0)
#define kAviaryAPIKey @"7f8c1636de464526"
#define kAviarySecret @"87e9834cb3a0b3c9"


@interface VC_Camera ()<AVYPhotoEditorControllerDelegate>
{
    BOOL FrontCamera,flashIsOn;
    BOOL haveImage;
    UIView *viewTemp;
    
}

@property UIView *imagePreview;
@property UIButton *selfieButton;
@property UIButton *otl_SplashIcon;
@property UIButton *snapImage;
@property UIButton *capturedImage;
//Tells the Number of Images in cache,
@property UILabel *olt_numberCache;




@end

@implementation VC_Camera

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // InitialSetup
    
    
    // on the View , on which we will see the Image
    _imagePreview = [[UIView alloc] init];
    [_imagePreview setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:_imagePreview];
    
    // If the Phone is Iphone 4, show Selfie and Flash Icons on Navigation bar
    if(SCREEN_SIZE.height==480){
        [_imagePreview setFrame:CGRectMake(0, 2, SCREEN_SIZE.width, SCREEN_SIZE.height - 159)];
        _otl_SplashIcon = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width - 91, 6, 35, 35)];
        _selfieButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width - 46, 0, 36, 43)];
        
        [_selfieButton setImage:[UIImage imageNamed:@"frnt-back-cam-icon"] forState:UIControlStateNormal];
        [_otl_SplashIcon setImage:[UIImage imageNamed:@"flash-icon"] forState:UIControlStateNormal];
        
        
        [_imagePreview setFrame:CGRectMake(0, 2, SCREEN_SIZE.width, SCREEN_SIZE.width)];
        
        // If the Phone is other than iPhone 4, show the Selfie and flash Icons on a view above Camera Screen
        CGRect bounds = _imagePreview.frame;
        
        viewTemp = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMinX(bounds) + CGRectGetHeight(bounds), SCREEN_SIZE.width, SCREEN_SIZE.height - CGRectGetMinX(bounds) - CGRectGetHeight(bounds) - 65 )];
        [viewTemp setBackgroundColor:[UIColor clearColor]];
        
        UIImageView *imgTemp = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 2)];
        [imgTemp setBackgroundColor:HIGHLIGHT_COLOR];
        
       _snapImage = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(viewTemp.frame)/2 - 37, CGRectGetHeight(viewTemp.frame) - 80, 74, 74)];
        [_snapImage setImage:[UIImage imageNamed:@"Camera_btn.png"] forState:UIControlStateNormal];
        [_snapImage addTarget:self action:@selector(snapImage:) forControlEvents:UIControlEventTouchUpInside];
        
        
        _capturedImage = [[UIButton alloc] initWithFrame:CGRectMake(22, CGRectGetHeight(viewTemp.frame) - 74, 64, 64)];
        [_capturedImage addTarget:self action:@selector(goToGallery:) forControlEvents:UIControlEventTouchUpInside];
        
        _olt_numberCache = [[UILabel alloc] initWithFrame:CGRectMake(77, CGRectGetHeight(viewTemp.frame) - 81, 18, 18)];
        [_olt_numberCache setBackgroundColor:[UIColor orangeColor]];
        
        [viewTemp addSubview:_capturedImage];
        [viewTemp addSubview:_snapImage];
        [viewTemp addSubview:imgTemp];
        [viewTemp addSubview:_otl_SplashIcon];
        [viewTemp addSubview:_selfieButton];
        [viewTemp addSubview:_olt_numberCache];
        
        [self.view addSubview:viewTemp];


        
    }else{
        [_imagePreview setFrame:CGRectMake(0, 2, SCREEN_SIZE.width, SCREEN_SIZE.width)];
        
        // If the Phone is other than iPhone 4, show the Selfie and flash Icons on a view above Camera Screen
        CGRect bounds = _imagePreview.frame;
        
        viewTemp = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMinX(bounds) + CGRectGetHeight(bounds), SCREEN_SIZE.width, SCREEN_SIZE.height - CGRectGetMinX(bounds) - CGRectGetHeight(bounds) - 65 )];
        [viewTemp setBackgroundColor:[UIColor clearColor]];
        
        UIImageView *imgTemp = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 2)];
        [imgTemp setBackgroundColor:HIGHLIGHT_COLOR];

        UIImageView *imgTemp1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_SIZE.width, 2)];
        [imgTemp1 setBackgroundColor:HIGHLIGHT_COLOR];

    
        _otl_SplashIcon = [[UIButton alloc] initWithFrame:CGRectMake(10, 8, 35, 35)];
        _selfieButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width - 46, 3, 36, 43)];

        [_selfieButton setImage:[UIImage imageNamed:@"frnt-back-cam-icon"] forState:UIControlStateNormal];
        [_otl_SplashIcon setImage:[UIImage imageNamed:@"flash-icon"] forState:UIControlStateNormal];
        
        _snapImage = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(viewTemp.frame)/2 - 37, CGRectGetHeight(viewTemp.frame) - 80, 74, 74)];
        [_snapImage setImage:[UIImage imageNamed:@"Camera_btn.png"] forState:UIControlStateNormal];
        [_snapImage addTarget:self action:@selector(snapImage:) forControlEvents:UIControlEventTouchUpInside];
        
        
        _capturedImage = [[UIButton alloc] initWithFrame:CGRectMake(22, CGRectGetHeight(viewTemp.frame) - 74, 64, 64)];
        [_capturedImage addTarget:self action:@selector(goToGallery:) forControlEvents:UIControlEventTouchUpInside];
        
        _olt_numberCache = [[UILabel alloc] initWithFrame:CGRectMake(77, CGRectGetHeight(viewTemp.frame) - 81, 18, 18)];
        [_olt_numberCache setBackgroundColor:[UIColor orangeColor]];

        
        [viewTemp addSubview:_capturedImage];
        [viewTemp addSubview:_snapImage];
        [viewTemp addSubview:imgTemp];
        [viewTemp addSubview:imgTemp1];
        [viewTemp addSubview:_otl_SplashIcon];
        [viewTemp addSubview:_selfieButton];
        [viewTemp addSubview:_olt_numberCache];

        [self.view addSubview:viewTemp];
    }
    
    
    [_otl_SplashIcon addTarget:self action:@selector(switchOnFlash:) forControlEvents:UIControlEventTouchUpInside];
    [_selfieButton addTarget:self action:@selector(switchCamera:) forControlEvents:UIControlEventTouchUpInside];
    
    _olt_numberCache.textAlignment=NSTextAlignmentCenter;
    [_olt_numberCache setFont:[UIFont systemFontOfSize:12.0f]];
    self.olt_numberCache.clipsToBounds=YES;
    self.olt_numberCache.layer.borderColor= [UIColor whiteColor].CGColor;
    self.olt_numberCache.layer.borderWidth=1.4f;
    self.olt_numberCache.layer.cornerRadius=10.0f;
    
    
    _capturedImage.layer.borderWidth=1.8f;
    _capturedImage.layer.borderColor=[UIColor whiteColor].CGColor;
    [_capturedImage setImage:[UIImage imageWithContentsOfFile:[self theImagesPath]] forState:UIControlStateNormal];
    
    
    [self initializeCamera];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [self configureNavBarWithCustomBackButton:YES andTitle:@""];
    
    if(SCREEN_SIZE.height==480){
        [self.navigationController.navigationBar addSubview:_selfieButton];
        [self.navigationController.navigationBar addSubview:_otl_SplashIcon];
    }
}

-(void) viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:YES];
    
    if(SCREEN_SIZE.height==480){
        [_selfieButton removeFromSuperview];
        [_otl_SplashIcon removeFromSuperview];
    }
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

- (IBAction)switchOnFlash:(id)sender {
    [self turnTorchOn:flashIsOn];
}

#pragma mark- Initialization Method
//AVCaptureSession to show live video feed in view
- (void) initializeCamera {
    
    _stillImageOutput=nil;
    
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    session.sessionPreset = AVCaptureSessionPresetPhoto;
    
    
    AVCaptureVideoPreviewLayer *captureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    
    dispatch_async(dispatch_get_main_queue(), ^{
    
        captureVideoPreviewLayer.frame = self.imagePreview.bounds;
        [self.imagePreview.layer addSublayer:captureVideoPreviewLayer];
        
        [captureVideoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
        
    });
    
    
    
    UIView *view = [self imagePreview];
    CALayer *viewLayer = [view layer];
    [viewLayer setMasksToBounds:YES];
    
    CGRect bounds = [view bounds];
    [captureVideoPreviewLayer setFrame:bounds];
    
    NSArray *devices = [AVCaptureDevice devices];
    AVCaptureDevice *frontCamera;
    AVCaptureDevice *backCamera;

    for (AVCaptureDevice *device in devices) {
        
        NSLog(@"Device name: %@", [device localizedName]);
        
        if ([device hasMediaType:AVMediaTypeVideo]) {
            
            if ([device position] == AVCaptureDevicePositionBack) {
                NSLog(@"Device position : back");
                backCamera = device;
            }
            else {
                NSLog(@"Device position : front");
                frontCamera = device;
            }
        }
    }
    
    if (!FrontCamera) {
        NSError *error = nil;
        AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:backCamera error:&error];
        if (!input) {
            NSLog(@"ERROR: trying to open camera: %@", error);
        }
        [session addInput:input];
    }
    
    if (FrontCamera) {
        NSError *error = nil;
        AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:frontCamera error:&error];
        if (!input) {
            NSLog(@"ERROR: trying to open camera: %@", error);
        }
        [session addInput:input];
    }
    
    _stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys: AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [_stillImageOutput setOutputSettings:outputSettings];
    
    [session addOutput:_stillImageOutput];
    
    [session startRunning];
}



#pragma mark- Take Snap

- (IBAction)snapImage:(id)sender {
    if (!haveImage) {
        [_capturedImage setImage:nil forState:UIControlStateNormal];
        _capturedImage.hidden = NO; //show the captured image view
        [self capImage];
    }
    else {
        haveImage = NO;
    }
    
}

- (IBAction)switchCamera:(id)sender
{
    if (!FrontCamera) {
        self.selfieButton.selected=YES;
        FrontCamera = YES;
        [self initializeCamera];
    }
    else {
        self.selfieButton.selected=NO;
        FrontCamera = NO;
        [self initializeCamera];
    }
}



#pragma mark - method to capture image

- (void) capImage { //method to capture image from AVCaptureSession video feed
    
    AVCaptureConnection *videoConnection = nil;
    for (AVCaptureConnection *connection in _stillImageOutput.connections) {
        
        for (AVCaptureInputPort *port in [connection inputPorts]) {
            
            if ([[port mediaType] isEqual:AVMediaTypeVideo] ) {
                videoConnection = connection;
                break;
            }
        }
        
        if (videoConnection) {
            break;
        }
    }
    
    NSLog(@"about to request a capture from: %@", _stillImageOutput);
    [_stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler: ^(CMSampleBufferRef imageSampleBuffer, NSError *error) {
        
        if (imageSampleBuffer != NULL) {
            NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageSampleBuffer];
            [self processImage:[UIImage imageWithData:imageData]];
        }

        
    }];
}

#pragma mark-Switch on Light
- (void) turnTorchOn: (bool) on {
    
    // check if flashlight available
    Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
    if (captureDeviceClass != nil) {
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch] && [device hasFlash]){
            
            [device lockForConfiguration:nil];
            if (!flashIsOn) {
                flashIsOn = YES; //define as a variable/property if you need to know status
//                [device setTorchMode:AVCaptureTorchModeOn];
                [device setFlashMode:AVCaptureFlashModeOn];
                [_otl_SplashIcon setImage:[UIImage imageNamed:@"flash-icon-on"] forState:UIControlStateNormal];
            } else {
                flashIsOn = NO;
//                [device setTorchMode:AVCaptureTorchModeOff];
                [device setFlashMode:AVCaptureFlashModeOff];
                [_otl_SplashIcon setImage:[UIImage imageNamed:@"flash-icon"] forState:UIControlStateNormal];
            }
            [device unlockForConfiguration];
        }
    }
    
    [self alertViewMessage:(flashIsOn==YES)?@"Flash On now.":@"Flash Off now."];
}

#pragma mark - process captured image, crop, resize and rotate
- (void) processImage:(UIImage *)image { //process captured image, crop, resize and rotate
    haveImage = YES;
    
    if([UIDevice currentDevice].userInterfaceIdiom==UIUserInterfaceIdiomPad) { //Device is ipad
        // Resize image
        UIGraphicsBeginImageContext(CGSizeMake(768, 1022));
        [image drawInRect: CGRectMake(0, 0, 768, 1022)];
        UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        CGRect cropRect = CGRectMake(0, 130, 768, 768);
        CGImageRef imageRef = CGImageCreateWithImageInRect([smallImage CGImage], cropRect);
        //or use the UIImage wherever you like
        
        [_capturedImage setImage:[UIImage imageWithCGImage:imageRef] forState:UIControlStateNormal];
        CGImageRelease(imageRef);
        
    }else{ //Device is iphone
        // Resize image
        UIGraphicsBeginImageContext(CGSizeMake(320, 426));
        [image drawInRect: CGRectMake(0, 0, 320, 426)];
        UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        CGRect cropRect = CGRectMake(0, 55, 320, 320);
        CGImageRef imageRef = CGImageCreateWithImageInRect([smallImage CGImage], cropRect);
        
        [_capturedImage setImage:[UIImage imageWithCGImage:imageRef] forState:UIControlStateNormal];

        CGImageRelease(imageRef);
    }
    
    //adjust image orientation based on device orientation
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft) {
        NSLog(@"landscape left image");
        
        [UIView beginAnimations:@"rotate" context:nil];
        [UIView setAnimationDuration:0.5];
        _capturedImage.transform = CGAffineTransformMakeRotation(DegreesToRadians(-90));
        
        
        
        [UIView commitAnimations];
        
    }
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight) {
        NSLog(@"landscape right");
        
        [UIView beginAnimations:@"rotate" context:nil];
        [UIView setAnimationDuration:0.5];
        _capturedImage.transform = CGAffineTransformMakeRotation(DegreesToRadians(90));
        [UIView commitAnimations];
        
    }
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown) {
        NSLog(@"upside down");
        [UIView beginAnimations:@"rotate" context:nil];
        [UIView setAnimationDuration:0.5];
        _capturedImage.transform = CGAffineTransformMakeRotation(DegreesToRadians(180));
        [UIView commitAnimations];
        
    }
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait) {
        NSLog(@"upside upright");
        [UIView beginAnimations:@"rotate" context:nil];
        [UIView setAnimationDuration:0.5];
        _capturedImage.transform = CGAffineTransformMakeRotation(DegreesToRadians(0));
        [UIView commitAnimations];
    }
    
    [self displayEditorForImage:_capturedImage.imageView.image];
}

#pragma mark- get Last SaveImage
//this will fetch all the Images in the Document Directory, take the Last one
-(NSString *) theImagesPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSString *bundleRoot = [[NSBundle mainBundle] bundlePath];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *dirContents = [fm contentsOfDirectoryAtPath:documentsDirectory error:nil];
    NSPredicate *fltr = [NSPredicate predicateWithFormat:@"self ENDSWITH '.png'"];
    NSArray *onlyPNGs = [dirContents filteredArrayUsingPredicate:fltr];
    
    if(onlyPNGs.count==0){
        self.olt_numberCache.hidden=YES;
    }else{
        self.olt_numberCache.hidden=NO;
    }
    self.olt_numberCache.text = [NSString stringWithFormat:@"%d",(int)[onlyPNGs count]];
    
    return [documentsDirectory stringByAppendingPathComponent:[onlyPNGs lastObject]];
}

//Method to retrieve the Specifi File , not using in Scav
#pragma mark - get first Image from the Document Directory
- (UIImage*)loadImage{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:
                      @"test.png" ];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    return image;
}

#pragma mark- name the Image
-(NSString *)theNameofImage{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd_hh_mm_ss"];

    return [dateFormatter stringFromDate:[NSDate date]];
}


#pragma mark - save Image in Document Directory
- (void)saveImage: (UIImage*)image{
    if (image != nil)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString* path = [documentsDirectory stringByAppendingPathComponent:
                          [NSString stringWithFormat:@"%@.png",[self theNameofImage]]];
        NSData* data = UIImagePNGRepresentation(image);
        
        if([data writeToFile:path atomically:YES]){
            NSLog(@"the Image saved");
            self.olt_numberCache.text = [NSString stringWithFormat:@"%d",(int)[self.olt_numberCache.text integerValue] + 1];
            self.olt_numberCache.hidden=NO;

        }else{
            NSLog(@"NOT saved");
        }
        
    }
    
}

#pragma mark - goto Gallery View
-(void) goToGallery:(UIButton *) sender{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VC_Gallery *objGalleryView = [storyBoard instantiateViewControllerWithIdentifier:@"VC_Gallery"];
    [self.navigationController pushViewController:objGalleryView animated:YES];
    
}

#pragma mark- call Alert Views
-(void) alertViewMessage:(NSString *) msg{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Message" message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alert show];
    
    [self performSelector:@selector(dismiss:) withObject:alert afterDelay:1.5];
}

#pragma mark- dismiss ALertView
// method to dismiss the alertView when LOG in successfuk
-(void) dismiss:(UIAlertView *) alert{
    [alert dismissWithClickedButtonIndex:0 animated:YES];
}

#pragma mark - Calling Aviary
- (void)displayEditorForImage:(UIImage *)imageToEdit
{
    // kAviaryAPIKey and kAviarySecret are developer defined
    // and contain your API key and secret respectively
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [AVYPhotoEditorController setAPIKey:kAviaryAPIKey secret:kAviarySecret];
    });
    
    AVYPhotoEditorController *editorController = [[AVYPhotoEditorController alloc] initWithImage:imageToEdit];
    [editorController setDelegate:self];
    [self presentViewController:editorController animated:YES completion:nil];
}

#pragma mark - AVIARY SDK DELEGATES

- (void)photoEditor:(AVYPhotoEditorController *)editor finishedWithImage:(UIImage *)image
{
    // Handle the result image here
    [editor dismissViewControllerAnimated:YES completion:nil];
    [self saveImage:image];
    _capturedImage.imageView.image=nil;
    [_capturedImage setImage:image forState:UIControlStateNormal];


}

- (void)photoEditorCanceled:(AVYPhotoEditorController *)editor
{
    // Handle cancellation here
    [editor dismissViewControllerAnimated:YES completion:nil];
    [_capturedImage setImage:[UIImage imageWithContentsOfFile:[self theImagesPath]] forState:UIControlStateNormal];
    
}

@end
