//
//  ViewController.m
//  01-内购
//
//  Created by apple on 15/2/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import <StoreKit/StoreKit.h>

@interface ViewController () <SKProductsRequestDelegate, SKPaymentTransactionObserver>

@property(nonatomic,strong)NSArray *products;

- (IBAction)restore:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.加载想要销售的商品(NSArray)
    NSString *path = [[NSBundle mainBundle] pathForResource:@"products.plist" ofType:nil];
    NSArray *productsArray = [NSArray arrayWithContentsOfFile:path];
    
    // 2.取出所有想要销售商品的productId(NSArray)
    NSArray *productIdsArray = [productsArray valueForKeyPath:@"productId"];
    
    // 3.将所有的productId放入NSSet当中
    NSSet *productIdsSet = [NSSet setWithArray:productIdsArray];
    
    // 4.创建一个请求对象
    SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdsSet];
    
    // 4.1.设置代理
    request.delegate = self;
    
    // 5.开始请求可销售的商品
    [request start];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}

/**
 *  当请求到可销售的商品的时候,会调用该方法
 */
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    for (SKProduct *product in response.products) {
        NSLog(@"%@", product.localizedTitle);
        NSLog(@"%@", product.localizedDescription);
        NSLog(@"%@", product.price);
        NSLog(@"%@", product.productIdentifier);
    }
    
    // 1.保留所有的可销售商品
    self.products = response.products;
    
    // 2.刷新数据
    [self.tableView reloadData];
}

#pragma mark - tableView的数据源和代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ProductCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    // 1.取出模型数据
    SKProduct *product = self.products[indexPath.row];
    
    // 2.展示在cell上面
    cell.textLabel.text = product.localizedTitle;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", product.price];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.取出模型数据
    SKProduct *product = self.products[indexPath.row];
    
    // 2.购买
    [self buyProduct:product];
}

#pragma mark - 用户购买的方法
- (void)buyProduct:(SKProduct *)product
{
    // 1.创建票据
    SKPayment *payment = [SKPayment paymentWithProduct:product];
    
    // 2.添加SKPaymentQueue的监听者
//    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    
    // 2.将票据加入交易队列
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

/**
    当交易队列当中,有交易状态发生改变的时候会执行该方法
 */
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    /*
     SKPaymentTransactionStatePurchasing, 正在购买
     SKPaymentTransactionStatePurchased, 已经购买(向服务器发送请求,给用户东西,停止该交易)
     SKPaymentTransactionStateFailed, 购买失败
     SKPaymentTransactionStateRestored 恢复购买成功(向服务器发送请求,给用户东西,停止该交易)
     SKPaymentTransactionStateDeferred (iOS8-->用户还未决定最终状态)
     */
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchasing:
                NSLog(@"用户正在购买");
                break;
            case SKPaymentTransactionStatePurchased:
                // 请求给用户物品
                NSLog(@"用户购买成功");
                [queue finishTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                NSLog(@"用户购买失败");
                break;
            case SKPaymentTransactionStateRestored:
                // 请求给用户物品
                NSLog(@"用户恢复购买成功");
                [queue finishTransaction:transaction];
                break;
            case SKPaymentTransactionStateDeferred:
                NSLog(@"用户还未决定");
                break;
            default:
                break;
        }
        
        [queue finishTransaction:transaction];
    }
}

- (IBAction)restore:(id)sender {
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}
@end
