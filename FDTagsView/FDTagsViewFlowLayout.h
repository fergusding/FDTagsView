//
//  FDTagsViewFlowLayout.h
//  FDTagsViewDemo
//
//  Created by fergusding on 15/10/28.
//  Copyright © 2015年 fergusding. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FDTagsViewFlowLayoutDelegate;

@interface FDTagsViewFlowLayout : UICollectionViewFlowLayout

@property (weak, nonatomic) id<FDTagsViewFlowLayoutDelegate> delegate;

@end

@protocol FDTagsViewFlowLayoutDelegate <NSObject>

- (CGSize)sizeForTagAtIndexPath:(NSIndexPath *)indexPath;

@end
