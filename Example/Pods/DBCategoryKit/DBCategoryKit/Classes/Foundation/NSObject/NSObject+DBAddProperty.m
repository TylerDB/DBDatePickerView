//
//  NSObject+DBAddProperty.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSObject+DBAddProperty.h"
#import <objc/runtime.h>

static const void *DBStringProperty = &DBStringProperty;
static const void *DBIntegerProperty = &DBIntegerProperty;

@implementation NSObject (DBAddProperty)

@dynamic db_stringProperty;
@dynamic db_integerProperty;

- (void)setDb_stringProperty:(NSString *)db_stringProperty{
    objc_setAssociatedObject(self, DBStringProperty, db_stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)db_stringProperty{
    return objc_getAssociatedObject(self, DBStringProperty);
}

- (void)setDb_integerProperty:(NSInteger)db_integerProperty{
    NSNumber *number = [[NSNumber alloc]initWithInteger:db_integerProperty];
    objc_setAssociatedObject(self,DBIntegerProperty, number, OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)db_integerProperty{
    return [objc_getAssociatedObject(self, DBIntegerProperty) integerValue];
}

@end
