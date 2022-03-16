//
//  UINavigationController+DBStackManager.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (DBStackManager)

/**
 *  @brief  寻找Navigation中的某个viewcontroler对象
 *
 *  @param className viewcontroler名称
 *
 *  @return viewcontroler对象
 */
- (id)db_findViewController:(NSString*)className;

/**
 *  @brief  判断是否只有一个RootViewController
 *
 *  @return 是否只有一个RootViewController
 */
- (BOOL)db_isOnlyContainRootViewController;

/**
 *  @brief  RootViewController
 *
 *  @return RootViewController
 */
- (UIViewController *)db_rootViewController;

/**
 *  @brief  返回指定的viewcontroler
 *
 *  @param className 指定viewcontroler类名
 *  @param animated  是否动画
 *
 *  @return pop之后的viewcontrolers
 */
- (NSArray *)db_popToViewControllerWithClassName:(NSString*)className animated:(BOOL)animated;

/**
 *  @brief  pop n层
 *
 *  @param level  n层
 *  @param animated  是否动画
 *
 *  @return pop之后的viewcontrolers
 */
- (NSArray *)db_popToViewControllerWithLevel:(NSInteger)level animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
