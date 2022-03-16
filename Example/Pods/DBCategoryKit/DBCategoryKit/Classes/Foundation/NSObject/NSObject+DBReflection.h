//
//  NSObject+DBReflection.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/4.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DBReflection)

//类名
- (NSString *)db_className;
+ (NSString *)db_className;

//父类名称
- (NSString *)db_superClassName;
+ (NSString *)db_superClassName;

//实例属性字典
- (NSDictionary *)db_propertyDictionary;

//属性名称列表
- (NSArray *)db_propertyKeys;
+ (NSArray *)db_propertyKeys;

//属性详细信息列表
- (NSArray *)db_propertiesInfo;
+ (NSArray *)db_propertiesInfo;

//格式化后的属性列表
+ (NSArray *)db_propertiesWithCodeFormat;

//方法列表
- (NSArray *)db_methodList;
+ (NSArray *)db_methodList;

- (NSArray *)db_methodListInfo;

//创建并返回一个指向所有已注册类的指针列表
+ (NSArray *)db_registedClassList;

//实例变量
+ (NSArray *)db_instanceVariable;

//协议列表
- (NSDictionary *)db_protocolList;
+ (NSDictionary *)db_protocolList;

- (BOOL)db_hasPropertyForKey:(NSString*)key;
- (BOOL)db_hasIvarForKey:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
