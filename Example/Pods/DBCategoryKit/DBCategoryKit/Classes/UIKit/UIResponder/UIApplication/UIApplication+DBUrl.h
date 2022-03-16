//
//  UIApplication+DBPackage.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (DBUrl)

// options : @{UIApplicationOpenURLOptionUniversalLinksOnly : @NO} 现在用不到
-(void)db_openURL:(NSURL *)url completion:(void (^)(BOOL success))completion;

-(void)db_openSettingsURLString;

@end
