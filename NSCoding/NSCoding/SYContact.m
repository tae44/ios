//
//  SYContact.m
//  NSCoding
//
//  Created by jason on 16/9/15.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYContact.h"

@implementation SYContact

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    //添加自己属性的存储
    [aCoder encodeObject:self.tel forKey:@"tel"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.tel = [aDecoder decodeObjectForKey:@"tel"];
    }
    return self;
}

@end
