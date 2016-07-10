//
//  VC_Gallery.m
//  ScaVenture
//
//  Created by Abhi on 15/01/15.
//
//

#import "VC_Gallery.h"
#import "GalleryCell.h"
#import "VC_ShowImage.h"
#import "Macro.h"

//#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size

@interface VC_Gallery ()<UIGestureRecognizerDelegate>{
    
    NSMutableArray *arr_Images;
    NSString *documentDirectrory;
    NSMutableArray *arr_IndexPaths; // To hold the Selected
    BOOL selectMultipleImages;      // to allow to selecet Multiple Images
    UIBarButtonItem *righBarButton;  // added on the Navigation bar when I haqve to show items to be deleted
}

@end

@implementation VC_Gallery

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    documentDirectrory = [paths objectAtIndex:0];
    arr_Images= [[NSMutableArray alloc] initWithArray:[self theImagesPath]];
    arr_IndexPaths = [[NSMutableArray alloc] init];
    

    // Iniitalizing the Long Press
    // attach long press gesture to collectionView
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = .5; //seconds
    lpgr.delegate = self;
    [self.otl_CollectionView addGestureRecognizer:lpgr];
    
    // Initialize the Bar Button delete

    switch (self.s_GalleryCalledFor) {
        case 0:{    // For Camera Gallery
            righBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteImage)];
        }
            break;
    
        case 1:{    //For Choose Scavs from the Host Screen
            righBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(selectTheImagesPath)];
        }
            break;
            
        case 2:{
            
        }
            break;
            
    }
    
    

    
    NSLog(@"The short Values -%d-",_s_GalleryCalledFor);
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [self configureNavBarWithCustomBackButton:YES andTitle:[NSString stringWithFormat:@"Scavs(%d)",(int)arr_Images.count]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Right Bar Buttons Action

// delete the Images, If Comes from the Gallery View
-(void) deleteImage{
    for(int i=0; i<arr_IndexPaths.count; i++){
        
        NSFileManager *fileManager = [NSFileManager defaultManager];

        NSString *filePath = [documentDirectrory stringByAppendingPathComponent:[arr_Images objectAtIndex:((NSIndexPath *)[arr_IndexPaths objectAtIndex:i]).row]];
        NSError *error;
        BOOL success = [fileManager removeItemAtPath:filePath error:&error];
        if (success) {
            [arr_Images removeObjectAtIndex:((NSIndexPath *)[arr_IndexPaths objectAtIndex:i]).row];
            NSLog(@"file deleted");

        }
        else
        {
            NSLog(@"Could not delete file -:%@ ",[error localizedDescription]);
        }
    }
    self.navigationItem.rightBarButtonItem=nil;
    [arr_IndexPaths removeAllObjects];
    [_otl_CollectionView reloadData];
    selectMultipleImages=false;
}

// Choose the selected Images to be sent to Back to the Host Screen
-(void) selectTheImagesPath{
    
    NSMutableArray *seletedImages = [[NSMutableArray alloc] init];
    
    for(int i=0; i<arr_IndexPaths.count; i++){
        [seletedImages addObject:[documentDirectrory stringByAppendingPathComponent:[arr_Images objectAtIndex:((NSIndexPath *)[arr_IndexPaths objectAtIndex:i]).row]]];
        
        NSLog(@"The name is -%@-",[documentDirectrory stringByAppendingPathComponent:[arr_Images objectAtIndex:((NSIndexPath *)[arr_IndexPaths objectAtIndex:i]).row]]);
        
    }
    
    [self.delegate performSelector:@selector(theSelectedScavs:) withObject:seletedImages];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Get Images Names
// Getting the Names of the Images Saved in the Docummnet Directory
-(NSArray *) theImagesPath{

    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *dirContents = [fm contentsOfDirectoryAtPath:documentDirectrory error:nil];
    NSPredicate *fltr = [NSPredicate predicateWithFormat:@"self ENDSWITH '.png'"];
    NSArray *onlyPNGs = [dirContents filteredArrayUsingPredicate:fltr];
    
    return onlyPNGs;
}

#pragma mark - Long Press Method
-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
        return;
    }
    CGPoint p = [gestureRecognizer locationInView:self.otl_CollectionView];
    
    NSIndexPath *indexPath = [self.otl_CollectionView indexPathForItemAtPoint:p];
    if (indexPath == nil){
        NSLog(@"couldn't find index path");
    } else {
        // get the cell at indexPath (the one you long pressed)
        selectMultipleImages=YES;
        
        if(self.navigationItem.rightBarButtonItem==nil){
            self.navigationItem.rightBarButtonItem=righBarButton;
        }
        
        GalleryCell* cell = (GalleryCell *)[self.otl_CollectionView cellForItemAtIndexPath:indexPath];
        [cell.otl_CellHighlighted setBackgroundColor:[UIColor colorWithRed:255.0 green:0.0 blue:0.0 alpha:.7f]];
        [arr_IndexPaths addObject:indexPath];
        // do stuff with the cell
    }
}

#pragma mark - Collection View Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//        return [arr_Images count];
    return [arr_Images count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((SCREEN_SIZE.width-32)/3, (SCREEN_SIZE.width-32)/3);
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"GalleryCell";
    GalleryCell *cell = (GalleryCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.otl_Cell_Image.image = [UIImage imageWithContentsOfFile:[documentDirectrory stringByAppendingPathComponent:[arr_Images objectAtIndex:indexPath.row]]];
    if([arr_IndexPaths containsObject:indexPath]){
        [cell.otl_CellHighlighted setBackgroundColor:[UIColor colorWithRed:255.0 green:0.0 blue:0.0 alpha:.7f]];
    }else{
        [cell.otl_CellHighlighted setBackgroundColor:[UIColor clearColor]];
    }
    
    return cell;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 8;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 8;
}

#pragma mark - Collection View Delegates
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if(selectMultipleImages){
        GalleryCell* cell = (GalleryCell *)[self.otl_CollectionView cellForItemAtIndexPath:indexPath];
        [cell.otl_CellHighlighted setBackgroundColor:[UIColor colorWithRed:255.0 green:0.0 blue:0.0 alpha:.7f]];
        
        [arr_IndexPaths addObject:indexPath];
        
        if(self.navigationItem.rightBarButtonItem==nil){
            self.navigationItem.rightBarButtonItem=righBarButton;
        }
    }else{
        VC_ShowImage *vc = (VC_ShowImage *)[self.storyboard instantiateViewControllerWithIdentifier:@"VC_ShowImage"];
        vc.currentIndex=indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

//#pragma mark- collection view cell paddings
//- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(0, 1.5 , 0 ,1.5 );
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
