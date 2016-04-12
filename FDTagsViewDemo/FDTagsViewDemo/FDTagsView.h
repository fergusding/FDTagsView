//
//  FDTagsView.h
//  FDTagsViewDemo
//
//  Created by fergusding on 15/10/28.
//  Copyright © 2015年 fergusding. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, FDTagsViewStyle) {
    FDTagsViewStyleNormal,
    FDTagsViewStyleSwitch,
};

@protocol FDTagsViewDelegate;

@interface FDTagsView : UIView

@property (copy, nonatomic) NSArray *tagTitles;                 // Tags content
@property (strong, nonatomic) UIColor *tagBgColor;      // Tag's background color
@property (strong, nonatomic) UIColor *tagTextColor;            // Tag's text color
@property (assign, nonatomic) CGFloat tagFontSize;              // Tag's text font size
@property (strong, nonatomic) UIColor *tagSelectedBgColor;      // Selected tag's background color
@property (strong, nonatomic) UIColor *tagSelectedTextColor;    // Selected tag's text color
@property (weak, nonatomic) id<FDTagsViewDelegate> delegate;    // TagViews' delegate

- (instancetype)initWithFrame:(CGRect)frame style:(FDTagsViewStyle)style;

@end

@protocol FDTagsViewDelegate <NSObject>

@optional
- (void)tagsView:(FDTagsView *)tagsView tagSelectedAtIndex:(NSInteger)index;

@end
