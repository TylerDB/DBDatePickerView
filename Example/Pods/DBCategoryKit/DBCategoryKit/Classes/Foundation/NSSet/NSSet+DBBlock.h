//
//  NSSet+DBBlock.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (DBBlock)

- (void)db_each:(void (^)(id))block;
- (void)db_eachWithIndex:(void (^)(id, int))block;
- (NSArray *)db_map:(id (^)(id object))block;
- (NSArray *)db_select:(BOOL (^)(id object))block;
- (NSArray *)db_reject:(BOOL (^)(id object))block;
- (NSArray *)db_sort;
- (id)db_reduce:(id(^)(id accumulator, id object))block;
- (id)db_reduce:(id)initial withBlock:(id(^)(id accumulator, id object))block;

@end
