//
//  SYDoneVc.m
//  iShouldDoo
//
//  Created by jason on 2016/10/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYDoneVc.h"

@interface SYDoneVc ()

@end

@implementation SYDoneVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"已完成任务";
}

- (void)viewWillAppear:(BOOL)animated {
    self.todoList = nil;
    self.doneList = nil;
    self.currency = self.doneList;
    self.deleteList = nil;
    [self.tableView reloadData];
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 添加一个删除按钮
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        // 将任务从已完成数组中转移到已删除数组中
        [self.deleteList addObject:self.doneList[indexPath.row]];
        [self.doneList removeObjectAtIndex:indexPath.row];
        NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        [self.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
        [NSKeyedArchiver archiveRootObject:self.doneList toFile:self.documentPathWithDone];
        [NSKeyedArchiver archiveRootObject:self.deleteList toFile:self.documentPathWithDelete];
    }];
    deleteRowAction.backgroundColor = [UIColor redColor];
    // 添加一个标记完成按钮
    UITableViewRowAction *unDownRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"标记未完成" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        // 将任务从未完成数组中转移到已完成数组中
        [self.todoList addObject:self.doneList[indexPath.row]];
        [self.doneList removeObjectAtIndex:indexPath.row];
        NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        [self.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
        [NSKeyedArchiver archiveRootObject:self.doneList toFile:self.documentPathWithDone];
        [NSKeyedArchiver archiveRootObject:self.todoList toFile:self.documentPathWithTodo];
    }];
    unDownRowAction.backgroundColor = [UIColor orangeColor];
    return @[deleteRowAction,unDownRowAction];
}

@end
