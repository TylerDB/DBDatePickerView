//
//  NSUserDefaults+DBiCloudSync.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (DBiCloudSync)

- (void)db_setValue:(id)value  forKey:(NSString *)key iCloudSync:(BOOL)sync;
- (void)db_setObject:(id)value forKey:(NSString *)key iCloudSync:(BOOL)sync;

- (id)db_valueForKey:(NSString *)key  iCloudSync:(BOOL)sync;
- (id)db_objectForKey:(NSString *)key iCloudSync:(BOOL)sync;

- (BOOL)db_synchronizeAlsoiCloudSync:(BOOL)sync;

@end

NS_ASSUME_NONNULL_END
