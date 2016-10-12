//
//  CZProductsViewController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-3.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZProductsViewController.h"
#import "CZProduct.h"
#import "CZProductCell.h"
static NSString *CZProductCellID = @"ProductCell";
@interface CZProductsViewController ()

@property(nonatomic,strong)NSArray *products;

@end

@implementation CZProductsViewController

-(NSArray *)products{
    if (_products == nil) {
        
        NSString *path =[[NSBundle mainBundle] pathForResource:@"products" ofType:@"json"];
       
        //data
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSArray *productData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",productData);
        
        NSMutableArray *productsM = [NSMutableArray array];
        for (NSDictionary *dict in productData) {
            CZProduct *product = [CZProduct productWithDict:dict];
            [productsM addObject:product];
        }
        
        _products = productsM;
    }
    
    return _products;
}

-(id)init{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置cell尺寸
    layout.itemSize = CGSizeMake(80, 80);
    
    //设置水平间距
    layout.minimumInteritemSpacing = 0;
    
    //设置垂直间距
    layout.minimumLineSpacing = 20;

    //设置四边距
    layout.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    return [super initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@",self.products);
    self.collectionView.backgroundColor = CZBgColor;
    // Do any additional setup after loading the view.
    //注册一个cell 告诉collectionView将来怎么创建cell
    UINib *nib = [UINib nibWithNibName:@"CZProductCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:CZProductCellID];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.products.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CZProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CZProductCellID forIndexPath:indexPath];
    
    CZProduct *product = self.products[indexPath.row];
    cell.product = product;
   return cell;
}

//选中cell
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CZProduct *product = self.products[indexPath.row];
    UIApplication  *app = [UIApplication sharedApplication];
    CZLog(@"%@",indexPath);
//    
//    NSURL *url = [NSURL URLWithString:@"cz://cn.itcast.movies"];
//    //NSURL *url = [NSURL URLWithString:@"ios://cn.itcast.movies"];
    
//    [app openURL:[NSURL URLWithString:@"cn.itcast.movies"]];
//    return;
    
    NSString *urlStr = nil;
    if (product.schemes.length != 0) {
        urlStr = [NSString stringWithFormat:@"%@://%@",product.schemes,product.identifier];
    }else{
        urlStr = product.identifier;
    }
    
    
    if ([app canOpenURL:[NSURL URLWithString:urlStr]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
    }else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:product.appUrl]];
    }
    
    
    
}

@end
