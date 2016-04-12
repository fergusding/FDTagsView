# FDTagsView
A view to show some tags.

# Introduction

FDTagsView is view which contains many tag content. You can define two kinds of TagsView by different style, normal and switch. Normal supports resetting it's style, like tag's backgroundcolor, tag's text color, tag's text font. Besides, Switch also supports setting the selected item background color and text font, you can add the deal of the event that every item was clicked, too. Hope it's helpful for you.

## Preview

![normal_preview](https://github.com/fergusding/FDTagsView/blob/master/normal_preview.png)
![switch_preview](https://github.com/fergusding/FDTagsView/blob/master/switch_preview.png)

# Get started

1. Download the source file in the folder FDTagsView.
2. Add the all the source files to your project.
3. Import the FDTagsView.h file where you want to use it. Jsut add a instance of it to your view as a subview.

# Usage

## FDTagsView

- You must init it with frame and it will adapt itself's height automaticly.

## Normal

```Objective-C
	FDTagsView *tagsView = [[FDTagsView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0) style:FDTagsViewStyleNormal];
    tagsView.tagTitles = @[@"华贵白金", @"自信回头", @"饮水机管理员", @"线霸", @"单身狗", @"手残党", @"背锅侠", @"专业辅助", @"匹配王", @"复仇焰魂", @"走位风骚", @"666666"];
    tagsView.tagBgColor = [UIColor colorWithRed:230 / 255.0 green:230 / 255.0 blue:230 / 255.0 alpha:1];
    tagsView.tagTextColor = [UIColor colorWithRed:136 / 255.0 green:136 / 255.0 blue:136 / 255.0 alpha:1.0];
    tagsView.tagFontSize = 15;
    tagsView.backgroundColor = [UIColor colorWithRed:245 / 255.0 green:245 / 255.0 blue:245 / 255.0 alpha:1.0];
    [self.view addSubview:tagsView];
```

## Switch

```Objective-C
	FDTagsView *tagsView = [[FDTagsView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0) style:FDTagsViewStyleSwitch];
    tagsView.delegate = self;
    tagsView.tagTitles = @[@"华贵白金", @"自信回头", @"饮水机管理员", @"线霸", @"单身狗", @"手残党", @"背锅侠", @"专业辅助", @"匹配王", @"复仇焰魂", @"走位风骚", @"666666"];
    tagsView.tagBgColor = [UIColor colorWithRed:230 / 255.0 green:230 / 255.0 blue:230 / 255.0 alpha:1];
    tagsView.tagTextColor = [UIColor colorWithRed:136 / 255.0 green:136 / 255.0 blue:136 / 255.0 alpha:1.0];
    tagsView.tagFontSize = 15;
    tagsView.tagSelectedBgColor = [UIColor orangeColor];
    tagsView.tagSelectedTextColor = [UIColor whiteColor];
    tagsView.backgroundColor = [UIColor colorWithRed:245 / 255.0 green:245 / 255.0 blue:245 / 255.0 alpha:1.0];
    [self.view addSubview:tagsView];
```

#License
MIT
