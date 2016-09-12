//
//  ViewController.m
//  通知机制
//
//  Created by 123 on 16/9/2.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYPerson.h"
#import "SYCompany.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SYPerson *p1 = [[SYPerson alloc] init];
    p1.name = @"p1";
    SYPerson *p2 = [[SYPerson alloc] init];
    p2.name = @"p2";
    SYCompany *c1 = [[SYCompany alloc] init];
    c1.name = @"三鹿";
    SYCompany *c2 = [[SYCompany alloc] init];
    c2.name = @"三元";
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:p1 selector:@selector(shou:) name:@"song" object:nil];
    [center postNotificationName:@"song" object:c1 userInfo:@{@"count":@2, @"tx":@"毒"}];
    [center postNotificationName:@"song" object:c2 userInfo:@{@"count":@1, @"tx":@"好"}];
}

@end
