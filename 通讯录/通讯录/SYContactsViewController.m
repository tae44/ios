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

@property (nonatomic, copy) NSString *dataPath;

@end

@implementation SYContactsViewController

- (NSString *)dataPath {
    if (!_dataPath) {
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        _dataPath = [doc stringByAppendingPathComponent:@"data.archiver"];
    }
    return _dataPath;
}

- (NSMutableArray *)contacts {
    if (!_contacts) {
        //先从沙盒中读取数据,如果为空则新建立数据
        _contacts = [NSKeyedUnarchiver unarchiveObjectWithFile:self.dataPath];
        if (!_contacts) {
            _contacts = [NSMutableArray array];
        }
    }
    return _contacts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"%@的联系人", self.name];
}

/**
 点击注销时返回登录界面
 */
- (IBAction)logoutBtnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 设置tableView的编辑属性
 */
- (IBAction)delete {
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

#pragma mark 返回表格的 "编辑" 状态
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //当编辑按钮为删除时
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contacts removeObjectAtIndex:indexPath.row];
        NSIndexPath *index = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        [self.tableView deleteRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
        [NSKeyedArchiver archiveRootObject:self.contacts toFile:self.dataPath];
    //当编辑按钮为增加时
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        SYContact *contact = [[SYContact alloc] init];
        contact.name = @"中国移动";
        contact.tel = @"10086";
        [self.contacts insertObject:contact atIndex:indexPath.row + 1];
        NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
        [NSKeyedArchiver archiveRootObject:self.contacts toFile:self.dataPath];
    }
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
    //保存数据到沙盒
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:self.dataPath];
}

#pragma mark - SYEditContactViewController 代理方法
- (void)SYEditContactViewController:(SYEditContactViewController *)editContactVc didFinishedSaveContact:(SYContact *)contact {
    NSInteger row = [self.contacts indexOfObject:contact];
    NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
    [NSKeyedArchiver archiveRootObject:self.contacts toFile:self.dataPath];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
