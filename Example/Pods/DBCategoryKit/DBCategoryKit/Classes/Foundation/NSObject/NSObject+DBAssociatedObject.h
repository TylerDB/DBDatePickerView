//
//  NSObject+DBAssociatedObject.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DBAssociatedObject)

/**
 *  @brief  附加一个stong对象
 *
 *  @param value 被附加的对象
 *  @param key   被附加对象的key
 */
- (void)db_associateValue:(id)value withKey:(void *)key; // Strong reference

/**
 *  @brief  附加一个weak对象
 *
 *  @param value 被附加的对象
 *  @param key   被附加对象的key
 */
- (void)db_weaklyAssociateValue:(id)value withKey:(void *)key;

/**
 *  @brief  根据附加对象的key取出附加对象
 *
 *  @param key 附加对象的key
 *
 *  @return 附加对象
 */
- (id)db_associatedValueForKey:(void *)key;

@end

NS_ASSUME_NONNULL_END
