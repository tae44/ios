//
//  SYAddViewController.m
//  iShouldDO
//
//  Created by jason on 2016/9/26.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYAddViewController.h"
#import "SYMission.h"

@interface SYAddViewController ()
/**任务名称输入框*/
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
/**任务备注输入框*/
@property (weak, nonatomic) IBOutlet UITextView *commentTextField;
/**任务对象模型*/
@property (nonatomic, strong) SYMission *mission;
/**添加按钮*/
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addBtn;

@end

@implementation SYAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 点击添加按钮
 */
- (IBAction)addMission {
    // 在合适的地方调用代理方法
    if ([self.delegate respondsToSelector:@selector(addViewDidClickedAddBtn:missionModel:)]) {
        SYMission *mission = [[SYMission alloc] init];
        mission.name = self.nameTextField.text;
        mission.comment = self.commentTextField.text;
        mission.date = [self timeCreate];
        [self.delegate addViewDidClickedAddBtn:self missionModel:mission];
    }
}

/**
 检测名称输入框状态改变
 */
- (IBAction)nameTextChanged {
    if (self.nameTextField.text.length == 0) {
        self.addBtn.enabled = NO;
    } else {
        self.addBtn.enabled = YES;
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
