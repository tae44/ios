//
//  SYSettingItem.h
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义一个block,无返回值,无参
typedef void (^OperationBlock)();

@interface SYSettingItem : NSObject
/**cell里icon名称*/
@property (nonatomic, copy) NSString *icon;
/**cell里title名称*/
@property (nonatomic, copy) NSString *title;
/**cell里子标题名称*/
@property (nonatomic, copy) NSString *subTitle;
/**控制器的类型*/
@property (nonatomic, assign) Class vcClass;
/**存储一个特殊的Block操作*/
@property (nonatomic, copy) OperationBlock operation;

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title;
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title vcClass:(Class)vcClass;

@end
