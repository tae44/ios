//
//  SYHtmlPage.h
//  彩票
//
//  Created by jason on 2016/10/10.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYHtmlPage : NSObject
/**网页json文件中的title属性*/
@property (nonatomic, copy) NSString *title;
/**网页json文件中的html属性*/
@property (nonatomic, copy) NSString *html;
/**网页json文件中的id属性*/
@property (nonatomic, copy) NSString *ID;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)htmlPageWithDict:(NSDictionary *)dict;

@end
