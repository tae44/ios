//
//  ViewController.m
//  转场动画
//
//  Created by jason on 2016/9/28.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#define DURATION 2

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/**存有图片名称的数组*/
@property (nonatomic, strong) NSMutableArray *images;
/**当前图片的索引*/
@property (nonatomic, assign) NSInteger currentIndex;

@end

@implementation ViewController

- (NSMutableArray *)images {
    if (!_images) {
        _images = [NSMutableArray array];
        for (NSInteger i = 1; i < 10; i++) {
            NSString *imgName = [NSString stringWithFormat:@"%ld", i];
            [_images addObject:imgName];
        }
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 点击图片
 */
- (IBAction)tapImageView:(UITapGestureRecognizer *)sender {
    // 判断点击的左边还是右边
    CGPoint point = [sender locationInView:sender.view];
    if (point.x <= sender.view.bounds.size.width * 0.5) {
        [self previous];
    } else {
        [self next];
    }
}

/**
 切换上一张图片
 */
- (void)previous {
    if (self.currentIndex == 0) {
        return;
    }
    self.currentIndex --;
    self.imageView.image = [UIImage imageNamed:self.images[self.currentIndex]];
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.subtype = kCATransitionFromLeft;
    animation.duration = 3;
    [self.imageView.layer addAnimation:animation forKey:nil];
}

/**
 * 提示:转场的动画的类型（type）和子头型(subtype) 能用字符串常量就用字符常量
 */

/**
 *******************************************************
 type:动画类型(比如：滴水效果，翻转效果...)
 -------------------------------------------------------
 fade kCATransitionFade 交叉淡化过渡
 moveIn kCATransitionMoveIn 新视图移到旧视图上面
 push kCATransitionPush 新视图把旧视图推出去
 reveal kCATransitionReveal 将旧视图移开,显示下面的新视图
 pageCurl               向上翻一页
 pageUnCurl             向下翻一页
 rippleEffect             滴水效果
 suckEffect 收缩效果，如一块布被抽走
 cube                   立方体效果
 oglFlip              上下左右翻转效果
 rotate     旋转效果
 cameraIrisHollowClose 相机镜头关上效果(不支持过渡方向)
 cameraIrisHollowOpen 相机镜头打开效果(不支持过渡方向)
 
 *******************************************************
 subtype: 动画方向(比如说是从左边进入，还是从右边进入...)
 ------------------------------------------------------
 kCATransitionFromRight;
 kCATransitionFromLeft;
 kCATransitionFromTop;
 kCATransitionFromBottom;
 
 当 type 为@"rotate"(旋转)的时候,它也有几个对应的 subtype,分别为:
 90cw 逆时针旋转 90°
 90ccw 顺时针旋转 90°
 180cw 逆时针旋转 180°
 180ccw  顺时针旋转 180°
 **/

/**
 切换下一张图片
 */
- (void)next {
    // 判断是否是最后一张
    if (self.currentIndex == self.images.count - 1) {
        return;
    }
    self.currentIndex ++;
    self.imageView.image = [UIImage imageNamed:self.images[self.currentIndex]];
    // 切换图片的时候使用转场动画
    CATransition *animation = [CATransition animation];
    // 设置转场动画的类型
    // 'fade', 'moveIn', 'push' , 'reveal'
    animation.type = kCATransitionFade;
    // 设置转场动画的子类型
    // 'fromLeft','fromRight','fromTop','fromBottom'
    animation.subtype = kCATransitionFromLeft;
    animation.duration = 3;
    [self.imageView.layer addAnimation:animation forKey:nil];
}

/**
 UIView的转场动画
 */
-(void)test3{
    //    UIViewAnimationOptionTransitionFlipFromLeft
    //    UIViewAnimationOptionTransitionFlipFromRight
    //    UIViewAnimationOptionTransitionCurlUp
    //    UIViewAnimationOptionTransitionCurlDown
    //    UIViewAnimationOptionTransitionCrossDissolve
    //    UIViewAnimationOptionTransitionFlipFromTop
    //    UIViewAnimationOptionTransitionFlipFromBottom
    [UIView transitionWithView:self.imageView duration:3 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        self.imageView.image = [UIImage imageNamed:@"2.jpg"];
    } completion:^(BOOL finished) {
        NSLog(@"动画执行完成");
    }];
}

/**
 UIView动画
 */
-(void)test1{
    [UIView beginAnimations:nil context:nil];
    //设置时间
    [UIView setAnimationDuration:3];
    //监听动画的完成
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(stop)];
    //实现动画代码
    self.imageView.center = CGPointMake(200, 280);
    [UIView commitAnimations];
}

-(void)stop{
    NSLog(@"%s",__func__);
}

@end
