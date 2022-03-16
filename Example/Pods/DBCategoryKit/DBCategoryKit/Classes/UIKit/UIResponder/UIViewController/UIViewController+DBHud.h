//
//  UIViewController+DBHud.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (DBHud)

- (void)db_showHUD;

- (void)db_showHUD:(NSString *_Nullable)message;

- (void)db_hideHUD;

- (void)db_toastError:(NSError *)error;

- (void)db_toast:(NSString *)text;

- (void)db_toast:(NSString*)text duration:(NSTimeInterval)duration;

@end

NS_ASSUME_NONNULL_END
