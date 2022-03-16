//
//  UIViewController+DBPull.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIViewController+DBPull.h"
#import <DBCategoryKit/DBCategoryKitMacro.h>
#import <DBCategoryKit/UIScrollView+DBPull.h>

@implementation UIViewController (DBPull)

- (void)db_addPullHeader:(UIScrollView *)scrollView{
    @weakify(self)
    @weakify(scrollView)
    [scrollView db_addHeader:^{
        @strongify(self)
        @strongify(scrollView)
        [self db_didPullHeader:scrollView];
    }];
}

- (void)db_didPullHeader:(UIScrollView *)scrollView{
    
}

- (void)db_addPullFooter:(UIScrollView *)scrollView{
    @weakify(self)
    @weakify(scrollView)
    [scrollView db_addFooter:^{
        @strongify(self)
        @strongify(scrollView)
        [self db_didPullFooter:scrollView];
    }];
}

- (void)db_didPullFooter:(UIScrollView *)scrollView{
    
}

@end
