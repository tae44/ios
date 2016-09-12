//
//  SYweiboCell.m
//  微博练习
//
//  Created by 123 on 16/8/31.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYweiboCell.h"
#import "SYweibo.h"
#import "SYweiboFrame.h"

@interface SYweiboCell ()

//头像View
@property (nonatomic, weak) UIImageView *iconView;

//用户名称View
@property (nonatomic, weak) UILabel *nameView;

//VIP图标View
@property (nonatomic, weak) UIImageView *vipView;

//微博内容View
@property (nonatomic, weak) UILabel *textView;

//内容图片View
@property (nonatomic, weak) UIImageView *pictureView;

@end

@implementation SYweiboCell

//生成自定义cell
+ (instancetype)weiboCellWithTableView:(UITableView *)tableView {
    static NSString *reuseID = @"weibo";
    SYweiboCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[SYweiboCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    return cell;
}

//生成cell的同时,生成相应的子控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //生成头像View
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        //生成用户名称View
        UILabel *nameView = [[UILabel alloc] init];
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        nameView.font = [UIFont systemFontOfSize:SYNameFont];
        //生成VIP图标View
        UIImageView *vipView = [[UIImageView alloc] init];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        self.vipView.image = [UIImage imageNamed:@"vip"];
        //生成微博内容View
        UILabel *textView = [[UILabel alloc] init];
        [self.contentView addSubview:textView];
        self.textView = textView;
        textView.font = [UIFont systemFontOfSize:SYTextFont];
        textView.numberOfLines = 0;
        //生成内容图片View
        UIImageView *pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
    }
    return self;
}

//重写微博Frame模型的setter方法
- (void)setWeiboFrame:(SYweiboFrame *)weiboFrame {
    _weiboFrame = weiboFrame;
    [self setSubViewContent];
    [self setSubViewFrame];
}

//设置子控件内容
- (void)setSubViewContent {
    SYweibo *weibo = self.weiboFrame.weibo;
    self.iconView.image = [UIImage imageNamed:weibo.icon];
    self.nameView.text = weibo.name;
    if (!weibo.isVip) {
        self.vipView.hidden = YES;
        self.nameView.textColor = [UIColor blackColor];
    } else {
        self.vipView.hidden = NO;
        self.nameView.textColor = [UIColor redColor];
    }
    self.textView.text = weibo.text;
    if (weibo.picture) {
        self.pictureView.image = [UIImage imageNamed:weibo.picture];
    }
}

//设置子控件的Frame
- (void)setSubViewFrame {
    self.iconView.frame = self.weiboFrame.iconFrame;
    self.nameView.frame = self.weiboFrame.nameFrame;
    self.vipView.frame = self.weiboFrame.vipFrame;
    self.textView.frame = self.weiboFrame.textFrame;
    self.pictureView.frame = self.weiboFrame.pictureFrame;
}

@end
