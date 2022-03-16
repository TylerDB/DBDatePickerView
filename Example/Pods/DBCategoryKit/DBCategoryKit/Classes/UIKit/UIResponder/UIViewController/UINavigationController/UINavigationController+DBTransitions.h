//
//  UINavigationController+DBTransitions.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (DBTransitions)

- (void)db_pushViewController:(UIViewController *)controller withTransition:(UIViewAnimationTransition)transition;

- (UIViewController *)db_popViewControllerWithTransition:(UIViewAnimationTransition)transition;

@end

NS_ASSUME_NONNULL_END
