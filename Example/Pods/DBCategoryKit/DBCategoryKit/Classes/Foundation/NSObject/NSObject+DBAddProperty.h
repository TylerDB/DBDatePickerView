//
//  NSObject+DBAddProperty.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DBAddProperty)

/**
 *  @brief  catgory runtime实现get set方法增加一个字符串属性
 */
@property (nonatomic,strong) NSString *db_stringProperty;

/**
 *  @brief  catgory runtime实现get set方法增加一个NSInteger属性
 */
@property (nonatomic,assign) NSInteger db_integerProperty;

@end

NS_ASSUME_NONNULL_END
