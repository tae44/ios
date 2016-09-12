//
//  SYPerson.m
//  通知机制
//
//  Created by 123 on 16/9/2.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYPerson.h"

@implementation SYPerson

- (void)shou:(NSNotification *)noti {
    NSLog(@"收到通知");
    NSLog(@"%@", noti.name);
    NSLog(@"%@", noti.object);
    NSLog(@"%@", noti.userInfo);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
