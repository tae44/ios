//
//  ViewController.m
//  ImageBrowse
//
//  Created by 123 on 16/8/19.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel * indexLabel;

@property (weak, nonatomic) IBOutlet UIImageView * image;

@property (weak, nonatomic) IBOutlet UILabel * contentLabel;

@property (nonatomic, assign) int index;

@property (nonatomic, strong) NSArray * array;

@property (weak, nonatomic) IBOutlet UIButton * preButton;

@property (weak, nonatomic) IBOutlet UIButton * nextButton;

- (IBAction) preImage;

- (IBAction) nextImage;

- (void) changeData;

@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    [self changeData];
}

- (NSArray *) array {
    if (_array == nil) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"imageData" ofType:@"plist"];
        _array = [NSArray arrayWithContentsOfFile:path];
    }
    return _array;
}

- (void) changeData {
    self.indexLabel.text = [NSString stringWithFormat:@"%d/%zd", self.index+1, self.array.count];
    self.image.image = [UIImage imageNamed:self.array[self.index][@"image"]];
    self.contentLabel.text = self.array[self.index][@"content"];
    self.preButton.enabled = (self.index != 0);
    self.nextButton.enabled = (self.index != self.array.count-1);
}

- (IBAction) preImage {
    self.index--;
    [self changeData];
}

- (IBAction) nextImage {
    self.index++;
    [self changeData];
}
@end
