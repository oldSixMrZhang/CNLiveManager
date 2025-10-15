//
//  CNLivePageJumpManager.h
//  CNLiveManager
//
//  Created by 153993236@qq.com on 07/22/2019.
//  Copyright (c) 2019 153993236@qq.com. All rights reserved.
//

#import "CNLivePageJumpManager.h"

@interface CNLivePageJumpManager ()

@end
@implementation CNLivePageJumpManager
#pragma mark - 获取跟控制器
+ (UINavigationController *)getNavigationController{
    UIViewController *vc = [UIApplication sharedApplication].delegate.window.rootViewController;
    if ([vc isKindOfClass:[UINavigationController class]]){
        return (UINavigationController *)vc;
    }
    else if ([vc isKindOfClass:[UITabBarController class]]){
        UIViewController *select = [((UITabBarController *)vc) selectedViewController];
        if ([select isKindOfClass:[UINavigationController class]]){
            return (UINavigationController *)select;
        }
    }
    return nil;
}

#pragma mark - jump
+ (void)jumpViewController:(UIViewController *)controller{
    [self jumpViewController:controller animated:YES];
}
+ (void)jumpViewController:(UIViewController *)controller animated:(BOOL)animated{
    UINavigationController *nav = [self getNavigationController];
    if(nav){
        [nav pushViewController:controller animated:animated];
    }
    else{
        UIViewController *vc = [UIApplication sharedApplication].delegate.window.rootViewController;
        [vc presentViewController:controller animated:animated completion:nil];
    }
}

#pragma mark - back
+ (void)backViewController{
    [self backViewController:YES];
}
+ (void)backViewController:(BOOL)animated{
    UINavigationController *nav = [self getNavigationController];
    if(nav){
        [nav popViewControllerAnimated:animated];
    }
    else{
        UIViewController *vc = [UIApplication sharedApplication].delegate.window.rootViewController;
        [vc dismissViewControllerAnimated:animated completion:nil];
    }
}

#pragma mark - Push
+ (void)pushViewController:(UIViewController *)controller{
    [self pushViewController:controller animated:YES];
}
+ (void)pushViewController:(UIViewController *)controller animated:(BOOL)animated{
    [[self getNavigationController] pushViewController:controller animated:animated];
}

#pragma mark - Pop
+ (void)popViewController{
    [self popViewControllerAnimated:YES];
}
+ (void)popViewControllerAnimated:(BOOL)animated{
    [[self getNavigationController] popViewControllerAnimated:animated];
}
+ (void)popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [[self getNavigationController] popToViewController:viewController animated:animated];
}
+ (void)popToRootViewControllerAnimated:(BOOL)animated{
    [[self getNavigationController] popToRootViewControllerAnimated:animated];
}

#pragma mark - Present
+ (void)presentViewController:(UIViewController *)controller{
    [self presentViewController:controller animated:YES];
}
+ (void)presentViewController:(UIViewController *)controller animated:(BOOL)animated{
    [self presentViewController:controller animated:animated completion:nil];
}
+ (void)presentViewController:(UIViewController *)controller animated:(BOOL)animated completion:(nullable void(^)(void))completion{
    [[self getNavigationController] presentViewController:controller animated:animated completion:completion];
}

#pragma mark - Dismiss
+ (void)dismissViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}
+ (void)dismissViewControllerAnimated:(BOOL)animated completion:(nullable void(^)(void))completion{
    [[self getNavigationController] dismissViewControllerAnimated:animated completion:completion];

}

@end
