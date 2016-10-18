//
//  ViewController.m
//  微信
//
//  Created by jason on 2016/10/18.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SessionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"session"]) {
        SessionViewController *sessionVc = segue.destinationViewController;
        sessionVc.appURLStr = self.appURLStr;
    }
}

@end
