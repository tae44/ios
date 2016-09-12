//
//  ViewController.m
//  move
//
//  Created by 123 on 16/8/18.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton * headImage;

- (IBAction) move:(UIButton *) but;

- (IBAction) bigOrSmall:(UIButton *) btn;

@end

@implementation ViewController

- (IBAction) move:(UIButton *) but {
    int tag = but.tag;
    CGPoint center = self.headImage.center;
    switch (tag) {
        case 1:
            center.y -= 10;
            break;
        case 2:
            center.x -= 10;
            break;
        case 3:
            center.y += 10;
            break;
        case 4:
            center.x += 10;
            break;
        default:
            break;
    }
    self.headImage.center = center;
}

- (IBAction) bigOrSmall:(UIButton *) btn {
    int tag = btn.tag;
    CGRect bounds = self.headImage.bounds;
    switch (tag) {
        case 5:
            bounds.size.height += 20;
            bounds.size.width += 20;
            break;
        case 6:
            bounds.size.height -= 20;
            bounds.size.width -= 20;
            break;
        default:
            break;
    }
    self.headImage.bounds = bounds;
}

@end
