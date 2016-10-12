//
//  CZWheel.m
//  转盘
//
//  Created by Vincent_Guo on 14-9-7.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZWheel.h"
#import "CZWheelButton.h"
#define CZTransform2Angle(t) (atan2(t.b, t.a))
#define CZRotationSpeed (M_PI_4 / 100)

@interface CZWheel()
@property (weak, nonatomic) IBOutlet UIImageView *wheelImageView;

@property(nonatomic,weak)UIButton *selectedBtn;
@property(nonatomic,strong)CADisplayLink *link;


- (IBAction)start;

@end

@implementation CZWheel

+(instancetype)wheel{
    return [[[NSBundle mainBundle] loadNibNamed:@"CZWheel" owner:nil options:nil] lastObject];
}

-(void)awakeFromNib{
    self.wheelImageView.userInteractionEnabled = YES;
    
    //加载大图片
    UIImage *bigImage = [UIImage imageNamed:@"LuckyAstrology"];
        UIImage *bigImageSel = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    CGFloat scale = [UIScreen mainScreen].scale;
    NSLog(@"%f",scale);
    CGFloat astrologyImageH = bigImage.size.height * scale;
    CGFloat astrologyImageW = bigImage.size.width / 12 * scale;
    
    CGFloat angle  = M_PI / 6;
    for (int  i = 0; i < 12; i ++) {
        CZWheelButton *btn = [[CZWheelButton alloc] init];
        btn.bounds = CGRectMake(0, 0, 68, 143);
        //btn.backgroundColor = [UIColor redColor];
        
        //设置背景
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        btn.tag = i;
        
        //设置Normal Image
        CGRect smallRect = CGRectMake(astrologyImageW * i, 0, astrologyImageW, astrologyImageH);
        CGImageRef smallImageRef = CGImageCreateWithImageInRect(bigImage.CGImage, smallRect);

        [btn setImage:[UIImage imageWithCGImage:smallImageRef] forState:UIControlStateNormal];
        
        //设置Selected Image
        CGImageRef smallImageSelRef = CGImageCreateWithImageInRect(bigImageSel.CGImage, smallRect);
        [btn setImage:[UIImage imageWithCGImage:smallImageSelRef] forState:UIControlStateSelected];
        //设置锚点
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        
        CGFloat centerXY = self.wheelImageView.bounds.size.width * 0.5;
        btn.layer.position = CGPointMake(centerXY, centerXY);
        
        //旋转
        btn.transform = CGAffineTransformMakeRotation(angle * i);
        
        //监听事件
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //添加按钮
        [self.wheelImageView addSubview:btn];
        
        //默认选中第一个
        if (i == 0) {
            [self btnClick:btn];
        }
        
    }
}


-(void)btnClick:(UIButton *)btn{
    NSLog(@"%d",btn.tag);
    //重复选择，直接返回
    if (self.selectedBtn == btn) return;

    //取消以前的选中按钮
    self.selectedBtn.selected = NO;

    //设置当前选中按钮
    btn.selected = YES;
    self.selectedBtn = btn;
}

- (IBAction)start {
    
    if (self.link) {
        [self stopRotating];
    }
    
    self.userInteractionEnabled = NO;
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    
    anim.duration = 1.5 ;
    anim.toValue = @(M_PI * 2 * 10);

    anim.delegate = self;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.wheelImageView.layer addAnimation:anim forKey:nil];
    
    
}



/**
 *  开始不停的旋转
 */
-(void)startRotating{
    
    if (self.link) return;
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];

}

-(void)update{
    //CGFloat angle = M_PI_4 / 100;
    self.wheelImageView.transform = CGAffineTransformRotate(self.wheelImageView.transform, CZRotationSpeed);

}

/**
 *  停止的旋转
 */
-(void)stopRotating{
    [self.link invalidate];
    self.link = nil;
    
    //self.wheelImageView.transform = CGAffineTransformMakeRotation(-CZTransform2Angle(_selectedBtn.transform));
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    self.userInteractionEnabled = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (!self.link) {
            [self startRotating];
        }
    });
}
@end
