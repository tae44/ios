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
#import "SYEditContactViewController.h"

@interface SYContactsViewController () <SYAddContactViewControllerDelegate,SYEditContactViewControllerDelegate>
/**存有联系人模型的数组*/
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
    //获取跳转目标
    id destVc = segue.destinationViewController;
    //判断目标输入哪个controller
    if ([destVc isKindOfClass:[SYAddContactViewController class]]) {
        SYAddContactViewController *addContactVc = destVc;
        addContactVc.delegate = self;
    } else if ([destVc isKindOfClass:[SYEditContactViewController class]]) {
        SYEditContactViewController *editContactVc = destVc;
        NSInteger row = self.tableView.indexPathForSelectedRow.row;
        SYContact *contact = self.contacts[row];
        editContactVc.contact = contact;
        editContactVc.delegate = self;
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

#pragma mark - SYEditContactViewController 代理方法
- (void)SYEditContactViewController:(SYEditContactViewController *)editContactVc didFinishedSaveContact:(SYContact *)contact {
    NSInteger row = [self.contacts indexOfObject:contact];
    NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
