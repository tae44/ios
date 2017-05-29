//
//  SYEditViewController.m
//  iShouldDoo
//
//  Created by jason on 2016/10/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYEditViewController.h"
#import "SYEditView.h"
#import "SYMission.h"

@interface SYEditViewController ()

@property (weak, nonatomic) UITextField *nameTextField;

@property (weak, nonatomic) UITextView *commentTextField;
/**保存按钮*/
@property (weak, nonatomic) UIButton *saveBtn;

@end

@implementation SYEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"编辑任务";
    // 添加自定义的view
    SYEditView *editView = [SYEditView editView];
    [self.view addSubview:editView];
    [editView createContent];
    // 添加右侧编辑按钮
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editBtnClick:)];
    self.navigationItem.rightBarButtonItem = editItem;
    // 窗口加载时加载模型数据
    editView.nameTextField.text = self.mission.name;
    self.nameTextField = editView.nameTextField;
    editView.commentTextField.text = self.mission.comment;
    self.commentTextField = editView.commentTextField;
    self.saveBtn = editView.saveBtn;
}

/**
 点击编辑按钮
 */
- (void)editBtnClick:(UIBarButtonItem *)sender {
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
- (void)savwBtnClick {
    if ([self.delegate respondsToSelector:@selector(editViewDidClickedAddBtn:missionModel:)]) {
        self.mission.name = self.nameTextField.text;
        self.mission.comment = self.commentTextField.text;
        [self.delegate editViewDidClickedAddBtn:self missionModel:self.mission];
    }
}

//- (void)nameTextChanged {
//    if (self.nameTextField.text.length == 0) {
//        self.saveBtn.enabled = NO;
//    } else {
//        self.saveBtn.enabled = YES;
//    }
//}

@end
