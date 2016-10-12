//
//  CZTitleButton.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-8-16.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZTitleButton.h"
#import <Availability.h>

@interface CZTitleButton()

@property(nonatomic,strong)UIFont *titleFont;

@end



@implementation CZTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

//从xib或者storyboard创建的对象有调用此方法
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted{
    
}

-(void)setup{
    self.titleFont = [UIFont systemFontOfSize:14];
    self.titleLabel.font = self.titleFont;
    
    //设置图片居中
    self.imageView.contentMode = UIViewContentModeCenter;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{

    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleH = contentRect.size.height;
    
    CGFloat titleW;
    
  if (iOS7) {
//只有xcode5才会编译这段
#ifdef __IPHONE_7_0
        CZLog(@"__IPHONE_7_0");
        NSMutableDictionary *att = [NSMutableDictionary dictionary];
        att[NSFontAttributeName] = self.titleFont;
        //计算标题的长度
        titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:att context:nil].size.width;
#else
        titleW = [self.currentTitle sizeWithFont:self.titleFont].width;
#endif
   }else{
        titleW = [self.currentTitle sizeWithFont:self.titleFont].width;
   }

    
    return CGRectMake(titleX, titleY, titleW, titleH);
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW = 30;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = contentRect.size.width -  imageW;
    CGFloat imageY = 0;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

@end
