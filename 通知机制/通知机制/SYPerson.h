//
//  SYPerson.h
//  通知机制
//
//  Created by 123 on 16/9/2.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYPerson : NSObject

@property (nonatomic , copy) NSString *name;

- (void)shou:(NSNotification *)noti;

@end
