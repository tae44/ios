//
//  SYContact.m
//  通讯录
//
//  Created by 123 on 16/9/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYContact.h"

@implementation SYContact

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.tel forKey:@"tel"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.tel = [aDecoder decodeObjectForKey:@"tel"];
    }
    return self;
}

@end
