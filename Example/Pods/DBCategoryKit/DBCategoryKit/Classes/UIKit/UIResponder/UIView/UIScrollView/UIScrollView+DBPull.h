//
//  UIScrollView+DBPull.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (DBPull)

- (void)db_addHeader:(void(^)(void))refreshingBlock;

- (void)db_removeHeader;

- (void)db_headerBeginRefreshing;

- (void)db_headerEndRefreshing;

- (void)db_addFooter:(void(^)(void))refreshingBlock;

- (void)db_removeFooter;

- (void)db_footerBeginRefreshing;

- (void)db_footerEndRefreshing;

- (void)db_footerEndRefreshing:(BOOL)hasMore;

- (void)db_resetNoMoreData;

@end

NS_ASSUME_NONNULL_END
