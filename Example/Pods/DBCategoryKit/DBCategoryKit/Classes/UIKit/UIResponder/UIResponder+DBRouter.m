//
//  UIResponder+DBRouter.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIResponder+DBRouter.h"

@implementation UIResponder (DBRouter)

- (void)db_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    [[self nextResponder] db_routerEventWithName:eventName userInfo:userInfo];
}

@end
