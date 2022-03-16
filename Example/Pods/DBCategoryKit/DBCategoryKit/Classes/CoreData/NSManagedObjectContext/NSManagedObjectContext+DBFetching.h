//
//  NSManagedObjectContext+DBFetching.h
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (DBFetching)

/* Fetch one object using given key and value. Usefull to fetch objects on their uid key
 * /!\ Warning, errors are ignored /!\
 */
- (id)db_fetchObject:(NSString *)entityName usingValue:(id)value forKey:(NSString *)key returningAsFault:(BOOL)fault;

/* Fetch one object using given predicate
 * /!\ Warning, errors are ignored /!\
 */
- (id)db_fetchObject:(NSString *)entityName usingPredicate:(NSPredicate *)predicate returningAsFault:(BOOL)fault;

/* Count all objects for given entity.
 * /!\ Warning, errors are ignored /!\
 */
- (NSInteger)db_countObjects:(NSString *)entityName;

/* Count all objects using given predicate
 * /!\ Warning, errors are ignored /!\
 */
- (NSInteger)db_countObjects:(NSString *)entityName usingPredicate:(NSPredicate *)predicate;

/* Fetch all objects for given entity.
 * /!\ Warning, errors are ignored /!\
 */
- (NSArray *)db_fetchObjects:(NSString *)entityName returningAsFault:(BOOL)fault;

/* Fetch all objects using given predicate
 * /!\ Warning, errors are ignored /!\
 */
- (NSArray *)db_fetchObjects:(NSString *)entityName usingPredicate:(NSPredicate *)predicate returningAsFault:(BOOL)fault;

/* Fetch all objects for given entity and sort them.
 * /!\ Warning, errors are ignored /!\
 */
- (NSArray *)db_fetchObjects:(NSString *)entityName usingSortDescriptors:(NSArray *)sortDescriptors returningAsFault:(BOOL)fault;

/* Fetch all objects for given entity, using predicate and sort them.
 * /!\ Warning, errors are ignored /!\
 */
- (NSArray *)db_fetchObjects:(NSString *)entityName usingPredicate:(NSPredicate *)predicate usingSortDescriptors:(NSArray *)sortDescriptors returningAsFault:(BOOL)fault;

@end
