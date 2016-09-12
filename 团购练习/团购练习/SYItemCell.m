//
//  SYItemCell.m
//  团购练习
//
//  Created by 123 on 16/8/30.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYItemCell.h"
#import "SYItems.h"

@interface SYItemCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *titleView;

@property (weak, nonatomic) IBOutlet UILabel *priceView;

@property (weak, nonatomic) IBOutlet UILabel *buyCountView;

@end

@implementation SYItemCell

+ (instancetype)itemCellWithTableView:(UITableView *)tableView {
    static NSString *reuseID = @"item";
    SYItemCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SYItemCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void) setItems:(SYItems *)items {
    _items = items;
    self.titleView.text = items.title;
    self.priceView.text = [NSString stringWithFormat:@"￥ %@", items.price];
    self.buyCountView.text = [NSString stringWithFormat:@"已售出 %@", items.buyCount];
    self.iconView.image = [UIImage imageNamed:items.icon];
}

@end
