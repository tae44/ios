//
//  CZScoreLiveNoticeViewController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-4.
//  Copyright (c) 2014年 vgios. All rights reserved.
//  比分直播提醒

#import "CZScoreLiveNoticeViewController.h"


@interface CZScoreLiveNoticeViewController()

@property(nonatomic,weak)UITextField *textField;
@property(nonatomic,assign)BOOL startField;

@end


@implementation CZScoreLiveNoticeViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //创建一个textField
    UITextField *textField = [[UITextField alloc] init];
    
    //创建DatePicker
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeTime;
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"ZH"];
    textField.inputView = datePicker;
    
    [self.tableView addSubview:textField];
    self.textField = textField;
    
    [datePicker addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
  
    
    __weak typeof(self) selfObj = self;
    
    CZSettingSwitchItem *follow = [CZSettingSwitchItem settingItemWithTitle:@"提醒我关注的比赛"];
    
    CZSettingGroup *group1 = [[CZSettingGroup alloc] init];
    group1.items = @[follow];
    group1.footerTitle = @"当我关注的比赛比分发生变化时，通过小弹窗或推送进行提醒";
    
    [self.data addObject:group1];
    
    

    //第二组
    CZSettingLabelItem *start = [CZSettingLabelItem settingItemWithTitle:@"起始时间"];
    start.option = ^{
        
        
        selfObj.startField = YES;
        [selfObj.textField becomeFirstResponder];
        
    };
   
    CZSettingGroup *group2 = [[CZSettingGroup alloc] init];
    group2.items = @[start];
    
    group2.headerTitle = @"只在以下时间接受比分直播";
    
    [self.data addObject:group2];
    
    //第三组
    CZSettingLabelItem *end = [CZSettingLabelItem settingItemWithTitle:@"结束时间"];
    end.option = ^{
        
        selfObj.startField = NO;
        [selfObj.textField becomeFirstResponder];
        
        
        [UIView beginAnimations:nil context:nil];
        selfObj.tableView.contentOffset = CGPointMake(0, 60);
        [UIView commitAnimations];
    };
    CZSettingGroup *group3 = [[CZSettingGroup alloc] init];
    group3.items = @[end];
    
    
    [self.data addObject:group3];
    
}

-(void)valueChange:(UIDatePicker *)datePicker{
    
    NSDate *date = datePicker.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    
    if (self.startField) {
       NSLog(@"====== %@",[formatter stringFromDate:date]);
    }
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}



@end
