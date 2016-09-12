//
//  ViewController.m
//  Tomcat
//
//  Created by 123 on 16/8/19.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView * tomImage;

- (IBAction) drink;

- (IBAction) knock;

- (IBAction) eat;

- (IBAction) cymbal;

@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
}

- (void) animatinRepeatCount:(NSInteger) count andAnimatinName:(NSString *) name {
    if (self.tomImage.isAnimating) {
        return;
    }
    NSMutableArray * array = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        NSString * imageName = [NSString stringWithFormat:@"%@_%02d", name, i];
        NSString * path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
        UIImage * image = [UIImage imageWithContentsOfFile:path];
        [array addObject:image];
    }
    self.tomImage.animationImages = array;
    self.tomImage.animationRepeatCount = 1;
    self.tomImage.animationDuration = count * 0.05;
    [self.tomImage startAnimating];
    CGFloat delay = self.tomImage.animationDuration + 0.2;
    [self.tomImage performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:delay];
}

- (IBAction) drink {
    [self animatinRepeatCount:81 andAnimatinName:@"drink"];
}

- (IBAction) knock {
    [self animatinRepeatCount:81 andAnimatinName:@"knockout"];
}

- (IBAction) eat {
    [self animatinRepeatCount:40 andAnimatinName:@"eat"];
}

- (IBAction) cymbal {
    [self animatinRepeatCount:13 andAnimatinName:@"cymbal"];
}

@end
