//
//  SYSettingGroup.h
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYSettingGroup : NSObject
/**组头标题*/
@property (nonatomic, copy) NSString *headerTitle;
/**组尾标题*/
@property (nonatomic, copy) NSString *footerTitle;
/**组每一行的数据模型*/
@property (nonatomic, strong) NSArray *items;

@end
