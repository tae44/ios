//
//  ViewController.m
//  A01-QQ聊天列表
//
//  Created by Apple on 14/12/21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZMessage.h"
#import "CZMessageCell.h"
#import "CZMessageFrame.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (nonatomic, strong) NSMutableArray *messageFrames;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

//1 懒加载
- (NSMutableArray *)messageFrames
{
    if (_messageFrames == nil) {
        //1.1 加载模型数据
        NSArray *messages = [CZMessage messagesList];
        NSMutableArray *tmpArray = [NSMutableArray array];
        //1.2 创建frame模型
        for (CZMessage *msg in messages) {
            CZMessageFrame *msgFrame = [[CZMessageFrame alloc] init];
            msgFrame.message = msg;
            
            [tmpArray addObject:msgFrame];
        }
        _messageFrames = tmpArray;
    }
    return _messageFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //不能选中
    self.tableView.allowsSelection = NO;
    //背景颜色
    self.tableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    //订阅通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

//键盘的位置或大小发生改变
- (void)keyboardWillChangeFrame:(NSNotification *)noti
{
    CGFloat duration = [noti.userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];
    CGRect frame = [noti.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    CGFloat offsetY = frame.origin.y - self.view.frame.size.height;
    
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, offsetY);
    }];
    
//    NSLog(@"%@",noti.userInfo);
}

//3
#pragma mark - 数据源的方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageFrames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1 创建自定义的可重用的cell
    CZMessageCell *cell = [CZMessageCell messageCellWithTableView:tableView];
    //2 给子控件赋值
    cell.messageFrame = self.messageFrames[indexPath.row];
    //3 返回 
    return cell;
}

//返回行高
#pragma mark - tableView的代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.messageFrames[indexPath.row] rowHeight];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //退出键盘
    [self.view endEditing:YES];
}

#pragma mark - 文本框的代理方法

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString *msg = textField.text;
    [self sendMessage:msg type:CZMessageTypeSelf];
    
    if([msg isEqualToString:@"hello"])
    {
        [self sendMessage:@"hi" type:CZMessageTypeOther];
        return YES;
    }
    
    [self sendMessage:@"gun" type:CZMessageTypeOther];
    return YES;
}

//发送消息
- (void)sendMessage:(NSString *)msg type:(CZMessageType)type
{
    //创建模型对象
    CZMessage *message = [[CZMessage alloc] init];
    message.type = type;
    message.text = msg;
    //获取当前时间
    NSDate *date = [NSDate date];
    NSDateFormatter *ndf = [[NSDateFormatter alloc] init];
    ndf.dateFormat = @"HH:mm";
    message.time = [ndf stringFromDate:date];
    
    //上一个消息
    CZMessage *preMessage = [[self.messageFrames lastObject] message];
    if ([message.time isEqualToString:preMessage.time]) {
        message.hiddenTime = YES;
    }
    
    CZMessageFrame *msgFrame = [[CZMessageFrame alloc] init];
    msgFrame.message = message;

    [self.messageFrames addObject:msgFrame];
    
    [self.tableView reloadData];
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.messageFrames.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

@end
