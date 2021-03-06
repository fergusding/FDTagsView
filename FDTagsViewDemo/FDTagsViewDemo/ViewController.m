//
//  ViewController.m
//  FDTagsViewDemo
//
//  Created by fergusding on 15/10/28.
//  Copyright © 2015年 fergusding. All rights reserved.
//

#import "ViewController.h"
#import "FDTagsView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FDTagsView *tagsView = [[FDTagsView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0) style:FDTagsViewStyleNormal];
    tagsView.tagTitles = @[@"华贵白金", @"自信回头", @"饮水机管理员", @"线霸", @"单身狗", @"手残党", @"背锅侠", @"专业辅助", @"匹配王", @"复仇焰魂", @"走位风骚", @"666666"];
    tagsView.tagBgColor = [UIColor colorWithRed:230 / 255.0 green:230 / 255.0 blue:230 / 255.0 alpha:1];
    tagsView.tagTextColor = [UIColor colorWithRed:136 / 255.0 green:136 / 255.0 blue:136 / 255.0 alpha:1.0];
    tagsView.tagFontSize = 15;
    tagsView.backgroundColor = [UIColor colorWithRed:245 / 255.0 green:245 / 255.0 blue:245 / 255.0 alpha:1.0];
    [self.view addSubview:tagsView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
