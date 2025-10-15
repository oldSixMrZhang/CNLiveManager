//
//  CNLiveAuthorizationManager.h
//  CNLiveManager
//
//  Created by 153993236@qq.com on 07/22/2019.
//  Copyright (c) 2019 153993236@qq.com. All rights reserved.
//

/**
 * 权限
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CNLiveAuthorizationManager : NSObject

#pragma mark - 相机
+ (void)getAVAuthorizationStatus:(void (^)(void))block;

#pragma mark - 相册
+ (void)getPHAuthorizationStatus:(void (^)(void))block;

@end

NS_ASSUME_NONNULL_END
