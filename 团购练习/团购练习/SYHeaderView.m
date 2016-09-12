//
//  SYHeaderView.m
//  团购练习
//
//  Created by 123 on 16/8/30.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYHeaderView.h"

@interface SYHeaderView ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation SYHeaderView

+ (instancetype)headerView {
    SYHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"SYHeaderView" owner:nil options:nil] lastObject];
    return headerView;
}

- (void)awakeFromNib {
    CGFloat iconW = self.scrollView.frame.size.width;
    CGFloat iconH = self.scrollView.frame.size.height;
    int count = 5;
    for (int i = 0; i < count; i++) {
        NSString *adName = [NSString stringWithFormat:@"ad_%02d", i];
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.scrollView addSubview:iconView];
        iconView.image = [UIImage imageNamed:adName];
        CGFloat iconX = i * iconW;
        CGFloat iconY = 0;
        iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    }
    self.scrollView.contentSize = CGSizeMake(count * iconW, 0);
    self.scrollView.pagingEnabled = YES;
}

@end
