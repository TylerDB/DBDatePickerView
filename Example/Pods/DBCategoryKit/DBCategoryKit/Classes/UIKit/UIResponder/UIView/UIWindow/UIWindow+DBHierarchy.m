//
//  UIWindow+DBHierarchy.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIWindow+DBHierarchy.h"

@implementation UIWindow (DBHierarchy)

- (UIViewController*)db_topMostController
{
    UIViewController *topController = [self rootViewController];
    
    //  Getting topMost ViewController
    while ([topController presentedViewController])    topController = [topController presentedViewController];
    
    //  Returning topMost ViewController
    return topController;
}

- (UIViewController*)db_currentViewController;
{
    UIViewController *currentViewController = [self db_topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    
    return currentViewController;
}

@end
