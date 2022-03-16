//
//  NSMutableParagraphStyle+DBExtension.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableParagraphStyle (DBExtension)

/**
 创建样式
 
 @param paragraphSpacing 行间距 如果不想设置 填写 -1
 @return 段间距 如果不想设置填写 -1
 */
+ (instancetype)db_mutableParagraphStyleLineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat)paragraphSpacing;

/**
 段落开始缩进
 
 @param firstLineHeadInden 缩进距离（像素）
 */
- (void)db_firstLineHeadInden:(CGFloat)firstLineHeadInden;

/**
 全部缩进
 
 @param headIndent 缩进距离（像素）
 */
- (void)db_headIndent:(CGFloat)headIndent;

/**
 对齐方式
 
 @param alignment 对齐枚举
 */
- (void)db_alignment:(NSTextAlignment)alignment;

@end

NS_ASSUME_NONNULL_END
