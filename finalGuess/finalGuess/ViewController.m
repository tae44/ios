//
//  ViewController.m
//  finalGuess
//
//  Created by 123 on 16/8/25.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYQuestion.h"

@interface ViewController ()

//数组里的索引
@property (nonatomic , assign) int index;

//表示图片是否是变大状态
@property (nonatomic, assign) BOOL isBig;

//点击提示按钮的时候判断第一个字符是否已经提示过
@property (nonatomic, assign) BOOL isFirst;

//图片原始frame大小
@property (nonatomic, assign) CGRect oldFrame;

//覆盖层,点击可恢复图片大小
@property (nonatomic, strong) UIButton *coverBtn;

//数组数据
@property (nonatomic , strong) NSArray *questions;

//索引的View
@property (weak, nonatomic) IBOutlet UILabel *indexView;

//标题的View
@property (weak, nonatomic) IBOutlet UILabel *titleView;

//金币的View
@property (weak, nonatomic) IBOutlet UIButton *coinView;

//图片的View
@property (weak, nonatomic) IBOutlet UIButton *iconView;

//下一题按钮的View
@property (weak, nonatomic) IBOutlet UIButton *nextBtnView;

//生成答案的View
@property (weak, nonatomic) IBOutlet UIView *answerView;

//生成选项的View
@property (weak, nonatomic) IBOutlet UIView *optionView;

//提示按钮的View
@property (weak, nonatomic) IBOutlet UIButton *promptView;

- (IBAction) nextClick;

- (IBAction) bigImageClick;

- (IBAction) iconClick;

- (IBAction) prompt;

@end

@implementation ViewController

//懒加载
- (NSArray *) questions {
    if (_questions == nil) {
        _questions = [SYQuestion questionsList];
    }
    return _questions;
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    self.index--;
    [self nextClick];
//    self.isFirst = NO;
}

//点击下一题按钮
- (IBAction) nextClick {
    self.index++;
    SYQuestion *question = self.questions[self.index];
    self.indexView.text = [NSString stringWithFormat:@"%d/%lu", self.index+1, (unsigned long)self.questions.count];
    self.titleView.text = question.title;
    [self.iconView setImage:[UIImage imageNamed:question.icon] forState:UIControlStateNormal];
    self.nextBtnView.enabled = (self.index != self.questions.count - 1);
    [self createAnswerBtn:question];
    [self createOptionBtn:question];
    self.isFirst = NO;
    self.optionView.userInteractionEnabled = YES;
    self.promptView.enabled = (self.coinView.currentTitle.integerValue > 0);
}

//点击大图按钮
- (IBAction) bigImageClick {
    self.oldFrame = self.iconView.frame;
    CGFloat bigW = self.view.frame.size.width;
    CGFloat bigH = bigW;
    CGFloat bigX = 0;
    CGFloat bigY = (self.view.frame.size.height - bigH) / 2;
    self.isBig = YES;
    UIButton *coverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.coverBtn = coverBtn;
    [self.view addSubview:coverBtn];
    coverBtn.frame = self.view.frame;
    coverBtn.alpha = 0;
    [UIView animateWithDuration:1.0 animations:^{
        self.iconView.frame = CGRectMake(bigX, bigY, bigW, bigH);
        [self.view bringSubviewToFront:self.iconView];
        coverBtn.alpha = 0.5;
        [coverBtn setBackgroundColor:[UIColor blueColor]];
        [coverBtn addTarget:self action:@selector(smallImageClick) forControlEvents:UIControlEventTouchUpInside];
    }];
}

//使图片变小
- (void) smallImageClick {
    [UIView animateWithDuration:1.0 animations:^{
        self.iconView.frame = self.oldFrame;
        self.coverBtn.alpha = 0;
    } completion:^(BOOL finished) {
        self.isBig = NO;
        [self.coverBtn removeFromSuperview];
    }];
}

//点击图片使之变小
- (IBAction) iconClick {
    self.isBig ? [self smallImageClick] : [self bigImageClick];
}

//提示按钮
- (IBAction) prompt {
    SYQuestion *question = self.questions[self.index];
    if (!self.isFirst) {
        self.index--;
        [self nextClick];
        NSString *first = [NSString stringWithFormat:@"%C",[question.answer characterAtIndex:0]];
        for (UIButton *answerBtn in self.answerView.subviews) {
            [answerBtn setTitle:first forState:UIControlStateNormal];
            self.isFirst = YES;
            int coin = self.coinView.currentTitle.intValue;
            coin -= 1500;
            [self.coinView setTitle:[NSString stringWithFormat:@"%d", coin] forState:UIControlStateNormal];
            for (UIButton *optionBtn in self.optionView.subviews) {
                if ([answerBtn.currentTitle isEqualToString:optionBtn.currentTitle]) {
                    optionBtn.hidden = YES;
                    break;
                }
            }
            [self coinAlert];
            break;
        }
    } else {
        NSString *second = [NSString stringWithFormat:@"%C",[question.answer characterAtIndex:1]];
        for (UIButton *answerBtn in self.answerView.subviews) {
            if (answerBtn.currentTitle == nil) {
                [answerBtn setTitle:second forState:UIControlStateNormal];
                self.promptView.enabled = NO;
                int coin = self.coinView.currentTitle.intValue;
                coin -= 3000;
                [self.coinView setTitle:[NSString stringWithFormat:@"%d", coin] forState:UIControlStateNormal];
                [self coinAlert];
                break;
            }
        }
    }
}

//生成答案按钮
- (void) createAnswerBtn:(SYQuestion *) question {
    [self.answerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSInteger answerCount = question.answer.length;
    CGFloat answerW = 30;
    CGFloat answerH = 30;
    CGFloat margin = 20;
    CGFloat answerY = 0;
    CGFloat leftMargin = (self.answerView.frame.size.width - answerCount * answerW - (answerCount - 1) * margin) / 2;
    for (int i = 0; i < answerCount; i++) {
        CGFloat answerX = leftMargin + i * (answerW + margin);
        UIButton *answerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.answerView addSubview:answerBtn];
        answerBtn.frame = CGRectMake(answerX, answerY, answerW, answerH);
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [answerBtn addTarget:self action:@selector(answerClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

//生成选项按钮
- (void) createOptionBtn:(SYQuestion *) question {
    [self.optionView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    int totalColumn = 7;
    CGFloat optionW = 30;
    CGFloat optionH = 30;
    CGFloat marginX = (self.optionView.frame.size.width - totalColumn * optionW) / (totalColumn + 1);
    CGFloat marginY = 15;
    for (int i = 0; i < question.options.count; i++) {
        int row = i / totalColumn;
        int column = i % totalColumn;
        CGFloat optionX = marginX + column * (marginX + optionW);
        CGFloat optionY = row * (marginY + optionH);
        UIButton *optionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.optionView addSubview:optionBtn];
        optionBtn.tag = i;
        optionBtn.frame = CGRectMake(optionX, optionY, optionW, optionH);
        [optionBtn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
        [optionBtn setBackgroundImage:[UIImage imageNamed:@"btn_option_highlighted"] forState:UIControlStateHighlighted];
        [optionBtn setTitle:question.options[i] forState:UIControlStateNormal];
        [optionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [optionBtn addTarget:self action:@selector(optionClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

//点击选项按钮
- (void) optionClick:(UIButton *) sender {
    for (UIButton *answerBtn in self.answerView.subviews) {
        if (answerBtn.currentTitle == nil) {
            answerBtn.tag = sender.tag;
            sender.hidden = YES;
            [answerBtn setTitle:sender.currentTitle forState:UIControlStateNormal];
            break;
        }
    }
    BOOL isFull = YES;
    NSMutableString *input = [NSMutableString string];
    for (UIButton *answerBtn in self.answerView.subviews) {
        if (answerBtn.currentTitle == nil) {
            isFull = NO;
            break;
        }
        [input appendString:answerBtn.currentTitle];
    }
    if (isFull) {
        SYQuestion *question = self.questions[self.index];
        if ([input isEqualToString:question.answer]) {
            [self setColor:[UIColor blueColor]];
            int coin = self.coinView.currentTitle.intValue;
            coin += 500;
            [self.coinView setTitle:[NSString stringWithFormat:@"%d", coin] forState:UIControlStateNormal];
            if (self.index != self.questions.count - 1) {
                self.optionView.userInteractionEnabled = NO;
                [self performSelector:@selector(nextClick) withObject:nil afterDelay:1.0];
            }
        } else {
            [self setColor:[UIColor redColor]];
        }
    }
}

//点击答案按钮
- (void) answerClick:(UIButton *) sender {
    for (UIButton *optionBtn in self.optionView.subviews) {
        if (sender.tag == optionBtn.tag) {
            optionBtn.hidden = NO;
            [sender setTitle:nil forState:UIControlStateNormal];
            break;
        }
    }
    [self setColor:[UIColor blackColor]];
}

//设置答案按钮字体颜色
- (void) setColor:(UIColor *) color {
    for (UIButton *answerBtn in self.answerView.subviews) {
        [answerBtn setTitleColor:color forState:UIControlStateNormal];
    }
}

//没有金币的警告
- (void) coinAlert {
    if (self.coinView.currentTitle.intValue <= 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"对不起" message:@"你没有金币了" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { NSLog(@"1"); }];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        self.promptView.enabled = NO;
    }
}

@end
