//
//  UIView+DBScreenShot.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (DBScreenShot)

/**
 *  @brief  view截图
 *
 *  @return 截图
 */
- (UIImage *)db_screenshot;

/**
 *  @brief  截图一个view中所有视图 包括旋转缩放效果
 *
 *  @param maxWidth 限制缩放的最大宽度 保持默认传0
 *
 *  @return 截图
 */
- (UIImage *)db_screenshot:(CGFloat)maxWidth;

@end

NS_ASSUME_NONNULL_END
