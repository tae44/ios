//
//  SYMission.m
//  iShouldDO
//
//  Created by jason on 2016/9/26.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYMission.h"

@implementation SYMission

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.comment forKey:@"comment"];
    [aCoder encodeObject:self.date forKey:@"date"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.comment = [aDecoder decodeObjectForKey:@"comment"];
        self.date = [aDecoder decodeObjectForKey:@"date"];
    }
    return self;
}

@end
