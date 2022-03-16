//
//  UIViewController+DBHud.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIViewController+DBHud.h"
#import <DBCategoryKit/UIView+DBHud.h>

@implementation UIViewController (DBHud)

- (void)db_showHUD{
    [self.view db_showHUD];
}

- (void)db_showHUD:(NSString *)message{
    [self.view db_showHUD:message];
}

- (void)db_hideHUD{
    [self.view db_hideHUD];
}

- (void)db_toastError:(NSError *)error{
    [self.view db_toastError:error];
}

- (void)db_toast:(NSString *)text{
    [self.view db_toast:text];
}

- (void)db_toast:(NSString *)text duration:(NSTimeInterval)duration{
    [self.view db_toast:text duration:duration];
}

@end
