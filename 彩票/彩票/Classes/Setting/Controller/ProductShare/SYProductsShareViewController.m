//
//  SYProductsShareViewController.m
//  彩票
//
//  Created by jason on 2016/10/11.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYProductsShareViewController.h"
#import "SYProduct.h"
#import "SYProductCell.h"

@interface SYProductsShareViewController ()

@property (nonatomic, strong) NSArray *products;

@end

@implementation SYProductsShareViewController

- (NSArray *)products {
    if (!_products) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSArray *productArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *tmpProducts = [NSMutableArray array];
        for (NSDictionary *dict in productArr) {
            SYProduct *product = [SYProduct productWithDict:dict];
            [tmpProducts addObject:product];
        }
        _products = tmpProducts;
    }
    return _products;
}

// 重用的ID
static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init {
#warning UICollectionViewController初始化的时候，需要一个 "布局参数"
    // 流水布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    if (self = [super initWithCollectionViewLayout:flowLayout]) {
        // 最终的cell的大小,是由流水布局决定的,xib是决定不了
        // 设置cell的尺寸
        flowLayout.itemSize = CGSizeMake(80, 100);
        // 设置cell行间距
        flowLayout.minimumLineSpacing = 50;
        // 设置cell列间距
        // flowLayout.minimumInteritemSpacing = 50;
        // 设置cell四边距
        flowLayout.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置背景
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // 注册一个可循环引用的cell
    // [self.collectionView registerClass:[SYProductCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"SYProductCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
}

#pragma mark <UICollectionViewDataSource>

/**
 共有几组
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

/**
 每组里的个数
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SYProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // 设置模型
    cell.product = self.products[indexPath.row];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
