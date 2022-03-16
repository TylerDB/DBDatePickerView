//
//  UIResponder+DBRouter.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (DBRouter)

- (void)db_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
