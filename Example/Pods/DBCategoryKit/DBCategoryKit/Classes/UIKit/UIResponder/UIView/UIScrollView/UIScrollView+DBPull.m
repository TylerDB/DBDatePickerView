//
//  UIScrollView+DBPull.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIScrollView+DBPull.h"
#import <MJRefresh/MJRefresh.h>

@implementation UIScrollView (DBPull)

- (void)db_addHeader:(void (^)(void))refreshingBlock{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:refreshingBlock];
    self.mj_header = header;
}

- (void)db_removeHeader{
    self.mj_header = nil;
}

- (void)db_headerBeginRefreshing{
    [self.mj_header beginRefreshing];
}

- (void)db_headerEndRefreshing{
    [self.mj_header endRefreshing];
}

- (void)db_addFooter:(void (^)(void))refreshingBlock{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:refreshingBlock];
    self.mj_footer = footer;
}

- (void)db_removeFooter{
    self.mj_footer = nil;
}

- (void)db_footerBeginRefreshing{
    [self.mj_footer beginRefreshing];
}

- (void)db_footerEndRefreshing{
    [self db_footerEndRefreshing:YES];
}

- (void)db_footerEndRefreshing:(BOOL)hasMore{
    if (hasMore) {
        [self.mj_footer endRefreshing];
    }else{
        [self.mj_footer endRefreshingWithNoMoreData];
    }
}

- (void)db_resetNoMoreData{
    [self.mj_footer resetNoMoreData];
}

@end
