//
//  SYTodoVc.m
//  iShouldDoo
//
//  Created by jason on 2016/10/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYTodoVc.h"
#import "SYAddViewController.h"

@interface SYTodoVc () <SYAddViewControllerDelegate>

@end

@implementation SYTodoVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // 上面的标题
    self.navigationItem.title = @"任务列表";
    // 添加右侧加号按钮
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addMission)];
    self.navigationItem.rightBarButtonItem = addItem;
}

- (void)addMission {
    SYAddViewController *addVc = [[SYAddViewController alloc] init];
    addVc.delegate = self;
    [self.navigationController pushViewController:addVc animated:YES];
}

#pragma mark - SYAddViewController的代理方法

/**
 实现SYAddViewController的代理方法
 
 @param addView SYAddViewController
 @param mission 任务数据模型
 */
- (void)addViewDidClickedAddBtn:(SYAddViewController *)addView missionModel:(SYMission *)mission {
    [self.todoList addObject:mission];
    self.currency = self.todoList;
    // 找到新增加数据的索引号
    NSInteger row = [self.todoList indexOfObject:mission];
    NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
    // 局部重载数据
    [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
    // 跳出SYAddViewController控制器
    [self.navigationController popViewControllerAnimated:YES];
    // 将数据存入沙盒中
    [NSKeyedArchiver archiveRootObject:self.todoList toFile:self.documentPathWithTodo];
}

- (void)viewWillAppear:(BOOL)animated {
    self.todoList = nil;
    self.currency = self.todoList;
    self.doneList = nil;
    self.deleteList = nil;
    [self.tableView reloadData];
    // 设置应用图标右上角数字
    //    UIApplication *app = [UIApplication sharedApplication];
    //    app.applicationIconBadgeNumber = self.todoList.count;
}

/**
 自定义滑动按钮
 */
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 添加一个删除按钮
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        // 将任务从未完成数组中转移到已删除数组中
        [self.deleteList addObject:self.todoList[indexPath.row]];
        [self.todoList removeObjectAtIndex:indexPath.row];
        NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        [self.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
        [NSKeyedArchiver archiveRootObject:self.todoList toFile:self.documentPathWithTodo];
        [NSKeyedArchiver archiveRootObject:self.deleteList toFile:self.documentPathWithDelete];
    }];
    deleteRowAction.backgroundColor = [UIColor redColor];
    // 添加一个标记完成按钮
    UITableViewRowAction *downRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"标记完成" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        // 将任务从未完成数组中转移到已完成数组中
        [self.doneList addObject:self.todoList[indexPath.row]];
        [self.todoList removeObjectAtIndex:indexPath.row];
        NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        [self.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
        [NSKeyedArchiver archiveRootObject:self.todoList toFile:self.documentPathWithTodo];
        [NSKeyedArchiver archiveRootObject:self.doneList toFile:self.documentPathWithDone];
    }];
    downRowAction.backgroundColor = [UIColor orangeColor];
    return @[deleteRowAction,downRowAction];
}

@end
