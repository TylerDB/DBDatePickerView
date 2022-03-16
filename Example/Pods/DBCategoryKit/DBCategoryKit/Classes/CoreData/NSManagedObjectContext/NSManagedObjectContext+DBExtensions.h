//
//  NSManagedObjectContext+DBExtensions.h
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>
#import <DBCategoryKit/NSFetchRequest+DBExtensions.h>

typedef void (^ContextCallback)(NSManagedObjectContext *context);
typedef void (^ContextObjectCallback)(NSManagedObjectContext *context, id object);
typedef void (^ContextObjectsCallback)(NSManagedObjectContext *context, NSArray *objects);

@interface NSManagedObjectContext (DBExtensions)

#pragma mark - Conveince Property
@property (nonatomic, readonly) NSManagedObjectModel *db_objectModel;

#pragma mark - Sync methods
- (NSArray *)db_fetchObjectsForEntity:(NSString *)entity;
- (NSArray *)db_fetchObjectsForEntity:(NSString *)entity predicate:(NSPredicate *)predicate;
- (NSArray *)db_fetchObjectsForEntity:(NSString *)entity sortDescriptors:(NSArray *)sortDescriptors;
- (NSArray *)db_fetchObjectsForEntity:(NSString *)entity predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors;
- (NSArray *)db_fetchObjectsForEntity:(NSString *)entity predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors fetchLimit:(NSUInteger)limit;
- (id)db_fetchObjectForEntity:(NSString *)entity;
- (id)db_fetchObjectForEntity:(NSString *)entity predicate:(NSPredicate *)predicate;
- (id)db_fetchObjectForEntity:(NSString *)entity sortDescriptors:(NSArray *)sortDescriptors;
- (id)db_fetchObjectForEntity:(NSString *)entity predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors;

#pragma mark - Async Methods
- (void)db_fetchObjectsForEntity:(NSString *)entity callback:(FetchObjectsCallback)callback;
- (void)db_fetchObjectsForEntity:(NSString *)entity predicate:(NSPredicate *)predicate callback:(FetchObjectsCallback)callback;
- (void)db_fetchObjectsForEntity:(NSString *)entity sortDescriptors:(NSArray *)sortDescriptors callback:(FetchObjectsCallback)callback;
- (void)db_fetchObjectsForEntity:(NSString *)entity predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors callback:(FetchObjectsCallback)callback;

- (void)db_fetchObjectForEntity:(NSString *)entity callback:(FetchObjectCallback)callback;
- (void)db_fetchObjectForEntity:(NSString *)entity predicate:(NSPredicate *)predicate callback:(FetchObjectCallback)callback;
- (void)db_fetchObjectForEntity:(NSString *)entity sortDescriptors:(NSArray *)sortDescriptors callback:(FetchObjectCallback)callback;
- (void)db_fetchObjectForEntity:(NSString *)entity predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors callback:(FetchObjectCallback)callback;

- (void)db_fetchRequest:(NSFetchRequest *)fetchRequest withCallback:(FetchObjectsCallback)callback;

#pragma mark - Insert New Entity
- (id)db_insertEntity:(NSString *)entity;
- (void)db_deleteEntity:(NSString *)entity withPredicate:(NSPredicate *)predicate;

@end
