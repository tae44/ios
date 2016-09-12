//
//  SYItem.m
//  freight
//
//  Created by 123 on 16/9/2.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYItem.h"

@implementation SYItem

- (instancetype) initWithDic:(NSDictionary *) dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype) itemWithDic:(NSDictionary *) dic {
    return [[self alloc] initWithDic:dic];
}

/**
 *  创建plist文件的路径
 *
 *  @return plist文件路径
 */
+ (NSString *)createFileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath = [paths objectAtIndex:0];
    NSDate *date = [NSDate date];
    NSDateFormatter *ndf = [[NSDateFormatter alloc] init];
    ndf.dateFormat = @"yyyy-MM-dd";
    NSString *time = [ndf stringFromDate:date];
    NSString *fileName = [plistPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", time]];
    return fileName;
}

+ (NSMutableArray *) itemList {
    NSString *path = [self createFileName];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        SYItem *item = [SYItem itemWithDic:dic];
        [tmpArray addObject:item];
    }
    return tmpArray;
}

@end
