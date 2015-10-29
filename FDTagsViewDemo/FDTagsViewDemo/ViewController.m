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
    
    FDTagsView *tagsView = [[FDTagsView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 300)];
    tagsView.tagTitles = @[@"华贵白金", @"自信回头", @"饮水机管理员", @"线霸", @"单身狗", @"手残党", @"背锅侠", @"专业辅助", @"匹配王", @"复仇焰魂", @"走位风骚", @"666666"];
    tagsView.tagBackgroundColor = [UIColor colorWithRed:55 / 255.0 green:196 / 255.0 blue:169 / 255.0 alpha:1];
    tagsView.tagTextColor = [UIColor whiteColor];
    tagsView.tagFontSize = 15;
    [tagsView tagSelected:^(NSString *tag) {
        NSLog(@"%@", tag);
    }];
    [self.view addSubview:tagsView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
