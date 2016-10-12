//
//  CZProductCell.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-3.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZProductCell.h"
#import "CZProduct.h"

@interface CZProductCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameField;

@end

@implementation CZProductCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)awakeFromNib{
    self.iconView.layer.cornerRadius = 10;
    self.iconView.layer.masksToBounds = YES;
}


-(void)setProduct:(CZProduct *)product{
    _product = product;
    
    self.iconView.image = [UIImage imageNamed:_product.icon];
    self.nameField.text = _product.title;
}

@end
