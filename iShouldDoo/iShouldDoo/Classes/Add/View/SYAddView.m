//
//  SYAddView.m
//  iShouldDoo
//
//  Created by jason on 2016/10/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYAddView.h"

@implementation SYAddView

+ (instancetype)addView {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    SYAddView *addView = [[SYAddView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
    // 创建nameLabel
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 85, 70, 44)];
    nameLabel.text = @"任务名称";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [addView addSubview:nameLabel];
    // 创建输入框
    UITextField *nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(120, 92, 240, 30)];
    nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    [addView addSubview:nameTextField];
    // 创建commentLabel
    UILabel *commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 220, 70, 44)];
    commentLabel.text = @"备注";
    commentLabel.textAlignment = NSTextAlignmentCenter;
    [addView addSubview:commentLabel];
    // 创建多行输入框
    UITextView *commentTextView = [[UITextView alloc] initWithFrame:CGRectMake(120, 150, 240, 200)];
    commentTextView.backgroundColor = [UIColor lightGrayColor];
    [addView addSubview:commentTextView];
    return addView;
}

- (void)createContent {
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UITextField class]]) {
            self.nameTextField = (UITextField *)view;
        } else if ([view isKindOfClass:[UITextView class]]) {
            self.commentTextField = (UITextView *)view;
        }
    }
}

@end
