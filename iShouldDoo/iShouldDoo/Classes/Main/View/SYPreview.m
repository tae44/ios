//
//  SYPreview.m
//  iShouldDO
//
//  Created by jason on 2016/9/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYPreview.h"
#import "SYMission.h"

@interface SYPreview ()

@end

@implementation SYPreview

/**
 创建一个自定义的预览view
 */
+ (instancetype)preview {
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    SYPreview *preView = [[SYPreview alloc] initWithFrame:CGRectMake((screenW - 300) * 0.5, 60, 320, 450)];
    preView.backgroundColor = [UIColor whiteColor];
    // 设置圆角
    preView.layer.cornerRadius = 10;
    preView.layer.masksToBounds = YES;
    // 设置边框宽度和颜色
    preView.layer.borderWidth = 1;
    preView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    return preView;
}

- (void)layoutSubviews {
    // 添加名称标示
    CGFloat nameLabelX = (320 - 100) * 0.5;
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(nameLabelX, 15, 100, 21)];
    [self addSubview:nameLabel];
    nameLabel.text = @"任务名称⬇️";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    // 添加任务名称显示label
    CGFloat nameContextX = (320 - 235) * 0.5;
    UILabel *nameContent = [[UILabel alloc] initWithFrame:CGRectMake(nameContextX, 50, 235, 30)];
    nameContent.textAlignment = NSTextAlignmentCenter;
    [self addSubview:nameContent];
    // 添加备注标示
    UILabel *commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(nameLabelX, 100, 100, 21)];
    [self addSubview:commentLabel];
    commentLabel.text = @"备注⬇️";
    commentLabel.textAlignment = NSTextAlignmentCenter;
    // 添加任务备注显示label
    UILabel *commentContent = [[UILabel alloc] initWithFrame:CGRectMake(nameContextX, 140, 235, 128)];
    commentContent.numberOfLines = 0;
    [self addSubview:commentContent];
    // 创建显示时间的label
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 250, 250, 30)];
    dateLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:dateLabel];
    // 利用代理方法给属性赋值
    if ([self.delegate respondsToSelector:@selector(preview:)]) {
        [self.delegate preview:self];
        nameContent.text = self.mission.name;
        commentContent.text = self.mission.comment;
        dateLabel.text = [NSString stringWithFormat:@"创建时间 : %@", self.mission.date];
    }
}

@end
