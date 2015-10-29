//
//  FDTagsViewCell.h
//  FDTagsViewDemo
//
//  Created by fergusding on 15/10/28.
//  Copyright © 2015年 fergusding. All rights reserved.
//

#define HorizonPadding 10
#define VerticalPadding 5

#import <UIKit/UIKit.h>

@interface FDTagsViewCell : UICollectionViewCell

@property (copy, nonatomic) NSString *tagTitle;
@property (strong, nonatomic) UIColor *tagBackgroundColor;
@property (strong, nonatomic) UIColor *tagTextColor;
@property (assign, nonatomic) CGFloat tagFontSize;

@end
