//
//  FDTagsView.m
//  FDTagsViewDemo
//
//  Created by fergusding on 15/10/28.
//  Copyright © 2015年 fergusding. All rights reserved.
//

#define HorizonMargin 5
#define VerticalMargin 5

#import "FDTagsView.h"
#import "FDTagsViewCell.h"
#import "FDTagsViewFlowLayout.h"

@interface FDTagsView () <UICollectionViewDataSource, UICollectionViewDelegate, FDTagsViewFlowLayoutDelegate>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (copy, nonatomic) FDTagsViewSelectBlock selectedBlock;

@end

static NSString *ReuseIdentifier = @"TagsViewCell";
static CGFloat MaxTagWidth;

@implementation FDTagsView

#pragma mark - Lifecircle

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.tagBackgroundColor = [UIColor orangeColor];
        self.tagTextColor = [UIColor whiteColor];
        self.tagFontSize = 15;
        
        [self initView];
    }
    
    return self;
}

#pragma mark - Custom Accessors

- (void)setTagTitles:(NSArray *)tagTitles {
    _tagTitles = tagTitles;
    [self.collectionView reloadData];
}

#pragma mark - Private

- (void)initView {
    FDTagsViewFlowLayout *layout = [[FDTagsViewFlowLayout alloc] init];
    layout.delegate = self;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[FDTagsViewCell class] forCellWithReuseIdentifier:ReuseIdentifier];
    [self addSubview:self.collectionView];
    
    MaxTagWidth = self.collectionView.frame.size.width - HorizonMargin * 2;
}

- (void)resetTagsViewHeight:(CGFloat)height {
    CGRect rect = self.collectionView.frame;
    rect.size.height = height;
    self.collectionView.frame = rect;
    rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

#pragma mark - Public 

- (void)tagSelected:(FDTagsViewSelectBlock)block {
    self.selectedBlock = block;
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.tagTitles count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FDTagsViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier forIndexPath:indexPath];
    cell.tagTitle = self.tagTitles[indexPath.row];
    cell.tagBackgroundColor = self.tagBackgroundColor;
    cell.tagTextColor = self.tagTextColor;
    cell.tagFontSize = self.tagFontSize;
    
    if (indexPath.row == [self.tagTitles count] - 1) {
        // Change the height of tags view
        CGFloat height = self.frame.size.height >= CGRectGetMaxY(cell.frame) + VerticalMargin ? CGRectGetMaxY(cell.frame) + VerticalMargin : self.frame.size.height;
        [self resetTagsViewHeight:height];
    }
    
    return cell;
}

#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedBlock(self.tagTitles[indexPath.row]);
}

#pragma mark - FDTagsViewLayoutDelegate

- (CGSize)sizeForTagAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:self.tagFontSize]};
    CGSize size = [self.tagTitles[indexPath.row] sizeWithAttributes:attributes];
    size.height += VerticalPadding * 2;
    size.width = size.width + HorizonPadding * 2 > MaxTagWidth ? MaxTagWidth : size.width + HorizonPadding *2;
    return size;
}

@end
