//
//  UIViewController+DBNavigaiton.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIViewController+DBNavigaiton.h"
#import <objc/runtime.h>

@implementation UIViewController (DBNavigaiton)

- (void)setNavigationTitle:(NSString *)navigationTitle{
    self.navigationItem.title = navigationTitle;
}

- (NSString *)navigationTitle{
    return self.navigationItem.title;
}

- (BOOL)disablePopGesture{
    return [objc_getAssociatedObject(self,@selector(disablePopGesture)) boolValue];
}

- (void)setDisablePopGesture:(BOOL)disablePopGesture{
    objc_setAssociatedObject(self, @selector(disablePopGesture), @(disablePopGesture), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)dismissFromParent{
    return [objc_getAssociatedObject(self,@selector(dismissFromParent)) boolValue];
}

- (void)setDismissFromParent:(BOOL)dismissFromParent{
    objc_setAssociatedObject(self, @selector(dismissFromParent), @(dismissFromParent), OBJC_ASSOCIATION_ASSIGN);
}

@end
