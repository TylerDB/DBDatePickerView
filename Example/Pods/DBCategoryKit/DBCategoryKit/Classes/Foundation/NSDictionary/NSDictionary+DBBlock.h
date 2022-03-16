//
//  NSDictionary+DBBlock.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (DBBlock)

- (void)db_each:(void (^)(id k, id v))block;
- (void)db_eachKey:(void (^)(id k))block;
- (void)db_eachValue:(void (^)(id v))block;
- (NSArray *)db_map:(id (^)(id key, id value))block;
- (NSDictionary *)db_pick:(NSArray *)keys;
- (NSDictionary *)db_omit:(NSArray *)key;

@end

NS_ASSUME_NONNULL_END
