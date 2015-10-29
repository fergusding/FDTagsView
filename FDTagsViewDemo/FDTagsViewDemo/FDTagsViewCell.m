//
//  FDTagsViewCell.m
//  FDTagsViewDemo
//
//  Created by fergusding on 15/10/28.
//  Copyright © 2015年 fergusding. All rights reserved.
//

#import "FDTagsViewCell.h"

@interface FDTagsViewCell ()

@property (strong, nonatomic) UILabel *tagLabel;

@end

@implementation FDTagsViewCell

#pragma mark - Custom Accessors

- (UILabel *)tagLabel {
    if (!_tagLabel) {
        _tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(HorizonPadding, VerticalPadding, self.frame.size.width - HorizonPadding * 2, self.frame.size.height - VerticalPadding * 2)];
        _tagLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_tagLabel];
        self.layer.cornerRadius = self.frame.size.height / 2;
    }
    
    return _tagLabel;
}

- (void)setTagTitle:(NSString *)tagTitle {
    _tagTitle = tagTitle;
    self.tagLabel.text = _tagTitle;
}

- (void)setTagBackgroundColor:(UIColor *)tagBackgroundColor {
    self.backgroundColor = tagBackgroundColor;
}

- (void)setTagTextColor:(UIColor *)tagTextColor {
    self.tagLabel.textColor = tagTextColor;
}

- (void)setTagFontSize:(CGFloat)tagFontSize {
    self.tagLabel.font = [UIFont systemFontOfSize:tagFontSize];
}

@end
