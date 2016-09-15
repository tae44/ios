//
//  SYPerson.m
//  NSCoding
//
//  Created by jason on 16/9/15.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYPerson.h"

@implementation SYPerson

- (void)encodeWithCoder:(NSCoder *)aCoder {
    //指定每个属性怎么存储
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInt:self.age forKey:@"age"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    //读取数据 设置每个属性
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntForKey:@"age"];
    }
    return self;
}

@end
