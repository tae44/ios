//
//  SYBaseSettingViewController.m
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYBaseSettingViewController.h"
#import "SYSettingCell.h"
#import "SYSettingGroup.h"
#import "SYSettingItem.h"

@interface SYBaseSettingViewController ()

@end

@implementation SYBaseSettingViewController

/**
 只要调用init方法,就返回组样式表格
 */
- (instancetype)init {
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {}
    return self;
}

- (NSMutableArray *)cellData {
    if (!_cellData) {
        _cellData = [NSMutableArray array];
    }
    return _cellData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置背景
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cellData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 获取组数据
    SYSettingGroup *group = self.cellData[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取模型显示数据
    SYSettingGroup *group = self.cellData[indexPath.section];
    SYSettingItem *item = group.items[indexPath.row];
    // 创建cell并设置模型数据
    SYSettingCell *cell = [SYSettingCell cellWithTableView:tableView];
    cell.item = item;
    return cell;
}

#pragma mark - cell的点中

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取模型
    SYSettingGroup *group = self.cellData[indexPath.section];
    SYSettingItem *item = group.items[indexPath.row];
    // 判断是否有特殊操作
    if (item.operation) {
        // operation有值说明有特殊的操作，调用
        item.operation();
    } else if (item.vcClass) {
        // 创建控制器并显示
        id vc = [[item.vcClass alloc] init];
        // 设置下一个控制器的标题
        [vc setTitle:item.title];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - 头部标题

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    SYSettingGroup *group = self.cellData[section];
    return group.headerTitle;
}

#pragma mark - 尾部标题

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    SYSettingGroup *group = self.cellData[section];
    return group.footerTitle;
}

@end
