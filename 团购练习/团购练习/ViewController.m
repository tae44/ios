//
//  ViewController.m
//  团购练习
//
//  Created by 123 on 16/8/30.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYItems.h"
#import "SYItemCell.h"
#import "SYFooterView.h"
#import "SYHeaderView.h"

@interface ViewController () <UITableViewDataSource,SYFooterViewDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (NSMutableArray *)items {
    if (_items == nil) {
        _items = [SYItems itemsList];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 80;
    SYFooterView *footerView = [SYFooterView footerView];
    footerView.delegate = self;
    self.tableView.tableFooterView = footerView;
    SYHeaderView *headerView = [SYHeaderView headerView];
    self.tableView.tableHeaderView = headerView;
}

#pragma mark - tableView的数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SYItemCell *cell = [SYItemCell itemCellWithTableView:tableView];
    SYItems *items = self.items[indexPath.row];
    cell.items = items;
    return cell;
}

#pragma mark - footerView的代理方法
- (void)footerViewDidClickLoadMoreBtn:(SYFooterView *)footerView {
    SYItems *items = [[SYItems alloc] init];
    items.title = @"王姐烧烤";
    items.price = @"15";
    items.buyCount = @"450";
    items.icon = @"2c97690e72365e38e3e2a95b934b8dd2";
    [self.items addObject:items];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.items.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

@end
