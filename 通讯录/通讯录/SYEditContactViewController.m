//
//  SYEditContactViewController.m
//  通讯录
//
//  Created by jason on 16/9/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYEditContactViewController.h"
#import "SYContact.h"

@interface SYEditContactViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *telField;

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation SYEditContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameField.text = self.contact.name;
    self.telField.text = self.contact.tel;
}

- (IBAction)editBtnClick:(UIBarButtonItem *)sender {
    self.nameField.enabled = !self.nameField.enabled;
    self.telField.enabled = !self.telField.enabled;
    self.saveBtn.hidden = !self.saveBtn.hidden;
    if (self.nameField.enabled) {
        sender.title = @"取消";
    } else {
        sender.title = @"编辑";
    }
}

- (IBAction)saveContactBtnClick {
    if ([self.delegate respondsToSelector:@selector(SYEditContactViewController:didFinishedSaveContact:)]) {
        self.contact.name = self.nameField.text;
        self.contact.tel = self.telField.text;
        [self.delegate SYEditContactViewController:self didFinishedSaveContact:self.contact];
    }
}

@end
