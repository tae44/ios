//
//  testStatic.m
//  testStatic
//
//  Created by jason on 2016/10/19.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "testStatic.h"

@implementation testStatic

+ (NSInteger)sumWithNum1:(NSInteger)num1 andNum2:(NSInteger)num2 {
    return num1 + num2;
}

+ (UIImage *)loadImage {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"lufy" ofType:@".png" inDirectory:@"images.bundle"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    return image;
}

@end
