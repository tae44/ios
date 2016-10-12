//
//  SYProductCell.m
//  彩票
//
//  Created by jason on 2016/10/11.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYProductCell.h"
#import "SYProduct.h"

@interface SYProductCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation SYProductCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"%s", __func__);
    if (self = [super initWithCoder:aDecoder]) {}
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    NSLog(@"%s", __func__);
    if (self = [super initWithFrame:frame]) {}
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // 剪切圆角
#warning awakeFormNid这个方法之后，连线才完成
    self.imgView.layer.cornerRadius = 15;
    self.imgView.layer.masksToBounds = YES;
}

- (void)setProduct:(SYProduct *)product {
    _product = product;
    // 设置图片
    self.imgView.image = [UIImage imageNamed:product.icon];
    // 设置产品名称
    self.nameLabel.text = product.title;
}

@end
