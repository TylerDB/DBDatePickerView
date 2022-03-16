//
//  NSException+DBTrace.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSException (DBTrace)

- (NSArray *)db_backtrace;

@end

NS_ASSUME_NONNULL_END
