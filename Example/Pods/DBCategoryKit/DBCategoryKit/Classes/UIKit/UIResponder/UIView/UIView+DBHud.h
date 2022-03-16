//
//  UIView+DBHud.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DBHud)

- (void)db_showHUD;

- (void)db_showHUD:(NSString * _Nullable)message;

- (void)db_hideHUD;

- (void)db_toastError:(NSError * _Nullable)error;

- (void)db_toast:(NSString * _Nullable)text;

- (void)db_toast:(NSString * _Nullable)text duration:(NSTimeInterval)duration;

@end
