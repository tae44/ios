//
//  SYPerson.h
//  NSCoding
//
//  Created by jason on 16/9/15.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

//只有对象遵守了NSCoding协议才可以使用NSKeyedArchiver进行数据存储
@interface SYPerson : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) int age;

@end
