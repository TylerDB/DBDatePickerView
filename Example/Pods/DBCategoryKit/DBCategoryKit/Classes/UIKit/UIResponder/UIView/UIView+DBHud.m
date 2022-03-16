//
//  UIView+DBHud.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIView+DBHud.h"
#import <objc/runtime.h>
#import <MBProgressHUD/MBProgressHUD.h>

@implementation UIView (DBHud)

- (void)db_showHUD{
    [self db_showHUD:@"请稍候"];
}

- (void)db_showHUD:(NSString * _Nullable)message{
    @synchronized (self) {
        [self endEditing:YES];
        
        MBProgressHUD *hud = [self db_HUD];
        if (hud == nil) {
            hud = [[MBProgressHUD alloc]initWithView:self];
            [hud setRemoveFromSuperViewOnHide:YES];
            [hud setSquare:YES];
            hud.label.font = [UIFont systemFontOfSize:15];
            hud.label.numberOfLines = -1;
            [self setDb_HUD:hud];
        }
        
        if (hud.superview != self) {
            [self addSubview:hud];
        }
        [self bringSubviewToFront:hud];
        
        hud.label.text = message;
        [hud showAnimated:YES];
    }
}

- (void)db_hideHUD{
    [self.db_HUD hideAnimated:YES];
    [self setDb_HUD:nil];
}

- (MBProgressHUD *)db_HUD{
    return objc_getAssociatedObject(self, @selector(db_HUD));
}

- (void)setDb_HUD:(MBProgressHUD *)hud{
    objc_setAssociatedObject(self, @selector(db_HUD), hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)db_toastError:(NSError * _Nullable)error{
    [self db_toast:error.userInfo[@"msg"]];
}

- (void)db_toast:(NSString *)text{
    [self db_toast:text duration:2];
}

- (void)db_toast:(NSString *)text duration:(NSTimeInterval)duration{
    if ([text length] == 0) {
        return;
    }
    
    MBProgressHUD *hud = [[MBProgressHUD alloc]initWithView:self];
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = MBProgressHUDModeText;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.userInteractionEnabled = NO;
    hud.label.text = text;
    hud.label.numberOfLines = -1;
    
    [self addSubview:hud];
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:duration];
}

@end
