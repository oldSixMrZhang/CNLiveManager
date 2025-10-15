//
//  CNLiveRootControllerManager.m
//  CNLiveManager
//
//  Created by 153993236@qq.com on 11/12/2019.
//  Copyright (c) 2019 153993236@qq.com. All rights reserved.
//

#import "CNLiveRootControllerManager.h"

@implementation CNLiveRootControllerManager

/**
 * 设置主页面
 */
+ (void)enterMainUI{
    // 判断是否展示引导页
    if (@"是否展示引导页") {
        
        
    }else{
        if(@"是否登录"){
            // 设置TabBar面
            [self enterTabBarUI];
            
        }else{
            // 设置登录页面
            [self enterLoginUI];
            
        }
    }
    
}

/**
 * 设置TabBar面
 */
+ (void)enterTabBarUI{
    for (UIView *view in [UIApplication sharedApplication].delegate.window.subviews) {
        [view removeFromSuperview];
    }
    [UIApplication sharedApplication].delegate.window.rootViewController = nil;
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tabBar];
    [UIApplication sharedApplication].delegate.window.rootViewController = nav;
    
}

/**
 * 设置登录页面
 */
+ (void)enterLoginUI{
    for (UIView *view in [UIApplication sharedApplication].delegate.window.subviews) {
        [view removeFromSuperview];
    }
    [UIApplication sharedApplication].delegate.window.rootViewController = nil;
//    CNLiveLoginController *login = [[CNLiveLoginController alloc]init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:login];
//    [UIApplication sharedApplication].delegate.window.rootViewController = nav;
    
}


@end
