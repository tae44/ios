//
//  ViewController.m
//  打地鼠
//
//  Created by 123 on 16/9/7.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *oneRow;
@property (weak, nonatomic) IBOutlet UIImageView *twoRow;
@property (weak, nonatomic) IBOutlet UIImageView *threeRow;

//存有地鼠位置坐标的数组
@property (nonatomic, strong) NSArray *moles;
//存有地鼠对象的数组
@property (nonatomic, strong) NSMutableArray *marmots;

@end

@implementation ViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (NSMutableArray *)marmots {
    if (!_marmots) {
        _marmots  = [NSMutableArray array];
    }
    return _marmots;
}

- (NSArray *)moles {
    if (!_moles) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"mole" ofType:@"plist"];
        _moles = [NSArray arrayWithContentsOfFile:path];
    }
    return _moles;
}

- (void)createMarmotOn:(UIImageView *)row withIndex:(int)x{
    for (int i = x; i < 3 + x; i++) {
        UIButton *marmotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [marmotBtn setImage:[UIImage imageNamed:@"Mole01"] forState:UIControlStateNormal];
        [marmotBtn setImage:[UIImage imageNamed:@"Mole04"] forState:UIControlStateHighlighted];
        [row addSubview:marmotBtn];
        row.userInteractionEnabled = YES;
        marmotBtn.frame = CGRectFromString(self.moles[i]);
        [self.marmots addObject:marmotBtn];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //增加地鼠
    [self createMarmotOn:self.oneRow withIndex:0];
    [self createMarmotOn:self.twoRow withIndex:3];
    [self createMarmotOn:self.threeRow withIndex:6];
}

- (void)viewDidAppear:(BOOL)animated {
    int num = arc4random() % 9;
    UIImageView *mar = self.marmots[num];
    [UIView animateWithDuration:0.5 animations:^{
        mar.transform = CGAffineTransformMakeTranslation(0, 90);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            mar.transform = CGAffineTransformMakeTranslation(0, 0);
        }];
        [self performSelector:@selector(viewDidAppear:) withObject:nil afterDelay:num/100];
    }];
}

@end
