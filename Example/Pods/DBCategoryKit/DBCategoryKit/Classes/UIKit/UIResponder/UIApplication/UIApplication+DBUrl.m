//
//  UIApplication+DBPackage.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIApplication+DBUrl.h"

@implementation UIApplication (DBUrl)

-(void)db_openURL:(NSURL *)url completion:(void (^)(BOOL))completion{
    if (@available(iOS 10.0, *)) {
        [self openURL:url options:@{} completionHandler:completion];
    } else {
        BOOL ret = [self openURL:url];
        !completion?:completion(ret);
    }
}

-(void)db_openSettingsURLString{
    [self db_openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] completion:nil];
}

@end
