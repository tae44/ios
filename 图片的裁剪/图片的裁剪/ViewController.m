//
//  ViewController.m
//  图片的裁剪
//
//  Created by jason on 2016/9/23.
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
    self.imageView.image = [UIImage circleImageWithImageName:@"papa" borderColor:[UIColor redColor] borderWidth:3];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 保存图片,先把图片转成NSData,然后调用其的write
    NSData *imgData = UIImagePNGRepresentation(self.imageView.image);
    [imgData writeToFile:@"/Users/jason/Desktop/circle.png" atomically:YES];
}

@end
