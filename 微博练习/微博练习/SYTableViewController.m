//
//  SYTableViewController.m
//  微博练习
//
//  Created by 123 on 16/8/31.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYTableViewController.h"
#import "SYweibo.h"
#import "SYweiboCell.h"
#import "SYweiboFrame.h"

@interface SYTableViewController ()

//存有微博Frame模型的数组
@property (nonatomic, strong) NSArray *weiboFrames;

@end

@implementation SYTableViewController

//懒加载
- (NSArray *)weiboFrames {
    if (!_weiboFrames) {
        //取得存有微博数据的数组
        NSArray *weibos = [SYweibo weiboList];
        //新增一个存Frame的数组
        NSMutableArray *frames = [NSMutableArray array];
        for (SYweibo *weibo in weibos) {
            //创建Frame数据
            SYweiboFrame *frame = [[SYweiboFrame alloc] init];
            //赋值同时创建Frame的各项参数并保存起来
            frame.weibo = weibo;
            [frames addObject:frame];
        }
        _weiboFrames = frames;
    }
    return _weiboFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weiboFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SYweiboCell *cell = [SYweiboCell weiboCellWithTableView:tableView];
    SYweiboFrame *frame = self.weiboFrames[indexPath.row];
    //赋值的同时设置子控件的内容和Frame
    cell.weiboFrame = frame;
    return cell;
}

#pragma mark - Table View Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    SYweiboFrame *frame = self.weiboFrames[indexPath.row];
    return frame.rowHeight;
}

@end
