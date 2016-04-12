//
//  FDTagsViewFlowLayout.m
//  FDTagsViewDemo
//
//  Created by fergusding on 15/10/28.
//  Copyright © 2015年 fergusding. All rights reserved.
//

#define DefaultSpace 10

#import "FDTagsViewFlowLayout.h"

@implementation FDTagsViewFlowLayout

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGRect rect = CGRectZero;
    CGPoint point = CGPointZero;
    CGSize size = [self.delegate sizeForTagAtIndexPath:indexPath];
    
    // Create the frame of every cell by caculating
    if (indexPath.item == 0) {
        point = CGPointMake(DefaultSpace, DefaultSpace);
    } else {
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:indexPath.item - 1 inSection:0]];
        if ((attribute.frame.origin.x) + (attribute.size.width) + DefaultSpace + size.width > self.collectionView.frame.size.width ) {
            point = CGPointMake(DefaultSpace, (attribute.frame.origin.y) + (attribute.size.height) + DefaultSpace);
        } else {
            point = CGPointMake((attribute.frame.origin.x) + (attribute.size.width) + DefaultSpace, (attribute.frame.origin.y));
        }
    }
    
    rect.origin = point;
    rect.size = size;
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.frame = rect;
    return attributes;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributeses = [NSMutableArray array];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i < count; i++) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [attributeses addObject:attributes];
    }
    
    return attributeses;
}

@end
