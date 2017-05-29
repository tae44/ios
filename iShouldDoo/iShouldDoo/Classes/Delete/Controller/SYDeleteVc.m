//
//  SYDeleteVc.m
//  iShouldDoo
//
//  Created by jason on 2016/10/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYDeleteVc.h"

@interface SYDeleteVc ()

@property (nonatomic, weak) UIBarButtonItem *deleteItem;

@end

@implementation SYDeleteVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"已删除任务";
    // 添加右侧删除按钮
    UIBarButtonItem *deleteItem = [[UIBarButtonItem alloc] initWithTitle:@"全部删除" style:UIBarStyleDefault target:self action:@selector(deleteAllData)];
    self.navigationItem.rightBarButtonItem = deleteItem;
    self.deleteItem = deleteItem;
}

/**
 删除所有数据
 */
- (void)deleteAllData {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"删除文件" message:@"是否全部删除" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.deleteList removeAllObjects];
        [self.tableView reloadData];
        [NSKeyedArchiver archiveRootObject:self.deleteList toFile:self.documentPathWithDelete];
        self.deleteItem.enabled = self.deleteList.count;
    }];
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 添加一个删除按钮
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        // 删除对应的数据
        [self.deleteList removeObjectAtIndex:indexPath.row];
        NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        [self.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
        [NSKeyedArchiver archiveRootObject:self.deleteList toFile:self.documentPathWithDelete];
        self.deleteItem.enabled = self.deleteList.count;
    }];
    deleteRowAction.backgroundColor = [UIColor redColor];
    UITableViewRowAction *downRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"已完成" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        // 恢复到已完成列表
        [self.doneList addObject:self.deleteList[indexPath.row]];
        [self.deleteList removeObjectAtIndex:indexPath.row];
        NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        [self.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
        [NSKeyedArchiver archiveRootObject:self.doneList toFile:self.documentPathWithDone];
        [NSKeyedArchiver archiveRootObject:self.deleteList toFile:self.documentPathWithDelete];
    }];
    downRowAction.backgroundColor = [UIColor lightGrayColor];
    UITableViewRowAction *unDownRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"未完成" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        // 恢复到未完成列表
        [self.todoList addObject:self.deleteList[indexPath.row]];
        [self.deleteList removeObjectAtIndex:indexPath.row];
        NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        [self.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
        [NSKeyedArchiver archiveRootObject:self.todoList toFile:self.documentPathWithTodo];
        [NSKeyedArchiver archiveRootObject:self.deleteList toFile:self.documentPathWithDelete];
    }];
    unDownRowAction.backgroundColor = [UIColor orangeColor];
    return @[deleteRowAction,downRowAction,unDownRowAction];
}

- (void)viewWillAppear:(BOOL)animated {
    self.todoList = nil;
    self.doneList = nil;
    self.deleteList = nil;
    self.currency = self.deleteList;
    [self.tableView reloadData];
}

@end
