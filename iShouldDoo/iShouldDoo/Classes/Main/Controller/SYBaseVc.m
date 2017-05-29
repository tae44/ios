//
//  SYBaseVc.m
//  iShouldDoo
//
//  Created by jason on 2016/10/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYBaseVc.h"

@interface SYBaseVc () <SYPreviewDelegate,SYEditViewControllerDelegate>

@end

@implementation SYBaseVc

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
    NSString *documentPathWithTodo = [documentPath stringByAppendingPathComponent:@"todo.archiver"];
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
    return self.currency.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    SYMission *mission = self.currency[indexPath.row];
    cell.textLabel.text = mission.name;
    cell.detailTextLabel.text = mission.comment;
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
    // 进入编辑模式
    SYEditViewController *editVc = [[SYEditViewController alloc] init];
    editVc.delegate = self;
    editVc.mission = self.currency[indexPath.row];
    [self.navigationController pushViewController:editVc animated:YES];
}

#pragma mark - SYEditViewController的代理方法

/**
 实现SYEditViewController的代理方法
 
 @param editView SYEditViewController
 @param mission  任务数据模型
 */
- (void)editViewDidClickedAddBtn:(SYEditViewController *)editView missionModel:(SYMission *)mission {
    // 讲数组中的数据模型替换
    [self.currency replaceObjectAtIndex:self.row withObject:mission];
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.row inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
    [self.navigationController popViewControllerAnimated:YES];
    [NSKeyedArchiver archiveRootObject:self.todoList toFile:self.documentPathWithTodo];
}

#pragma mark - SYPreview的代理方法

- (void)preview:(SYPreview *)preview {
    SYMission *mission = self.currency[self.row];
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
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // 获取目标对象
//    id dest = segue.destinationViewController;
//    // 如果目标为SYAddViewController对象,则创建该对象,并设置代理
//    if ([dest isKindOfClass:[SYAddViewController class]]) {
//        SYAddViewController *addView = dest;
//        addView.delegate = self;
//        // 如果目标为SYEditViewController对象,则创建该对象,并设置代理
//    } else if ([dest isKindOfClass:[SYEditViewController class]]) {
//        SYEditViewController *editView = dest;
//        editView.delegate = self;
//        // 点中某一行的行号
//        NSInteger row = self.tableView.indexPathForSelectedRow.row;
//        self.row = row;
//        SYMission *mission = self.todoList[row];
//        editView.mission = mission;
//    }
//}

@end
