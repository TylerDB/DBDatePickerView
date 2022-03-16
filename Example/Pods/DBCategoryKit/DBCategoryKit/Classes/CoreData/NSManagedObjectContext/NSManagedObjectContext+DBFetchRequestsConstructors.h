//
//  NSManagedObjectContext+DBFetchRequestsConstructors.h
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSManagedObjectContext (DBFetchRequestsConstructors)

/* Create fetch request to fetch one object using given key and value. Usefull to fetch objects on their uid key  */
- (NSFetchRequest *)db_fetchRequestForEntityObject:(NSString *)entityName usingValue:(id)value forKey:(NSString *)key returningAsFault:(BOOL)fault;

/* Create fetch request to fetch one object using given predicate
 */
- (NSFetchRequest *)db_fetchRequestForEntityObject:(NSString *)entityName usingPredicate:(NSPredicate *)predicate returningAsFault:(BOOL)fault;

/* Create fetch request to fetch all objects for given entity.
 */
- (NSFetchRequest *)db_fetchRequestForEntityObjects:(NSString *)entityName returningAsFault:(BOOL)fault;

/* Create fetch request to fetch all objects using given predicate
 */
- (NSFetchRequest *)db_fetchRequestForEntityObjects:(NSString *)entityName usingPredicate:(NSPredicate *)predicate returningAsFault:(BOOL)fault;

/* Create fetch request to fetch all objects for given entity and sort them.
 */
- (NSFetchRequest *)db_fetchRequestForEntityObjects:(NSString *)entityName usingSortDescriptors:(NSArray *)sortDescriptors returningAsFault:(BOOL)fault;

/* Create fetch request to fetch all objects for given entity, using predicate and sort them.
 */
- (NSFetchRequest *)db_fetchRequestForEntityObjects:(NSString *)entityName usingPredicate:(NSPredicate *)predicate usingSortDescriptors:(NSArray *)sortDescriptors returningAsFault:(BOOL)fault;

@end

NS_ASSUME_NONNULL_END
