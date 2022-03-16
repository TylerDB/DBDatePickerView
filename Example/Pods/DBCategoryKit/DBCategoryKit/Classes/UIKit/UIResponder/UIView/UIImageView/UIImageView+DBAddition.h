//
//  UIImageView+DBAddition.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (DBAddition)

/**
 *  @brief  根据bundle中的图片名创建imageview
 *
 *  @param imageName bundle中的图片名
 *
 *  @return imageview
 */
+ (id)db_imageViewWithImageNamed:(NSString*)imageName;

/**
 *  @brief  根据frame创建imageview
 *
 *  @param frame imageview frame
 *
 *  @return imageview
 */
+ (id)db_imageViewWithFrame:(CGRect)frame;

+ (id)db_imageViewWithStretchableImage:(NSString*)imageName Frame:(CGRect)frame;

/**
 *  @brief  创建imageview动画
 *
 *  @param imageArray 图片名称数组
 *  @param duration   动画时间
 *
 *  @return imageview
 */
+ (id)db_imageViewWithImageArray:(NSArray*)imageArray duration:(NSTimeInterval)duration;

- (void)db_setImageWithStretchableImage:(NSString*)imageName;

// 画水印
// 图片水印
- (void)db_setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect;
// 文字水印
- (void)db_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font;
- (void)db_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
