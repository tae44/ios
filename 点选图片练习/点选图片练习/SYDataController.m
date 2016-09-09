//
//  SYDataController.m
//  点选图片练习
//
//  Created by 123 on 16/9/6.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYDataController.h"
#import "SYData.h"

@interface SYDataController ()

@property (nonatomic, strong) SYData *data;

@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation SYDataController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [SYData dataList];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseId = @"data";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    SYData *data = self.datas[indexPath.row];
    cell.textLabel.text = data.titileName;
    cell.imageView.image = [UIImage imageNamed:data.imageName];
    return cell;
}

#pragma mark - Table view的代理方法
/**
 *  点击cell调用的方法
 *
 *  @param tableView tableView
 *  @param indexPath indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SYData *data = [[SYData alloc] init];
    data.titileName = @"考试练习";
    data.imageName = @"泡妞宝典";
    SYData *currentData = self.datas[indexPath.row];
    //当前的title名称
    NSString *currentTitle = currentData.titileName;
    if (indexPath.row != self.datas.count - 1) {
        SYData *nextData = self.datas[indexPath.row+1];
        self.data = nextData;
    } else {
        SYData *nextData = [[SYData alloc] init];
        self.data = nextData;
    }
    //判断要生成的cell的title名称不等于data的名称,或者点击了本身就是生成出来的cell
    if (![self.data.titileName isEqualToString:data.titileName] && ![currentTitle isEqualToString:data.titileName]) {
        [self.datas insertObject:data atIndex:indexPath.row + 1];
        [self.tableView reloadData];
    //点击不是生成出来的cell就可以删除
    } else if (![currentTitle isEqualToString:data.titileName]) {
        [self.datas removeObjectAtIndex:indexPath.row + 1];
        [self.tableView reloadData];
    }
}

@end
