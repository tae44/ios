//
//  ViewController.m
//  水印照片
//
//  Created by jason on 2016/9/21.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+SY.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage waterImageWithBgImageName:@"scene" waterImageName:@"logo" scale:4];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //生成一张有水印的图片,一定要获取UIImage对象,然后显示在imageView上
    //创建背景图片
    UIImage *bgImage = [UIImage imageNamed:@"scene"];
    // 创建一个位图【图片】，开启位图上下文
    // size:位图大小
    // opaque: alpha通道 YES:不透明/ NO透明 使用NO,生成的更清析
    // scale 比例 设置0.0为屏幕的比例
    // scale 是用于获取生成图片大小 比如位图大小：20X20 / 生成一张图片：（20 *scale X 20 *scale)
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 4);
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    //画水印
    UIImage *waterImage = [UIImage imageNamed:@"logo"];
    CGFloat waterScale = 0.4;
    CGFloat waterW = waterImage.size.width * waterScale;
    CGFloat waterH = waterImage.size.height * waterScale;
    CGFloat waterX = bgImage.size.width - waterW;
    CGFloat waterY = bgImage.size.height - waterH;
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    //从位图上下文获取当前编辑的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束当前位置编辑
    UIGraphicsEndImageContext();
    self.imageView.image = newImage;
}

@end
