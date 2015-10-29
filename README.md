# FDTagsView
A view to show some tags.

# Introduction

FDTagsView is view which contains many tag content. It supports resetting it's style, like tag's backgroundcolor, tag's text color, tag's text font and so on. Hope it's helpful for you.

## Preview

![preview](https://github.com/fergusding/FDTagsView/blob/master/preview.png)

# Get started

1. Download the source file in the folder FDTagsView.
2. Add the all the source files to your project.
3. Import the FDTagsView.h file where you want to use it. Jsut add a instance of it to your view as a subview.

# Usage

## FDTagsView

- You must init it with frame and set the max height of it.

```Objective-C
FDTagsView *tagsView = [[FDTagsView alloc] initWithFrame:CGRectMake(YOU_DEFINE, YOU_DEFINE, YOU_DEFINE, YOU_MAX_HEIGHT)];
tagsView.tagTitles = @[@"华贵白金", @"自信回头", @"饮水机管理员", @"线霸", @"单身狗", @"手残党", @"背锅侠", @"专业辅助", @"匹配王", @"复仇焰魂", @"走位风骚", @"666666"];
tagsView.tagBackgroundColor = [UIColor colorWithRed:55 / 255.0 green:196 / 255.0 blue:169 / 255.0 alpha:1];
tagsView.tagTextColor = [UIColor whiteColor];
tagsView.tagFontSize = 15;
[tagsView tagSelected:^(NSString *tag) {
NSLog(@"%@", tag);
}];
[self.view addSubview:tagsView];
```

#License
MIT
