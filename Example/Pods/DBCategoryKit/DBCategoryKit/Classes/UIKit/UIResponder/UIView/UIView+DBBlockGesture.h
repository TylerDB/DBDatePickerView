//
//  UIView+DBBlockGesture.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^DBGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (DBBlockGesture)

/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)db_addTapActionWithBlock:(DBGestureActionBlock)block;
/**
 *  @brief  添加长按手势
 *
 *  @param block 代码块
 */
- (void)db_addLongPressActionWithBlock:(DBGestureActionBlock)block;

@end

NS_ASSUME_NONNULL_END
