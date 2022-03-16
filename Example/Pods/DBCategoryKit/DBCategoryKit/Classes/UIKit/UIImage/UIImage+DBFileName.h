//
//  UIImage+DBFileName.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DBFileName)

/**
 *  @brief  根据main bundle中的文件名读取图片
 *
 *  @param name 图片名
 *
 *  @return 有缓存的图片
 */
+ (UIImage *)db_imageWithFileName:(NSString *)name;

/**
 *
 *  根据指定bundle中的文件名读取图片
 *
 *  @param name   图片名
 *  @param bundle bundle
 *
 *  @return 有缓存的图片
 */
+ (UIImage *)db_imageWithFileName:(NSString *)name inBundle:(NSBundle*)bundle;

@end

NS_ASSUME_NONNULL_END
