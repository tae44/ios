//
//  ViewController.m
//  easyRPG
//
//  Created by 123 on 16/8/27.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYPerson.h"
#import "SYEnemy.h"

@interface ViewController ()

@property (nonatomic, strong) SYPerson *person;

@property (nonatomic, strong) SYEnemy *enemy;

//主角View
@property (weak, nonatomic) IBOutlet UIImageView *personView;

//敌人View
@property (weak, nonatomic) IBOutlet UIImageView *enemyView;

//主角血量Label
@property (weak, nonatomic) IBOutlet UILabel *personLifeLabel;

//敌人血量Label
@property (weak, nonatomic) IBOutlet UILabel *enemyLifeLabel;

- (IBAction) attack;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SYPerson *p1 = [[SYPerson alloc] initWithAttack:10 andGuard:5 andLife:100];
    SYEnemy *s1 = [[SYEnemy alloc] initWithAttack:10 andGuard:5 andLife:100];
    self.person = p1;
    self.enemy = s1;
    self.personLifeLabel.text = [NSString stringWithFormat:@"%d/100", self.person.life];
    self.enemyLifeLabel.text = [NSString stringWithFormat:@"%d/100", self.enemy.life];
}

//攻击方法
- (IBAction) attack {
    CGRect oldPersonFrame = self.personView.frame;
    CGRect tmpPersonFrame = self.personView.frame;
    tmpPersonFrame.origin.x += 50;
    [UIView animateWithDuration:1.0 animations:^{
        self.personView.frame = tmpPersonFrame;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            self.personView.frame = oldPersonFrame;
            self.enemyLifeLabel.text = [NSString stringWithFormat:@"%d/100", self.enemy.life];
        }];
    }];
    [self.person attackTo:self.enemy];
//    self.enemyLifeLabel.text = [NSString stringWithFormat:@"%d/100", self.enemy.life];
}

@end
