//
//  UIView+DBFind.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIView+DBFind.h"

@implementation UIView (DBFind)

- (id)db_findSubViewWithSubViewClass:(Class)clazz{
    for (id subView in self.subviews) {
        if ([subView isKindOfClass:clazz]) {
            return subView;
        }
    }
    return nil;
}

- (id)db_findSuperViewWithSuperViewClass:(Class)clazz{
    if (self == nil) {
        return nil;
    } else if (self.superview == nil) {
        return nil;
    } else if ([self.superview isKindOfClass:clazz]) {
        return self.superview;
    } else {
        return [self.superview db_findSuperViewWithSuperViewClass:clazz];
    }
}

- (BOOL)db_findAndResignFirstResponder {
    if (self.isFirstResponder) {
        [self resignFirstResponder];
        return YES;
    }
    for (UIView *v in self.subviews) {
        if ([v db_findAndResignFirstResponder]) {
            return YES;
        }
    }
    return NO;
}

- (UIView *)db_findFirstResponder {
    if (([self isKindOfClass:[UITextField class]] || [self isKindOfClass:[UITextView class]])
        && (self.isFirstResponder)) {
        return self;
    }
    for (UIView *v in self.subviews) {
        UIView *fv = [v db_findFirstResponder];
        if (fv) {
            return fv;
        }
    }
    return nil;
}

- (UIViewController *)db_viewController{
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    } while (responder);
    return nil;
}

- (UINavigationController *)db_naviController{
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)responder;
        }else if ([responder isKindOfClass:[UIViewController class]]) {
            UIViewController *vc = (UIViewController *)responder;
            if (vc.navigationController) {
                return (UINavigationController *)(vc.navigationController);
            }
        }
        responder = responder.nextResponder;
    } while (responder);
    return nil;
}

@end
