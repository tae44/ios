//
//  ViewController.m
//  喜马拉雅
//
//  Created by 123 on 16/8/26.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIButton *lastButton;

@property (weak, nonatomic) IBOutlet UIScrollView *imgScrollView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) BOOL reverse;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat maxH = CGRectGetMaxY(self.lastButton.frame);
    self.scrollView.contentSize = CGSizeMake(0, maxH);
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 54, 0);
    
    int count = 5;
    CGSize size = self.imgScrollView.frame.size;
    for (int i = 0; i < count; i++) {
        NSString *imgName = [NSString stringWithFormat:@"img_%02d", i+1];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
        [self.imgScrollView addSubview:imgView];
        imgView.frame = CGRectMake(i * size.width, 0, size.width, size.height);
    }
    self.imgScrollView.contentSize = CGSizeMake(count * size.width, 0);
    self.imgScrollView.showsHorizontalScrollIndicator = NO;
    self.imgScrollView.pagingEnabled = YES;
    self.pageControl.numberOfPages = count;
    self.imgScrollView.delegate = self;
    [self timerAddToRunLoop];
}

- (void) timerAddToRunLoop {
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(nextImg) userInfo:nil repeats:YES];
    self.timer = timer;
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void) nextImg {
    NSInteger page = self.pageControl.currentPage;
    if (self.pageControl.currentPage == self.pageControl.numberOfPages - 1) {
        page--;
        self.reverse = YES;
    } else if (self.pageControl.currentPage == 0) {
        page++;
        self.reverse = NO;
    } else {
        self.reverse ? page-- : page ++;
    }
    [UIView animateWithDuration:1.0 animations:^{
        self.imgScrollView.contentOffset = CGPointMake(page * self.imgScrollView.frame.size.width, 0);
    }];
}

- (void) scrollViewDidScroll:(UIScrollView *) scrollView {
    int page = (scrollView.contentOffset.x + scrollView.frame.size.width / 2)/ scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}

- (void) scrollViewWillBeginDragging:(UIScrollView *) scrollView {
    [self.timer invalidate];
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *) scrollView {
    [self timerAddToRunLoop];
}

@end
