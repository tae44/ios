//
//  SYDoneTableViewController.m
//  iShouldDO
//
//  Created by jason on 2016/9/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYDoneTableViewController.h"
#import "SYMission.h"
#import "SYPreview.h"

@interface SYDoneTableViewController () <SYPreviewDelegate>

/**存储任务列表的数组*/
@property (nonatomic, strong) NSMutableArray *todoList;
/**存储已完成任务列表的数组*/
@property (nonatomic, strong) NSMutableArray *doneList;
/**存储已删除任务列表的数组*/
@property (nonatomic, strong) NSMutableArray *deleteList;
/**存放未完成任务的沙盒路径*/
@property (nonatomic, copy) NSString *documentPathWithTodo;
/**存放已完成任务的沙盒路径*/
@property (nonatomic, copy) NSString *documentPathWithDone;
/**存放已删除任务的沙盒路径*/
@property (nonatomic, copy) NSString *documentPathWithDelete;
/**预览窗口*/
@property (nonatomic, strong) SYPreview *preview;
/**选中某一行的行号*/
@property (nonatomic, assign) NSInteger row;

@end

@implementation SYDoneTableViewController

///**
// 使用第三方库MJRefresh创建上拉刷新的动态效果
// */
//- (void)createRefreshStyle
//{
//    __weak __typeof(self) weakSelf = self;
//    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
//    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [weakSelf loadNewData];
//    }];
//    // 马上进入刷新状态
//    [self.tableView.mj_header beginRefreshing];
//}
//
///**
// 重载数据
// */
//- (void)loadNewData
//{
//    // 模拟x秒后刷新表格
//    __weak UITableView *tableView = self.tableView;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 如果不设置nil,数组就不会从最新的文件中读取最新的数据
//        self.todoList = nil;
//        self.doneList = nil;
//        self.deleteList = nil;
//        // 刷新表格
//        [tableView reloadData];
//        // 拿到当前的下拉刷新控件，结束刷新状态
//        [tableView.mj_header endRefreshing];
//    });
//}

- (NSMutableArray *)todoList {
    if (!_todoList) {
        _todoList = [NSKeyedUnarchiver unarchiveObjectWithFile:self.documentPathWithTodo];
        if (!_todoList) {
            _todoList = [NSMutableArray array];
        }
    }
    return _todoList;
}

- (NSMutableArray *)doneList {
    if (!_doneList) {
        _doneList = [NSKeyedUnarchiver unarchiveObjectWithFile:self.documentPathWithDone];
        if (!_doneList) {
            _doneList = [NSMutableArray array];
        }
    }
    return _doneList;
}

- (NSMutableArray *)deleteList {
    if (!_deleteList) {
        _deleteList = [NSKeyedUnarchiver unarchiveObjectWithFile:self.documentPathWithDelete];
        if (!_deleteList) {
            _deleteList = [NSMutableArray array];
        }
    }
    return _deleteList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 获取沙盒路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *documentPathWithDone = [documentPath stringByAppendingPathComponent:@"done.archiver"];
    NSString *documentPathWithTodo = [documentPath stringByAppendingPathComponent:@"missionData.archiver"];
    NSString *documentPathWithDelete = [documentPath stringByAppendingPathComponent:@"delete.archiver"];
    self.documentPathWithTodo = documentPathWithTodo;
    self.documentPathWithDone = documentPathWithDone;
    self.documentPathWithDelete = documentPathWithDelete;
}

#pragma mark - SYPreview的代理方法

- (void)preview:(SYPreview *)preview {
    SYMission *mission = self.doneList[self.row];
    preview.mission = mission;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.doneList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"done" forIndexPath:indexPath];
    SYMission *mission = self.doneList[indexPath.row];
    cell.textLabel.text = mission.name;
    cell.detailTextLabel.text = mission.comment;
    // 创建手势操作
    UILongPressGestureRecognizer *longGest = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressTableCell:)];
    [cell addGestureRecognizer:longGest];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

/**
 自定义滑动按钮
 */
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

/**
 长按某一行出现该行预览
 */
- (void)longPressTableCell:(UILongPressGestureRecognizer *)sender {
    // 长按的最大移动距离
    sender.allowableMovement = 20;
    CGPoint point = [sender locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:point];
    self.row = indexPath.row;
    if (sender.state == 1) { // 长按开始时显示预览窗口
        SYPreview *preView = [SYPreview preview];
        preView.delegate = self;
        [self.tableView addSubview:preView];
        self.preview = preView;
    } else if (sender.state == 3) { // 长按结束时销毁窗口
        [self.preview removeFromSuperview];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    self.todoList = nil;
    self.doneList = nil;
    self.deleteList = nil;
    [self.tableView reloadData];
}

@end
