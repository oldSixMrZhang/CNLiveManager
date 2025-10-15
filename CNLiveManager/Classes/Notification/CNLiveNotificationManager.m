//
//  CNLiveNotificationManager.m
//  CNLiveManager
//
//  Created by 153993236@qq.com on 11/12/2019.
//  Copyright (c) 2019 153993236@qq.com. All rights reserved.
//

#import "CNLiveNotificationManager.h"

@implementation CNLiveNotificationManager
#pragma mark - add
+ (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSNotificationName)aName object:(nullable id)anObject{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:aSelector name:aName object:anObject];
}

#pragma mark - post
+ (void)postNotification:(NSNotification *)notification{
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}
+ (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject{
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject];
}
+ (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo{
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject userInfo:aUserInfo];
}

#pragma mark - remove
+ (void)removeObserver:(id)observer{
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

+ (void)removeObserver:(id)observer name:(nullable NSNotificationName)aName object:(nullable id)anObject{
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:aName object:anObject];

}



@end
