//
//  ViewController.m
//  手势操作
//
//  Created by jason on 2016/9/24.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    /**
     * 默认情况下,控件只能监听到一种手势
     * 如果要监听到多个手势,设置一个代理的方法,告知它允许多个手势并存
     */
    [super viewDidLoad];
    [self createRotationGest];
    [self createPinchGest];
    [self createPanGest];
}

/**
 创建拖拽手势操作
 */
- (void)createPanGest {
    UIPanGestureRecognizer *panGest = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestView:)];
    // 在需要手势操作的view上添加手势对象
    [self.imageView addGestureRecognizer:panGest];
}

/**
 拖拽时调用
 */
- (void)panGestView:(UIPanGestureRecognizer *)panGest {
    // panGest.view 触摸的view
    // 拖拽的距离也是一个累加
    CGPoint trans = [panGest translationInView:panGest.view];
    // 设置图片移动
    CGPoint center = self.imageView.center;
    center.x += trans.x;
    center.y += trans.y;
    self.imageView.center = center;
    // 清除距离累加
    [panGest setTranslation:CGPointZero inView:panGest.view];
}

/**
 创建旋转手势操作
 */
- (void)createRotationGest {
    UIRotationGestureRecognizer *rotationGest = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGestView:)];
    // 在需要手势操作的view上添加手势对象
    [self.imageView addGestureRecognizer:rotationGest];
}

/**
 旋转时调用
 */
- (void)rotationGestView:(UIRotationGestureRecognizer *)rotationGest {
    // 旋转的角度也是一个累加的过程
    NSLog(@"旋转角度 %f", rotationGest.rotation);
    // 设置图片旋转
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotationGest.rotation);
    // 清除旋转角度的累加
    rotationGest.rotation = 0;
}

/**
 创建捏合手势操作
 */
- (void)createPinchGest {
    // 创建捏合手势
    UIPinchGestureRecognizer *pinchGest = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGestView:)];
    // 在需要手势操作的view上添加手势对象
    [self.imageView addGestureRecognizer:pinchGest];
    // 设置代理,在任何手势方法里都可以定义,定义一次即可
    pinchGest.delegate = self;
}

/**
 捏合时调用
 */
- (void)pinchGestView:(UIPinchGestureRecognizer *)pinGest {
    // 缩放的比例是一个累加的过程
    NSLog(@"缩放比例 %f", pinGest.scale);
    // 设置图片缩放
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinGest.scale, pinGest.scale);
    // 让比例还原,不要累加,解决办法,重新设置scale
    pinGest.scale = 1;
}

/**
 创建轻扫手势操作
 */
- (void)createSwipeGest {
    // 创建轻扫手势
    UISwipeGestureRecognizer *swipeGest = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestView:)];
    // 属性
    // UISwipeGestureRecognizerDirectionRight  向右轻扫
    // UISwipeGestureRecognizerDirectionLeft   向左轻扫
    // UISwipeGestureRecognizerDirectionUp     向上
    // UISwipeGestureRecognizerDirectionDown   向下
    swipeGest.direction = UISwipeGestureRecognizerDirectionDown;
    // 在需要手势操作的view上添加手势对象
    [self.imageView addGestureRecognizer:swipeGest];
}

/**
 轻扫时调用
 */
- (void)swipeGestView:(UISwipeGestureRecognizer *)swipeGest {
    NSLog(@"%s", __func__);
}

/**
 创建长按手势操作
 */
- (void)createLongGest {
    // 创建长按手势对象
    UILongPressGestureRecognizer *longGest = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longGestView:)];
    // 长按的时间
    longGest.minimumPressDuration = 2;
    // 长按时,距离触摸点可移动的距离
    longGest.allowableMovement = 30;
    // 在需要手势操作的view上添加手势对象
    [self.imageView addGestureRecognizer:longGest];
}

/**
 长按时调用
 */
- (void)longGestView:(UILongPressGestureRecognizer *)longGest {
    NSLog(@"%s",__func__);
    if (longGest.state == 1) {
        NSLog(@"长按手势开始");
    } else {
        NSLog(@"长按手势结束");
    }
}

/**
 创建点击手势操作
 */
- (void)createTapGest {
    // 创建敲击手势对象
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    // 需要点击的次数
    tap.numberOfTapsRequired = 1;
    // 需要几根手指
    tap.numberOfTouchesRequired = 1;
    // 在需要手势操作的view上添加手势对象
    [self.view addGestureRecognizer:tap];
    // 给手势对象添加监听的方法
    [tap addTarget:self action:@selector(clickView:)];
}

/**
 点击view时显示或隐藏图片
 */
- (void)clickView:(UIView *)view {
    self.imageView.hidden = !self.imageView.hidden;
}

//#pragma mark UIGestureRecognizer的代理方法
// 告诉view能否接收触摸事件
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    CGPoint point = [touch locationInView:touch.view];
//    //点击view左侧响应,右侧不响应
//    if (point.x <= touch.view.bounds.size.width * 0.5) {
//        return YES;
//    }
//    return NO;
//}

// 允许监听多个事件
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
