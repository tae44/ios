//
//  FlagView.m
//  02.国旗选择
//
//  Created by Apple on 14/12/26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "FlagView.h"
#import "Flag.h"

@interface FlagView ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation FlagView

+(instancetype)flagView{
    return [[[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil] lastObject];
}

-(void)setFlag:(Flag *)flag{
    
    _flag = flag;
    
    self.nameLabel.text = flag.name;
    self.imageView.image = [UIImage imageNamed:flag.icon];
}

@end
