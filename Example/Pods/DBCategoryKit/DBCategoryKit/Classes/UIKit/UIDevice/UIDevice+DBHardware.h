//
//  UIDevice+DBHardware.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (DBHardware)

+ (NSString *)db_platform;
+ (NSString *)db_platformString;


+ (NSString *)db_macAddress;

//Return the current device CPU frequency
+ (NSUInteger)db_cpuFrequency;
// Return the current device BUS frequency
+ (NSUInteger)db_busFrequency;
//current device RAM size
+ (NSUInteger)db_ramSize;
//Return the current device CPU number
+ (NSUInteger)db_cpuNumber;
//Return the current device total memory

/// 获取iOS系统的版本号
+ (NSString *)db_systemVersion;
/// 判断当前系统是否有摄像头
+ (BOOL)db_hasCamera;
/// 获取手机内存总量, 返回的是字节数
+ (NSUInteger)db_totalMemoryBytes;
/// 获取手机可用内存, 返回的是字节数
+ (NSUInteger)db_freeMemoryBytes;

/// 获取手机硬盘空闲空间, 返回的是字节数
+ (long long)db_freeDiskSpaceBytes;
/// 获取手机硬盘总空间, 返回的是字节数
+ (long long)db_totalDiskSpaceBytes;

@end

NS_ASSUME_NONNULL_END
