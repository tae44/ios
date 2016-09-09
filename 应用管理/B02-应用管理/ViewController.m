//
//  ViewController.m
//  B02-应用管理
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZAppInfo.h"
#import "CZAppInfoCell.h"
@interface ViewController () <UITableViewDataSource,CZAppInfoCellDelegate>
@property (nonatomic, strong) NSArray *appInfos;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

//1 懒加载
- (NSArray *)appInfos
{
    if (!_appInfos) {
        _appInfos = [CZAppInfo appInfosList];
    }
    return _appInfos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //2 测试数据
    
    //
    self.tableView.rowHeight = 60;
}

//3 数据源的方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.appInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    //1
//    static NSString *reuseId = @"app";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
//    }
//    
//    //2
//    CZAppInfo *appInfo = self.appInfos[indexPath.row];
//    cell.textLabel.text =appInfo.name;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"大小：%@|下载量：%@",appInfo.size,appInfo.download];
//    cell.imageView.image = [UIImage imageNamed:appInfo.icon];
    
    
//    //1
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"app"];
//    //2
//    CZAppInfo *appInfo = self.appInfos[indexPath.row];
//    UILabel *nameView = [cell viewWithTag:10];
//    nameView.text = appInfo.name;
    //3
    
    
    
    
    //1
    CZAppInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"app"];
    //2
    cell.appInfo = self.appInfos[indexPath.row];
    cell.delegate = self;
    //3
    return cell;
}

#pragma mark - 代理的方法
- (void)appInfoCellDidClickedDownload:(CZAppInfoCell *)cell
{
    CGFloat tipW = 150;
    
    CGFloat tipH = 30;

    CGFloat tipX = (self.view.frame.size.width - tipW) * 0.5;
    CGFloat tipY = (self.view.frame.size.height - tipH) * 0.5;
    
    
    
    UILabel *tipView = [[UILabel alloc] initWithFrame:CGRectMake(tipX, tipY, tipW, tipH)];
    
    [self.view addSubview:tipView];
    
    
    
    tipView.text = [NSString stringWithFormat:@"正在下载 %@",cell.appInfo.name];
    
    tipView.backgroundColor = [UIColor grayColor];
    
    tipView.alpha = 0;
    
    tipView.font = [UIFont systemFontOfSize:13];
    
    tipView.textAlignment = NSTextAlignmentCenter;
    
    tipView.layer.masksToBounds = YES;
    
    tipView.layer.cornerRadius = 5;
    
    
    
    
    [UIView animateWithDuration:1.0 animations:^{
        
        tipView.alpha = 0.8;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1.0 delay:2.0 options:UIViewAnimationOptionCurveLinear animations:^{
            
            tipView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [tipView removeFromSuperview];
            
        }];
        
    }];
}

@end
