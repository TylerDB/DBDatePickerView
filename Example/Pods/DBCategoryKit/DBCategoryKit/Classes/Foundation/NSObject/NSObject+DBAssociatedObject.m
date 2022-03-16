//
//  NSObject+DBAssociatedObject.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSObject+DBAssociatedObject.h"
#import  <objc/runtime.h>

@implementation NSObject (DBAssociatedObject)

- (void)db_associateValue:(id)value withKey:(void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN);
}

- (void)db_weaklyAssociateValue:(id)value withKey:(void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (id)db_associatedValueForKey:(void *)key
{
    return objc_getAssociatedObject(self, key);
}

@end
