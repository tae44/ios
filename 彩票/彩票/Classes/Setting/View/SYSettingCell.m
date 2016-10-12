//
//  SYSettingCell.m
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYSettingCell.h"
#import "SYSettingItem.h"
#import "SYSettingArrowItem.h"
#import "SYSettingSwitchItem.h"
#import "SYSettingLabelItem.h"

@interface SYSettingCell ()
/**箭头*/
@property (nonatomic, strong) UIImageView *myArrow;
/**开关*/
@property (nonatomic, strong) UISwitch *mySwitch;
/**Label*/
@property (nonatomic, strong) UILabel *myLabel;

@end

@implementation SYSettingCell

- (UIImageView *)myArrow {
    if (!_myArrow) {
        _myArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _myArrow;
}

- (UISwitch *)mySwitch {
    if (!_mySwitch) {
        _mySwitch = [[UISwitch alloc] init];
        [_mySwitch addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _mySwitch;
}

- (UILabel *)myLabel {
    if (!_myLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.bounds = CGRectMake(0, 0, 80, 44);
        label.text = @"00:00";
        _myLabel = label;
    }
    return _myLabel;
}

/**
 开关改变时将设置保存到用户偏好设置
 */
- (void)valueChange:(UISwitch *)mySwitch {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:mySwitch.isOn forKey:self.item.title];
    [defaults synchronize];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"SettingCell";
    SYSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SYSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}

- (void)setItem:(SYSettingItem *)item {
    _item = item;
    // 显示图片和标题
    self.textLabel.text = item.title;
    if (item.icon) {
        self.imageView.image = [UIImage imageNamed:item.icon];
    }
    //设置子标题
    self.detailTextLabel.text = item.subTitle;
    // 设置箭头
    // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if ([item isKindOfClass:[SYSettingArrowItem class]]) {// 箭头
        self.accessoryView = self.myArrow;
        // 箭头可以被选中
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    } else if ([item isKindOfClass:[SYSettingSwitchItem class]]) {// 开关
        // 设置开关状态
        self.mySwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:self.item.title];
        self.accessoryView = self.mySwitch;
        // 开关的cell不能被选中
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else if ([item isKindOfClass:[SYSettingLabelItem class]]) {// 右边添加一个Label
        self.accessoryView = self.myLabel;
        // Label可以被选中
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}

@end
