//
//  SYContactsViewController.m
//  通讯录
//
//  Created by 123 on 16/9/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYContactsViewController.h"
#import "SYContact.h"
#import "SYAddContactViewController.h"

@interface SYContactsViewController () <SYAddContactViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *contacts;

@end

@implementation SYContactsViewController

- (NSMutableArray *)contacts {
    if (!_contacts) {
        _contacts = [NSMutableArray array];
    }
    return _contacts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"%@的联系人", self.name];
}

- (IBAction)logoutBtnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - table view 数据源方法
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseID = @"ContactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    SYContact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.tel;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id destVc = segue.destinationViewController;
    if ([destVc isKindOfClass:[SYAddContactViewController class]]) {
        SYAddContactViewController *addContactVc = destVc;
        addContactVc.delegate = self;
    }
}

#pragma mark - SYAddContactViewController 代理方法
- (void)addContactViewController:(SYAddContactViewController *)addContactVc didSaveContact:(SYContact *)contact {
    [self.contacts addObject:contact];
    //局部刷新
    NSIndexPath *lastpath = [NSIndexPath indexPathForRow:self.contacts.count - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[lastpath] withRowAnimation:UITableViewRowAnimationFade];
    //添加完毕后隐藏添加页面
    [self.navigationController popViewControllerAnimated:YES];
}

@end
