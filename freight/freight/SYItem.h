//
//  SYItem.h
//  freight
//
//  Created by 123 on 16/9/2.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYItem : NSObject

/**商品名称*/
@property (nonatomic , copy) NSString *name;
/**商品数量*/
@property (nonatomic , assign) NSString *count;
/**商品价格*/
@property (nonatomic , assign) NSString *price;
/**商品重量*/
@property (nonatomic , assign) NSString *weight;

- (instancetype) initWithDic:(NSDictionary *) dic;

+ (instancetype) itemWithDic:(NSDictionary *) dic;

+ (NSMutableArray *) itemList;

+ (NSString *)createFileName;

@end
