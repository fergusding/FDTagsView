//
//  FDTagsView.m
//  FDTagsViewDemo
//
//  Created by fergusding on 15/10/28.
//  Copyright © 2015年 fergusding. All rights reserved.
//

#define HorizonMargin 10
#define VerticalMargin 10
#define MaxCollectionViewHeight [UIScreen mainScreen].bounds.size.height

#import "FDTagsView.h"
#import "FDTagsViewCell.h"
#import "FDTagsViewFlowLayout.h"

@interface FDTagsView () <UICollectionViewDataSource, UICollectionViewDelegate, FDTagsViewFlowLayoutDelegate>

@property (assign, nonatomic) FDTagsViewStyle style;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;

@end

static NSString *ReuseIdentifier = @"TagsViewCell";
static CGFloat MaxTagWidth;

@implementation FDTagsView

#pragma mark - Lifecircle

- (instancetype)initWithFrame:(CGRect)frame style:(FDTagsViewStyle)style {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.style = style;
        self.tagBgColor = [UIColor lightGrayColor];
        self.tagTextColor = [UIColor blackColor];
        self.tagFontSize = 15;
        
        if (style != FDTagsViewStyleNormal) {
            self.tagSelectedBgColor = self.tagBgColor;
            self.tagSelectedTextColor = self.tagTextColor;
        }
        
        [self initView];
    }
    
    return self;
}

#pragma mark - Custom Accessors

- (void)setTagTitles:(NSArray *)tagTitles {
    _tagTitles = tagTitles;
    [self.collectionView reloadData];
}

- (void)setSelectedIndexPath:(NSIndexPath *)selectedIndexPath {
    if (_selectedIndexPath == selectedIndexPath) {
        return;
    }
    
    FDTagsViewCell *oldSelectedCell = (FDTagsViewCell *)[self.collectionView cellForItemAtIndexPath:_selectedIndexPath];
    oldSelectedCell.tagBgColor = self.tagBgColor;
    oldSelectedCell.tagTextColor = self.tagTextColor;
    
    FDTagsViewCell *newSelectedCell = (FDTagsViewCell *)[self.collectionView cellForItemAtIndexPath:selectedIndexPath];
    newSelectedCell.tagBgColor = self.tagSelectedBgColor;
    newSelectedCell.tagTextColor = self.tagSelectedTextColor;
    
    _selectedIndexPath = selectedIndexPath;
}

#pragma mark - Private

- (void)initView {
    FDTagsViewFlowLayout *layout = [[FDTagsViewFlowLayout alloc] init];
    layout.delegate = self;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, MaxCollectionViewHeight) collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.scrollEnabled = NO;
    [self.collectionView registerClass:[FDTagsViewCell class] forCellWithReuseIdentifier:ReuseIdentifier];
    [self addSubview:self.collectionView];
    
    MaxTagWidth = self.collectionView.frame.size.width - HorizonMargin * 2;
}

// Reset the tagsView height according to tags
- (void)resetTagsViewHeight:(CGFloat)height {
    CGRect rect = self.collectionView.frame;
    rect.size.height = height;
    self.collectionView.frame = rect;
    rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.tagTitles count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FDTagsViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier forIndexPath:indexPath];
    cell.tagTitle = self.tagTitles[indexPath.row];
    cell.tagBgColor = self.tagBgColor;
    cell.tagTextColor = self.tagTextColor;
    cell.tagFontSize = self.tagFontSize;
    
    if (indexPath.row == [self.tagTitles count] - 1) {
        // Change the height of tags view
        CGFloat height = MIN(CGRectGetMaxY(cell.frame) + VerticalMargin, MaxCollectionViewHeight);
        [self resetTagsViewHeight:height];
        
        // Normal tags view doesn't need to set selectedIndexPath
        if (self.style != FDTagsViewStyleNormal) {
            self.selectedIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        }
    }
    
    return cell;
}

#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.style == FDTagsViewStyleNormal) {  // Needn't to deal the tag's click event when style is normal
        return;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tagsView:tagSelectedAtIndex:)]) {
        [self.delegate tagsView:self tagSelectedAtIndex:indexPath.row];
        
        self.selectedIndexPath = indexPath;
    }
}

#pragma mark - FDTagsViewLayoutDelegate

- (CGSize)sizeForTagAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:self.tagFontSize]};
    CGSize size = [self.tagTitles[indexPath.row] sizeWithAttributes:attributes];
    size.height += VerticalPadding * 2;
    size.width = size.width + HorizonPadding * 2 > MaxTagWidth ? MaxTagWidth : size.width + HorizonPadding * 2;
    return size;
}

@end
