//
//  NSManagedObject+DBExtensions.h
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import <CoreData/CoreData.h>
#import "NSManagedObjectContext+DBExtensions.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSManagedObject (DBExtensions)

+ (id)db_create:(NSManagedObjectContext *)context;
+ (id)db_create:(NSDictionary *)dict inContext:(NSManagedObjectContext *)context;
+ (id)db_find:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context;
+ (id)db_find:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors inContext:(NSManagedObjectContext *)context;
+ (NSArray *)db_all:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context;
+ (NSArray *)db_all:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors inContext:(NSManagedObjectContext *)context;
+ (NSUInteger)db_count:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)contex;
+ (NSString *)db_entityName;
+ (NSError *)db_deleteAll:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END
