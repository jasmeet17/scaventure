//
//  VC_ShowImage.m
//  ScaVenture
//
//  Created by Abhi on 18/01/15.
//
//

#import "VC_ShowImage.h"

@interface VC_ShowImage ()
{
    NSArray *arr_Images;
    NSString *documentDirectrory;
    
}

@end

@implementation VC_ShowImage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Getting the Document Directory path and png files Names.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    documentDirectrory = [paths objectAtIndex:0];
    arr_Images= [self theImagess];
    
    //Setting the Image
    self.otl_ImageOnScreen.image = [UIImage imageWithContentsOfFile:[documentDirectrory stringByAppendingPathComponent:[arr_Images objectAtIndex:_currentIndex]]];
    
    
    // Swipe Left
    
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    // SwipeRight
    
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [self configureNavBarWithCustomBackButton:YES andTitle:[NSString stringWithFormat:@"%d out of %d",_currentIndex+1,arr_Images.count]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Swipe Gestures
-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    self.otl_ImageOnScreen.image = [UIImage imageWithContentsOfFile:[documentDirectrory stringByAppendingPathComponent:[arr_Images objectAtIndex:(arr_Images.count>_currentIndex+1)?++_currentIndex:arr_Images.count-1]]];
    [self.navigationItem setTitle:[NSString stringWithFormat:@"%d out of %d",_currentIndex+1,arr_Images.count]];
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    self.otl_ImageOnScreen.image = [UIImage imageWithContentsOfFile:[documentDirectrory stringByAppendingPathComponent:[arr_Images objectAtIndex:(_currentIndex>0)?--_currentIndex:0]]];
    [self.navigationItem setTitle:[NSString stringWithFormat:@"%d out of %d",_currentIndex+1,arr_Images.count]];
}

#pragma mark - Get Images Names
// Getting the Names of the Images Saved in the Docummnet Directory
-(NSArray *) theImagess{
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *dirContents = [fm contentsOfDirectoryAtPath:documentDirectrory error:nil];
    NSPredicate *fltr = [NSPredicate predicateWithFormat:@"self ENDSWITH '.png'"];
    NSArray *onlyPNGs = [dirContents filteredArrayUsingPredicate:fltr];
    
    return onlyPNGs;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
