//
//  CNLivePageJumpManager.h
//  CNLiveManager
//
//  Created by 153993236@qq.com on 07/22/2019.
//  Copyright (c) 2019 153993236@qq.com. All rights reserved.
//

/**
 * 页面跳转
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CNLivePageJumpManager : NSObject

// jump
+ (void)jumpViewController:(UIViewController *)controller;
+ (void)jumpViewController:(UIViewController *)controller animated:(BOOL)animated;

// back
+ (void)backViewController;
+ (void)backViewController:(BOOL)animated;

// push
+ (void)pushViewController:(UIViewController *)controller;
+ (void)pushViewController:(UIViewController *)controller animated:(BOOL)animated;

// pop
+ (void)popViewController;
+ (void)popViewControllerAnimated:(BOOL)animated;
+ (void)popToViewController:(UIViewController *)viewController animated:(BOOL)animated;
+ (void)popToRootViewControllerAnimated:(BOOL)animated;

// present
+ (void)presentViewController:(UIViewController *)controller;
+ (void)presentViewController:(UIViewController *)controller animated:(BOOL)animated;
+ (void)presentViewController:(UIViewController *)controller animated:(BOOL)animated completion:(nullable void(^)(void))completion;

// dismiss
+ (void)dismissViewController;
+ (void)dismissViewControllerAnimated:(BOOL)animated completion:(nullable void(^)(void))completion;

@end

NS_ASSUME_NONNULL_END
