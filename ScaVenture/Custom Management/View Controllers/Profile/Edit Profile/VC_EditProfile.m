//
//  VC_EditProfile.m
//  ScaVenture
//
//  Created by ArshAulakh on 03/12/14.
//  Copyright (c) 2014 Intelligente Corporation. All rights reserved.
//

#import "VC_EditProfile.h"

@interface VC_EditProfile ()<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    UIImagePickerController *objectImagePicker;
    BOOL bool_Change_Cover_or_Profile; // Bool to check which Image to be Changed YES=COVRE ; NO=PROFILE
 
}

@end

@implementation VC_EditProfile

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Initial Setup
    _imv_EditProfileImage.layer.cornerRadius=58.0f;
    _imv_EditProfileImage.layer.borderWidth=2.0f;
    _imv_EditProfileImage.layer.borderColor=[UIColor whiteColor].CGColor;
    
    // Do any additional setup after loading the view.
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

#pragma mark - Table DataSources

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            return 44;
            break;
        case 1:
            return 130;
            break;
        case 2:
            return 270;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    switch (indexPath.row) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_name"];
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_about"];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"cell_private"];
            break;
        default:
            break;
    }
    return cell;
}

#pragma mark- action sheet delegats
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (actionSheet.tag)
    {
        case 1: // for setting Image View
        {
            if(objectImagePicker==nil)
            {
                objectImagePicker=[[UIImagePickerController alloc] init];
                objectImagePicker.delegate=self;
                objectImagePicker.allowsEditing=YES;
            }
            
            if(buttonIndex==0) // FOR CAMERA
            {
                if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
                {
                    [self showTheAlert:@"Camera is not available."];
                }
                else
                {
                    objectImagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                    [self presentViewController:objectImagePicker animated:YES completion:NULL];
                }
                
            }
            else if(buttonIndex==1)  // FOR LIBRARY
            {
                objectImagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:objectImagePicker animated:YES completion:NULL];
            }
            
            
        }
            break;
            
        case 2:
        {
            if(buttonIndex!=2)
            {
                [(UITextField *)[self.view viewWithTag:11] setText:[actionSheet buttonTitleAtIndex:buttonIndex]];
            }
            
            NSLog(@"the --%ld-",(long)buttonIndex);
        }
            break;
            
            
    }
}

#pragma mark    - Short Methods
// Creating the Action Sheet
-(void) actionSheetTitle:(NSString *) title delegate:(id) delegate  button1:(NSString *) button1 button2:(NSString *) button2 tag:(short) tag
{
    
    UIActionSheet *action= [[UIActionSheet alloc] initWithTitle:title delegate:delegate cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:button1,button2, nil];
    action.tag=tag;
    [action showInView:self.view];
    
}

// Creating the Alert View
-(void) showTheAlert:(NSString *) message
{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:message message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark- Image Picker View Delegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
    [NSThread detachNewThreadSelector:@selector(useImage:) toTarget:self withObject:info[UIImagePickerControllerEditedImage]];
    
}

- (void)useImage:(UIImage *)image {
    @autoreleasepool
    {
        // Create a graphics image context
        CGSize newSize;
        if(bool_Change_Cover_or_Profile){
            newSize = CGSizeMake(CGRectGetWidth(_imv_CoverPhoto.frame), CGRectGetHeight(_imv_CoverPhoto.frame));
        }else{
            newSize = CGSizeMake(CGRectGetWidth(_imv_EditProfileImage.frame), CGRectGetHeight(_imv_EditProfileImage.frame));
        }
        UIGraphicsBeginImageContext(newSize);
        // Tell the old image to draw in this new context, with the desired
        // new size
        [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
        // Get the new image from the context
        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
        // End the context
        UIGraphicsEndImageContext();
        
        if(bool_Change_Cover_or_Profile){
            _imv_CoverPhoto.image=newImage;
        }else{
            _imv_EditProfileImage.image=newImage;
        }
        
    }
}


#pragma mark - IBAction

- (IBAction)btnClicked_back:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)editCoverPhoto:(id)sender {
    bool_Change_Cover_or_Profile=YES;
    [self actionSheetTitle:nil delegate:self button1:@"Camera" button2:@"Library" tag:1];
}

- (IBAction)editProfilePic:(id)sender {
    bool_Change_Cover_or_Profile=NO;
    [self actionSheetTitle:nil delegate:self button1:@"Camera" button2:@"Library" tag:1];
}

- (IBAction)btn_ChangeName:(id)sender {
}

- (IBAction)btn_ChangeAbout:(id)sender {
}

- (IBAction)btn_EditProfile:(id)sender {
}

@end
