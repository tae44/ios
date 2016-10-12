//
//  CZSettingItem.h
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-2.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CZSettingItemOption)();

@interface CZSettingItem : NSObject

@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *title;

@property(nonatomic,copy)NSString *subTitle;

@property(nonatomic,assign)Class vcClass;//控制器类型

@property(nonatomic,copy)CZSettingItemOption option;//点击cell要操作的事

+(instancetype)settingItemWithIcon:(NSString *)icon title:(NSString *)title vcClass:(Class)vcClass;


+(instancetype)settingItemWithIcon:(NSString *)icon title:(NSString *)title;

+(instancetype)settingItemWithTitle:(NSString *)title;
@end
