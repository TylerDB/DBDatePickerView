//
//  NSArray+DBBlock.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (DBBlock)

- (void)db_each:(void (^)(id object))block;
- (void)db_eachWithIndex:(void (^)(id object, NSUInteger index))block;
- (NSArray *)db_map:(id (^)(id object))block;
- (NSArray *)db_filter:(BOOL (^)(id object))block;
- (NSArray *)db_reject:(BOOL (^)(id object))block;
- (id)db_detect:(BOOL (^)(id object))block;
- (id)db_reduce:(id (^)(id accumulator, id object))block;
- (id)db_reduce:(id)initial withBlock:(id (^)(id accumulator, id object))block;

@end
