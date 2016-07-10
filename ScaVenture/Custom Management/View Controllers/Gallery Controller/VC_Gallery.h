//
//  VC_Gallery.h
//  ScaVenture
//
//  Created by Abhi on 15/01/15.
//
//

#import "VC_Base.h"

@protocol sendData <NSObject>

-(void) theSelectedScavs:(NSArray *) scavs;

@end

@interface VC_Gallery : VC_Base<UICollectionViewDataSource,UICollectionViewDelegate>

//s_GalleryCalledFor == 0 for Camera
//s_GalleryCalledFor == 1 for Choose Scav from Host Team
@property short s_GalleryCalledFor;

// For Delegation
@property (weak,nonatomic) id delegate;


@property (weak, nonatomic) IBOutlet UICollectionView *otl_CollectionView;

@end
