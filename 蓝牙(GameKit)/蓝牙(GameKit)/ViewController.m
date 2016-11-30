//
//  ViewController.m
//  蓝牙(GameKit)
//
//  Created by jason on 2016/11/1.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import <GameKit/GameKit.h>

@interface ViewController () <GKPeerPickerControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
/**显示照片的view*/
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/**保留会话用户发送数据*/
@property (nonatomic, strong) GKSession *session;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 连接设备
 */
- (IBAction)connectDevice {
    // 创建查找设备的控制器
    GKPeerPickerController *ppc = [[GKPeerPickerController alloc] init];
    // 设置代理
    ppc.delegate = self;
    // 弹出控制器
    [ppc show];
}

/**
 设备连接成功后调用该方法

 @param peerID 设备节点ID
 @param session 会话(使用该会话对象来相互传递数据)
 */
- (void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session {
    // 保留会话
    self.session = session;
    // 设置数据接收者
    [self.session setDataReceiveHandler:self withContext:nil];
    // 退出查找设备的控制器
    [picker dismiss];
}

/**
 选择照片
 */
- (IBAction)chooseImage {
    // 判断照片源是否可用
    /*
     UIImagePickerControllerSourceTypePhotoLibrary 图片库
     UIImagePickerControllerSourceTypeCamera 相机
     UIImagePickerControllerSourceTypeSavedPhotosAlbum 相册
     */
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        return;
    }
    // 创建照片选择控制器
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    // 设置照片源
    ipc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    // 设置代理
    ipc.delegate = self;
    // 弹出控制器
    [self presentViewController:ipc animated:YES completion:nil];
}

/**
 当选中某一个照片的时候会调用该方法

 @param info 存放着照片信息
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    // 取出照片
    self.imageView.image = info[UIImagePickerControllerOriginalImage];
    // 退出控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
}

/**
 发送图片
 */
- (IBAction)sendImage {
    // 判断image为空直接返回
    if (!self.imageView.image) return;
    // 将UIImage转化成NSData
    // UIImagePNGRepresentation(UIImage *image)
    NSData *imageData = UIImageJPEGRepresentation(self.imageView.image, 0.5);
    // self.session sendData:(NSData *) toPeers:(NSArray *) withDataMode:(GKSendDataMode) error:(NSError *__autoreleasing *)
    // 发送照片
    /*
     GKSendDataReliable,        可靠传输(数据一定会被传达,如果中间网络发生状况,重新连接,再次传输)-->TCP
     GKSendDataUnreliable,      不可靠传输(数据只会发送一次,没有收到就算了)-->UDP
     */
    [self.session sendDataToAllPeers:imageData withDataMode:GKSendDataReliable error:nil];
}

/**
 当接受收到数据的时候会调用该方法

 @param data 接受到的数据
 @param peer 从哪一个节点接受到的数据
 @param session 会话
 */
- (void)receiveData:(NSData *)data fromPeer:(NSString *)peer inSession: (GKSession *)session context:(void *)context {
    // 将NSData转化成UIImage对象
    UIImage *receiveImage = [UIImage imageWithData:data];
    // 设置到imageView上
    self.imageView.image = receiveImage;
    // 将图片保存到相册当中
    UIImageWriteToSavedPhotosAlbum(receiveImage, nil, nil, nil);
}

@end
