//
//  SYAddViewController.m
//  iShouldDoo
//
//  Created by jason on 2016/10/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYAddViewController.h"
#import "SYAddView.h"
#import "SYMission.h"

@interface SYAddViewController ()
/**任务名称输入框*/
@property (weak, nonatomic) UITextField *nameTextField;
/**任务备注输入框*/
@property (weak, nonatomic) UITextView *commentTextField;
/**任务对象模型*/
@property (nonatomic, strong) SYMission *mission;
/**添加按钮*/
@property (weak, nonatomic) UIBarButtonItem *addBtn;

@end

@implementation SYAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"添加任务";
    // 添加自定义的view
    SYAddView *addView = [SYAddView addView];
    [self.view addSubview:addView];
    // 给属性赋值
    [addView createContent];
    self.nameTextField = addView.nameTextField;
    self.commentTextField = addView.commentTextField;
    // 添加右侧添加按钮
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addMission)];
    self.navigationItem.rightBarButtonItem = addItem;
}

/**
 点击添加按钮
 */
- (void)addMission {
    if ([self.delegate respondsToSelector:@selector(addViewDidClickedAddBtn:missionModel:)]) {
        SYMission *mission = [[SYMission alloc] init];
        mission.name = self.nameTextField.text;
        mission.comment = self.commentTextField.text;
        mission.date = [self timeCreate];
        [self.delegate addViewDidClickedAddBtn:self missionModel:mission];
    }
}

/**
 生成创建的时间
 */
- (NSString *)timeCreate {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger unitFlags = NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour |NSCalendarUnitMinute;
    NSDateComponents *cmp = [calendar components:unitFlags fromDate:[NSDate date]];
    NSString *time = [NSString stringWithFormat:@"%ld-%ld-%ld %ld:%.02ld", cmp.year,cmp.month, cmp.day, cmp.hour, cmp.minute];
    return time;
}

@end
