//
//  CZSettingCell.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-2.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZSettingCell.h"
#import "CZSettingItem.h"
#import "CZSettingSwitchItem.h"
#import "CZSettingArrowItem.h"
#import "CZSettingLabelItem.h"

@interface CZSettingCell()

@property(nonatomic,strong)UIImageView *mArrow;//箭头
@property(nonatomic,strong)UISwitch *mSwitch;
@property(nonatomic,strong)UILabel *mLabel;

@property(nonatomic,weak)UIView *mDivider;

@end


@implementation CZSettingCell

//箭头
-(UIImageView *)mArrow{
    if (_mArrow == nil) {
        _mArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _mArrow;
}

-(UISwitch *)mSwitch{
    if (_mSwitch == nil) {
        _mSwitch = [[UISwitch alloc] init];
        [_mSwitch addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
    }
    
    return _mSwitch;
}



-(void)switchChange{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //以标题为key存储开关状态
    [defaults setBool:self.mSwitch.isOn forKey:self.item.title];
    [defaults synchronize];
}

-(UILabel *)mLabel{

    if (_mLabel == nil) {
        _mLabel = [[UILabel alloc] init];
        _mLabel.bounds = CGRectMake(0, 0, 80, 33);
        _mLabel.textAlignment = NSTextAlignmentRight;
        //_mLabel.backgroundColor = [UIColor grayColor];
        _mLabel.text = @"00:00";
    }
    
    return _mLabel;
}

+(instancetype)settingCellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"Cell";
    
    CZSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[CZSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    return cell;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置cell的背景
        [self setupCellBg];
        
        //设置cell的label的背景
        [self setupCellLabelBg];
        
        //设置cell的分隔线
        [self setupDivider];
        
    }
    return self;
}

/**
 *  设置cell的背景
 */
-(void)setupCellBg{
    //设置选中的背景
    UIView *selectedView =[[UIView alloc] init];
    selectedView.backgroundColor = CZColor(237, 233, 218);
    self.selectedBackgroundView = selectedView;
    
    //cell的默认背景
    UIView *backgroundView =[[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor whiteColor];
    self.backgroundView = backgroundView;
}

/**
 *  设置cell的label的背景色
 */
-(void)setupCellLabelBg{
    if (!iOS7) {
        self.textLabel.backgroundColor = [UIColor whiteColor];
        self.detailTextLabel.backgroundColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont systemFontOfSize:16];
    }
    
}

-(void)setupDivider{
    UIView *divider = [[UIView alloc] init];
    divider.backgroundColor = [UIColor blackColor];
    divider.alpha = 0.2;
    [self.contentView addSubview:divider];
    self.mDivider = divider;
}

-(void)setItem:(CZSettingItem *)item{
    _item = item;
    
    //有图片才需要设置
    if (item.icon) {
        self.imageView.image = [UIImage imageNamed:item.icon];
    }
    
    //标题
    self.textLabel.text = item.title;
    
    //子标题
    self.detailTextLabel.text = item.subTitle;
    
    //accessoryView
    if ([item isKindOfClass:[CZSettingArrowItem class]]) {
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryView = self.mArrow;
    }else if([item isKindOfClass:[CZSettingSwitchItem class]]){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.mSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:_item.title];
        self.accessoryView = self.mSwitch;
        
    }else if([item isKindOfClass:[CZSettingLabelItem class]]){
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryView = self.mLabel;
    }else{
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryView = nil;
    }
}

/**
 *  最后一行不显示分隔线
 */
-(void)setLastRowInSection:(BOOL)lastRowInSection{
    _lastRowInSection = lastRowInSection;
    
    self.mDivider.hidden = lastRowInSection;
}


/**
 *  ios6中，重新设置cell的frm ,使基contentView左右没有间距
 */
-(void)setFrame:(CGRect)frame{
    if (!iOS7) {
        CGFloat padding = 10;
        frame.origin.x -= padding;
        frame.size.width += 2 * padding;
    }
    
    //调用父类方法
    [super setFrame:frame];
    
    
}

/**
 *  iOS7才添加自定义分隔线
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    if (iOS7) return;
    
    CGFloat dividerX = 0;
    CGFloat dividerH = 1;
    CGFloat dividerY = self.frame.size.height - 1;
    CGFloat divederW = [UIScreen mainScreen].bounds.size.width;
    self.mDivider.frame = CGRectMake(dividerX, dividerY, divederW, dividerH);
    
}

@end
