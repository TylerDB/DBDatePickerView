//
//  NSDictionary+DBJSONString.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (DBJSONString)

/**
 *  @brief NSDictionary转换成JSON字符串
 *
 *  @return  JSON字符串
 */
- (NSString *)db_JSONString;

@end

NS_ASSUME_NONNULL_END
