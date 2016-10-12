//
//  SYProduct.h
//  彩票
//
//  Created by jason on 2016/10/11.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYProduct : NSObject
/**图标名称*/
@property (nonatomic, copy) NSString *icon;
/**标题*/
@property (nonatomic, copy) NSString *title;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)productWithDict:(NSDictionary *)dict;

@end
