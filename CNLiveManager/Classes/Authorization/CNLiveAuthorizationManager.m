//
//  CNLiveAuthorizationManager.h
//  CNLiveManager
//
//  Created by 153993236@qq.com on 07/22/2019.
//  Copyright (c) 2019 153993236@qq.com. All rights reserved.
//

#import "CNLiveAuthorizationManager.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <Photos/Photos.h>

@interface CNLiveAuthorizationManager ()

@end
@implementation CNLiveAuthorizationManager
#pragma mark - 获取跟控制器
+ (UIViewController *)getRootController{
    UIViewController *vc = [UIApplication sharedApplication].delegate.window.rootViewController;
    return vc;
}

#pragma mark - 相机
+ (void)getAVAuthorizationStatus:(void (^)(void))block{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        switch (status) {
            case AVAuthorizationStatusNotDetermined: {
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if (granted) {
                        dispatch_sync(dispatch_get_main_queue(), ^{
                            block();
                        });
                        NSLog(@"用户第一次同意了访问相机权限 - - %@", [NSThread currentThread]);
                    } else {
                        NSLog(@"用户第一次拒绝了访问相机权限 - - %@", [NSThread currentThread]);
                    }
                }];
                break;
            }
            case AVAuthorizationStatusAuthorized: {
                block();
                break;
            }
            case AVAuthorizationStatusDenied: {
                NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
                NSString *app_Name = [infoDict objectForKey:@"CFBundleDisplayName"];
                if (app_Name == nil) {
                    app_Name = [infoDict objectForKey:@"CFBundleName"];
                }
                NSString *messageString = [NSString stringWithFormat:@"请在iPhone的\"设置 - 隐私 - 相机\"选项中,允许%@访问你的相机", app_Name];
                UIAlertController *alertC = [UIAlertController alertControllerWithTitle:nil message:messageString preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"好的" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                }];
                
                [alertC addAction:alertA];
                [[self getRootController] presentViewController:alertC animated:YES completion:nil];
                break;
            }
            case AVAuthorizationStatusRestricted: {
                NSLog(@"因为系统原因, 无法访问相册");
                break;
            }
                
            default:
                break;
        }
        return;
    }

}

#pragma mark - 相册
+ (void)getPHAuthorizationStatus:(void (^)(void))block{
    // 1.获取当前App的相册授权状态
    PHAuthorizationStatus authorizationStatus = [PHPhotoLibrary authorizationStatus];
    
    // 2.判断授权状态
    if (authorizationStatus == PHAuthorizationStatusAuthorized) {
        // 2.1 如果已经授权, 保存图片(调用步骤2的方法)
        block();
        
    } else if (authorizationStatus == PHAuthorizationStatusNotDetermined) { // 如果没决定, 弹出指示框, 让用户选择
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            // 如果用户选择授权, 则保存图片
            if (status == PHAuthorizationStatusAuthorized) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    block();
                });
            }
        }];
        
    } else {
        NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
        NSString *app_Name = [infoDict objectForKey:@"CFBundleDisplayName"];
        if (app_Name == nil) {
            app_Name = [infoDict objectForKey:@"CFBundleName"];
        }
        NSString *messageString = [NSString stringWithFormat:@"请在iPhone的\"设置 - 隐私 - 相机\"选项中,允许%@访问你的相册", app_Name];
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:nil message:messageString preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"好的" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertC addAction:alertA];
        [[self getRootController] presentViewController:alertC animated:YES completion:nil];
    }
}

@end
