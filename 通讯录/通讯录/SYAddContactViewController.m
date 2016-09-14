//
//  SYAddContactViewController.m
//  通讯录
//
//  Created by 123 on 16/9/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYAddContactViewController.h"
#import "SYContact.h"

@interface SYAddContactViewController ()
/**姓名输入框*/
@property (weak, nonatomic) IBOutlet UITextField *nameField;
/**电话输入框*/
@property (weak, nonatomic) IBOutlet UITextField *telField;

@end

@implementation SYAddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)saveBtnClick {
    if ([self.delegate respondsToSelector:@selector(addContactViewController:didSaveContact:)]) {
        SYContact *contact = [[SYContact alloc] init];
        contact.name = self.nameField.text;
        contact.tel = self.telField.text;
        [self.delegate addContactViewController:self didSaveContact:contact];
    }
}

@end
