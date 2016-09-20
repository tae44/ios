//
//  SYPieView.h
//  饼状图
//
//  Created by jason on 16/9/20.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYPieView : UIView

/**存有各个数据的数组*/
@property (nonatomic, strong) NSArray *sections;
/**存有各个数据颜色的数组*/
@property (nonatomic, strong) NSArray *sectionColors;

@end
