//
//  SYweiboCell.h
//  微博练习
//
//  Created by 123 on 16/8/31.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SYweiboFrame;

//自定义cell
@interface SYweiboCell : UITableViewCell

//加载微博Frame模型
@property (nonatomic , strong) SYweiboFrame *weiboFrame;

+ (instancetype)weiboCellWithTableView:(UITableView *)tableView;

@end
