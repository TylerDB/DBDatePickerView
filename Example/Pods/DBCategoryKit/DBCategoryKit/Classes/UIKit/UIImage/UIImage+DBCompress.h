//
//  UIImage+DBCompress.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DBCompress)

/**
 图片压缩（仿微信）
 */
- (UIImage *)db_timelineCompress:(Boolean)isSession;

/**
 *  压缩上传图片到指定字节
 *
 *  @param image     压缩的图片
 *  @param maxLength 压缩后最大字节大小
 *
 *  @return 压缩后图片的二进制
 */
+ (NSData *)db_compressImage:(UIImage *)image toMaxLength:(NSInteger) maxLength maxWidth:(NSInteger)maxWidth;

/**
 *  获得指定size的图片
 *
 *  @param image   原始图片
 *  @param newSize 指定的size
 *
 *  @return 调整后的图片
 */
+ (UIImage *)db_resizeImage:(UIImage *) image withNewSize:(CGSize) newSize;

/**
 *  通过指定图片最长边，获得等比例的图片size
 *
 *  @param image       原始图片
 *  @param imageLength 图片允许的最长宽度（高度）
 *
 *  @return 获得等比例的size
 */
+ (CGSize)db_scaleImage:(UIImage *) image withLength:(CGFloat) imageLength;


+ (UIImage*)db_resizableHalfImage:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
