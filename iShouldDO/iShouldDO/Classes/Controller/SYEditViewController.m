//
//  SYEditViewController.m
//  iShouldDO
//
//  Created by jason on 2016/9/27.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYEditViewController.h"
#import "SYMission.h"

@interface SYEditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextView *commentTextField;
/**保存按钮*/
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation SYEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 窗口加载时加载模型数据
    self.nameTextField.text = self.mission.name;
    self.commentTextField.text = self.mission.comment;
}

/**
 点击编辑按钮
 */
- (IBAction)editBtnClick:(UIBarButtonItem *)sender {
    // 转换输入框的可编辑性
    self.nameTextField.enabled = !self.nameTextField.enabled;
    self.commentTextField.editable = !self.commentTextField.editable;
    self.saveBtn.hidden = !self.saveBtn.hidden;
    // 改变字体提示
    if (self.nameTextField.enabled) {
        sender.title = @"取消";
    } else {
        sender.title = @"编辑";
    }
}

/**
 点击保存按钮
 */
- (IBAction)savwBtnClick {
    if ([self.delegate respondsToSelector:@selector(editViewDidClickedAddBtn:missionModel:)]) {
        self.mission.name = self.nameTextField.text;
        self.mission.comment = self.commentTextField.text;
        [self.delegate editViewDidClickedAddBtn:self missionModel:self.mission];
    }
}

- (IBAction)nameTextChanged {
    if (self.nameTextField.text.length == 0) {
        self.saveBtn.enabled = NO;
    } else {
        self.saveBtn.enabled = YES;
    }
}

@end
