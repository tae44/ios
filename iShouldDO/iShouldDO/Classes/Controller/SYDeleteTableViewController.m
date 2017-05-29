//
//  SYDeleteTableViewController.m
//  iShouldDO
//
//  Created by jason on 2016/9/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYDeleteTableViewController.h"
#import "SYMission.h"
#import "SYPreview.h"

@interface SYDeleteTableViewController () <SYPreviewDelegate>

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
/**删除所有数据的按钮*/
@property (weak, nonatomic) IBOutlet UIBarButtonItem *deleteAllDataBtn;
/**选中某一行的行号*/
@property (nonatomic, assign) NSInteger row;

@end

@implementation SYDeleteTableViewController

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
    SYMission *mission = self.deleteList[self.row];
    preview.mission = mission;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.deleteList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"delete" forIndexPath:indexPath];
    SYMission *mission = self.deleteList[indexPath.row];
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
        // 删除对应的数据
        [self.deleteList removeObjectAtIndex:indexPath.row];
        NSIndexPath *path = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        [self.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
        [NSKeyedArchiver archiveRootObject:self.deleteList toFile:self.documentPathWithDelete];
        self.deleteAllDataBtn.enabled = self.deleteList.count;
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

/**
 删除所有数据
 */
- (IBAction)deleteAllData {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"删除文件" message:@"是否全部删除" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.deleteList removeAllObjects];
        [self.tableView reloadData];
        [NSKeyedArchiver archiveRootObject:self.deleteList toFile:self.documentPathWithDelete];
        self.deleteAllDataBtn.enabled = self.deleteList.count;
    }];
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
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
    // 判断全部删除按钮是否可用
    self.deleteAllDataBtn.enabled = self.deleteList.count;
}

@end
