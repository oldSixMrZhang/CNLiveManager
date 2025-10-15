//
//  CNLiveNotificationManager.m
//  CNLiveManager
//
//  Created by 153993236@qq.com on 11/12/2019.
//  Copyright (c) 2019 153993236@qq.com. All rights reserved.
//

/**
 * 通知
 */

#import <Foundation/Foundation.h>
#import "CNLiveNotificationName.h"

NS_ASSUME_NONNULL_BEGIN

@interface CNLiveNotificationManager : NSObject

+ (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSNotificationName)aName object:(nullable id)anObject;

+ (void)postNotification:(NSNotification *)notification;
+ (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject;
+ (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

+ (void)removeObserver:(id)observer;
+ (void)removeObserver:(id)observer name:(nullable NSNotificationName)aName object:(nullable id)anObject;

@end

NS_ASSUME_NONNULL_END
