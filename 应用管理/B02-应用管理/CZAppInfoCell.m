//
//  CZAppInfoCell.m
//  B02-应用管理
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZAppInfoCell.h"
#import "CZAppInfo.h"
@interface CZAppInfoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *sizeView;

- (IBAction)downloadClick:(UIButton *)sender;

@end

@implementation CZAppInfoCell
//给子控件赋值
- (void)setAppInfo:(CZAppInfo *)appInfo
{
    _appInfo = appInfo;
    self.iconView.image = [UIImage imageNamed:appInfo.icon];
    self.nameView.text = appInfo.name;
    self.sizeView.text = [NSString stringWithFormat:@"大小：%@|下载量：%@",appInfo.size,appInfo.download];
}
//点击下载按钮
- (IBAction)downloadClick:(UIButton *)sender {
    sender.enabled = NO;
    //3 向代理对象发送消息
    if ([self.delegate respondsToSelector:@selector(appInfoCellDidClickedDownload:)]) {
        [self.delegate appInfoCellDidClickedDownload:self];
    }
}
@end
