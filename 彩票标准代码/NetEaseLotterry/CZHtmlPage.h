//
//  CZHtml.h
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-4.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZHtmlPage : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *html;
@property(nonatomic,copy)NSString *ID;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)htmlPageWithDict:(NSDictionary *)dict;


@end
