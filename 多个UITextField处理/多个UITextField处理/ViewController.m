//
//  ViewController.m
//  多个UITextField处理
//
//  Created by 123 on 16/9/12.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYKeyboardToolbar.h"

@interface ViewController () <SYKeyboardToolbarDelegate>

/**包含所有TextField的View*/
@property (weak, nonatomic) IBOutlet UIView *registerContainer;
/**键盘工具条对象*/
@property (nonatomic, strong) SYKeyboardToolbar *toolbar;
/**包含所有TextField的Array*/
@property (nonatomic, strong) NSArray *fields;

@end

@implementation ViewController

/**
 *  toolbar的懒加载
 *
 *  @return toolbar对象
 */
- (SYKeyboardToolbar *)toolbar {
    if (!_toolbar) {
        _toolbar = [SYKeyboardToolbar toolbar];
        _toolbar.kbdelegate = self;
    }
    return _toolbar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *fieldsM = [NSMutableArray array];
    //将所有TextField子控件都加上工具栏并收集到一个数组中
    for (UIView *subView in self.registerContainer.subviews) {
        if ([subView isKindOfClass:[UITextField class]]) {
            //下面需要强转一下类型
            UITextField *tf = (UITextField *)subView;
            tf.inputAccessoryView = self.toolbar;
            tf.tag = fieldsM.count;
            [fieldsM addObject:tf];
        }
    }
    self.fields = fieldsM;
    //监听键盘事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHide) name:UIKeyboardWillHideNotification object:nil];
}

/**
 *  键盘弹出
 *
 *  @param noti NSNotification对象
 */
- (void)willShow:(NSNotification *)noti {
    NSInteger currentIndex = [self indexOfFirstResponder];
    //当键盘弹出时判断按钮是否可用
    if (currentIndex == 0) {
        self.toolbar.preBtn.enabled = NO;
    }
    if (currentIndex == self.fields.count - 1) {
        self.toolbar.nextBtn.enabled = NO;
    }
    //获取当前的TextField
    UITextField *currentTf = self.fields[currentIndex];
    CGFloat maxY = CGRectGetMaxY(currentTf.frame) + self.registerContainer.frame.origin.y;
    CGRect kbEndFrm = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat kbY = kbEndFrm.origin.y;
    CGFloat delta = kbY - maxY;
    if (delta < 0) {
        [UIView animateWithDuration:0.25 animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(0, delta);
        }];
    }
}

/**
 *  键盘隐藏
 */
- (void)willHide {
    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform = CGAffineTransformIdentity;
    }];
    self.toolbar.preBtn.enabled = YES;
    self.toolbar.nextBtn.enabled = YES;
}

/**
 *  实现键盘的代理方法
 *
 *  @param item    item.tag所代表的按钮: 0 --> 上一个, 1 --> 下一个, 2 --> Done
 */
- (void)keyboardToolbar:(SYKeyboardToolbar *)toolbar btnDidSelected:(UIBarButtonItem *)item {
    switch (item.tag) {
        case 0:
            [self previous];
            break;
        case 1:
            [self next];
            break;
        case 2:
            [self.view endEditing:YES];
            break;
        default:
            break;
    }
}

/**
 *  获取当前响应者的索引
 *
 *  @return 响应者的tag
 */
- (NSInteger)indexOfFirstResponder {
    for (UITextField *tf in self.fields) {
        if (tf.isFirstResponder) {
            return tf.tag;
        }
    }
    //代表没人响应
    return -1;
}

/**
 *  变换下一个响应者
 */
- (void)next {
    NSInteger currentIndex = [self indexOfFirstResponder];
    self.toolbar.preBtn.enabled = YES;
    //当前index所对应的TextField不当响应者
    [self.fields[currentIndex] resignFirstResponder];
    if (currentIndex != -1 && currentIndex != self.fields.count - 1) {
        NSInteger nextIndex = currentIndex + 1;
        [self.fields[nextIndex] becomeFirstResponder];
    }
}

/**
 *  变换上一个响应者
 */
- (void)previous {
    NSInteger currentIndex = [self indexOfFirstResponder];
    self.toolbar.nextBtn.enabled = YES;
    [self.fields[currentIndex] resignFirstResponder];
    if (currentIndex != -1 && currentIndex != 0) {
        NSInteger preIndex = currentIndex - 1;
        [self.fields[preIndex] becomeFirstResponder];
    }
}

/**
 *  点击空白处退出键盘
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
