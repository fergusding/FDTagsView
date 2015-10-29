//
//  FDTagsView.h
//  FDTagsViewDemo
//
//  Created by fergusding on 15/10/28.
//  Copyright © 2015年 fergusding. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FDTagsViewSelectBlock)(NSString *tag);

@interface FDTagsView : UIView

// Tags content
@property (copy, nonatomic) NSArray *tagTitles;

// Tag's background color
@property (strong, nonatomic) UIColor *tagBackgroundColor;

// Tag's text color
@property (strong, nonatomic) UIColor *tagTextColor;

// Tag's text font size
@property (assign, nonatomic) CGFloat tagFontSize;

- (void)tagSelected:(FDTagsViewSelectBlock)block;

@end
