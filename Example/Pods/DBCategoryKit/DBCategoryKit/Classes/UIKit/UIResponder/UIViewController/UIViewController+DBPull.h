//
//  UIViewController+DBPull.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (DBPull)

- (void)db_addPullHeader:(UIScrollView *_Nullable)scrollView;
- (void)db_didPullHeader:(UIScrollView *_Nullable)scrollView;

- (void)db_addPullFooter:(UIScrollView *_Nullable)scrollView;
- (void)db_didPullFooter:(UIScrollView *_Nullable)scrollView;

@end

NS_ASSUME_NONNULL_END
