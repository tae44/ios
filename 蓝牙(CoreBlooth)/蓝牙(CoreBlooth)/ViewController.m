//
//  ViewController.m
//  蓝牙(CoreBlooth)
//
//  Created by jason on 2016/11/1.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController () <CBCentralManagerDelegate,CBPeripheralDelegate>
/**中央管理者*/
@property (nonatomic, strong) CBCentralManager *mgr;
/**保存着所有外部设备的数组*/
@property (nonatomic, strong) NSMutableArray *peripherals;

@end

@implementation ViewController

- (CBCentralManager *)mgr {
    if (!_mgr) {
        _mgr = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    }
    return _mgr;
}

- (NSMutableArray *)peripherals {
    if (!_peripherals) {
        _peripherals = [NSMutableArray array];
    }
    return _peripherals;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 扫描所有的外围设备
    // serviceUUIDs:可以将你想要扫描的服务的外围设备传入(传nil,扫描所有的外围设备)
    [self.mgr scanForPeripheralsWithServices:nil options:nil];
}

/**
 状态发生改变的时候会执行该方法(蓝牙4.0没有打开变成打开状态就会调用该方法)

 */
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {}

/**
 当发现外围设备的时候会调用该方法

 @param peripheral 发现的外围设备
 @param advertisementData 外围设备发出信号
 @param RSSI 信号强度
 */
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    if (![self.peripherals containsObject:peripheral]) {
        [self.peripherals addObject:peripheral];
    }
}

/**
 连接上外围设备的时候会调用该方法

 @param peripheral 连接上的外围设备
 */
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    // 扫描所有服务
    // serviceUUIDs:指定要扫描该外围设备的哪些服务(传nil,扫描所有的服务)
    [peripheral discoverServices:nil];
    // 设置代理
    peripheral.delegate = self;
}

/**
 发现外围设备的服务会来到该方法(扫描到服务之后直接添加peripheral的services)

 */
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
    for (CBService *service in peripheral.services) {
        if ([service.UUID.UUIDString isEqualToString:@"123"]) {
            // characteristicUUIDs : 可以指定想要扫描的特征(传nil,扫描所有的特征)
            [peripheral discoverCharacteristics:nil forService:service];
        }
    }
}

/**
 当扫描到某一个服务的特征的时候会调用该方法

 @param service 在哪一个服务里面的特征
 */
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
    for (CBCharacteristic *characteristic in service.characteristics) {
        if ([characteristic.UUID.UUIDString isEqualToString:@"456"]) {
            // 拿到特征,和外围设备进行交互
        }
    }
}

/**
 连接设备

 */
- (void)connect:(CBPeripheral *)peripheral {
    [self.mgr connectPeripheral:peripheral options:nil];
}

@end
