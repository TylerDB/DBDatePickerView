//
//  UIView+DBFind.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (DBFind)

/**
 *  @brief  找到指定类名的SubView对象
 *
 *  @param clazz SubVie类名
 *
 *  @return view对象
 */
- (id)db_findSubViewWithSubViewClass:(Class)clazz;

/**
 *  @brief  找到指定类名的SuperView对象
 *
 *  @param clazz SuperView类名
 *
 *  @return view对象
 */
- (id)db_findSuperViewWithSuperViewClass:(Class)clazz;

/**
 *  @brief  找到并且resign第一响应者
 *
 *  @return 结果
 */
- (BOOL)db_findAndResignFirstResponder;

/**
 *  @brief  找到第一响应者
 *
 *  @return 第一响应者
 */
- (UIView *)db_findFirstResponder;

/**
 *  @brief  找到当前view所在的viewcontroler
 */
@property (readonly) UIViewController *db_viewController;

/**
 *  @brief  找到当前view所在的navigationController
 */
@property (readonly) UINavigationController *db_naviController;

@end

NS_ASSUME_NONNULL_END
