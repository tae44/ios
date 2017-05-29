//
//  SYTodoListTableViewController.m
//  iShouldDO
//
//  Created by jason on 2016/9/26.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYTodoListTableViewController.h"
#import "SYAddViewController.h"
#import "SYEditViewController.h"
#import "SYMission.h"
#import "SYPreview.h"

@interface SYTodoListTableViewController () <SYAddViewControllerDelegate,SYEditViewControllerDelegate,SYPreviewDelegate>
/**存储任务列表的数组*/
@property (nonatomic, strong) NSMutableArray *todoList;
/**存储已完成任务列表的数组*/
@property (nonatomic, strong) NSMutableArray *doneList;
/**存储已删除任务列表的数组*/
@property (nonatomic, strong) NSMutableArray *deleteList;
/**选中某一行的行号*/
@property (nonatomic, assign) NSInteger row;
/**存放未完成任务的沙盒路径*/
@property (nonatomic, copy) NSString *documentPathWithTodo;
/**存放已完成任务的沙盒路径*/
@property (nonatomic, copy) NSString *documentPathWithDone;
/**存放已删除任务的沙盒路径*/
@property (nonatomic, copy) NSString *documentPathWithDelete;
/**预览窗口*/
@property (nonatomic, strong) SYPreview *preview;

@end

@implementation SYTodoListTableViewController

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todo" forIndexPath:indexPath];
    SYMission *mission = self.todoList[indexPath.row];
    cell.textLabel.text = mission.name;
    cell.detailTextLabel.text = mission.date;
    // 创建手势操作
    UILongPressGestureRecognizer *longGest = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressTableCell:)];
    [cell addGestureRecognizer:longGest];
    // 取消cell的响应
    // cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - SYAddViewController的代理方法

/**
 实现SYAddViewController的代理方法

 @param addView SYAddViewController
 @param mission 任务数据模型
 */
- (void)addViewDidClickedAddBtn:(SYAddViewController *)addView missionModel:(SYMission *)mission {
    [self.todoList addObject:mission];
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

#pragma mark - SYEditViewController的代理方法

/**
 实现SYEditViewController的代理方法

 @param editView SYEditViewController
 @param mission  任务数据模型
 */
- (void)editViewDidClickedAddBtn:(SYEditViewController *)editView missionModel:(SYMission *)mission {
    // 讲数组中的数据模型替换
    [self.todoList replaceObjectAtIndex:self.row withObject:mission];
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.row inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
    [self.navigationController popViewControllerAnimated:YES];
    [NSKeyedArchiver archiveRootObject:self.todoList toFile:self.documentPathWithTodo];
}

#pragma mark - SYPreview的代理方法

- (void)preview:(SYPreview *)preview {
    SYMission *mission = self.todoList[self.row];
    preview.mission = mission;
}

#pragma mark - Table view 编辑方法

/**
 开启可编辑模式
 */
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
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

/**
 长按某一行出现该行预览
 */
- (void)longPressTableCell:(UILongPressGestureRecognizer *)sender {
    // 长按的最大移动距离
    sender.allowableMovement = 20;
    // 找到长按的点在tableview中的索引
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

#pragma mark - Navigation

/**
 控制器跳转之前调用
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // 获取目标对象
    id dest = segue.destinationViewController;
    // 如果目标为SYAddViewController对象,则创建该对象,并设置代理
    if ([dest isKindOfClass:[SYAddViewController class]]) {
        SYAddViewController *addView = dest;
        addView.delegate = self;
    // 如果目标为SYEditViewController对象,则创建该对象,并设置代理
    } else if ([dest isKindOfClass:[SYEditViewController class]]) {
        SYEditViewController *editView = dest;
        editView.delegate = self;
        // 点中某一行的行号
        NSInteger row = self.tableView.indexPathForSelectedRow.row;
        self.row = row;
        SYMission *mission = self.todoList[row];
        editView.mission = mission;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    self.todoList = nil;
    self.doneList = nil;
    self.deleteList = nil;
    [self.tableView reloadData];
    // 设置应用图标右上角数字
    UIApplication *app = [UIApplication sharedApplication];
    app.applicationIconBadgeNumber = self.todoList.count;
}

@end
