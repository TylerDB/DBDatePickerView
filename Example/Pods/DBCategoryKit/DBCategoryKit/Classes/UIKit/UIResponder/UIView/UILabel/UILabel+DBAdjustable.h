//
//  UILabel+DBAdjustable.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (DBAdjustable)

//adjust
- (void)db_adjustLabelToMaximumSize:(CGSize)maxSize
                        minimumSize:(CGSize)minSize
                    minimumFontSize:(int)minFontSize;

- (void)db_adjustLabelToMaximumSize:(CGSize)maxSize
                    minimumFontSize:(int)minFontSize;

- (void)db_adjustLabelSizeWithMinimumFontSize:(int)minFontSize;

- (void)db_adjustLabel;

//suggest
- (CGSize)db_suggestedSizeForWidth:(CGFloat)width;

- (CGSize)db_suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width;

- (CGSize)db_suggestSizeForString:(NSString *)string width:(CGFloat)width;

/**
 * 垂直方向固定获取动态宽度的UILabel的方法
 *
 * @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (UILabel *)db_resizeLabelHorizontal;

/**
 *  水平方向固定获取动态宽度的UILabel的方法
 *
 *  @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (UILabel *)db_resizeLabelVertical;

/**
 *  垂直方向固定获取动态宽度的UILabel的方法
 *
 *  @param minimumWidth minimum width
 *
 *  @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (UILabel *)db_resizeLabelHorizontal:(CGFloat)minimumWidth;

/**
 *  水平方向固定获取动态宽度的UILabel的方法
 *
 *  @param minimumHeigh minimum height
 *
 *  @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (UILabel *)db_resizeLabelVertical:(CGFloat)minimumHeigh;

@end

NS_ASSUME_NONNULL_END
