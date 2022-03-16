//
//  NSMutableAttributedString+DBExtension.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (DBExtension)

/**
 创建NSMutableAttributedString
 
 @param string 需要创建的text
 */
+ (instancetype)db_mutableAttributedString:(NSString *)string;

/**
 设置range字体
 
 @param font 字体
 */
- (void)db_addAttributeFont:(UIFont *)font range:(NSRange)range;

/**
 设置range颜色
 
 @param color 需要设置的颜色
 @param range 长度
 */
- (void)db_addAttributeColor:(UIColor *)color range:(NSRange)range;

/**
 设置段落样式
 
 @param style 段落样式
 @param range 需要设置样式的长度
 */
- (void)db_addAttributeParagraphStyle:(NSMutableParagraphStyle *)style range:(NSRange)range;

@end

NS_ASSUME_NONNULL_END
