//
//  NSFetchRequest+DBExtensions.h
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import <CoreData/CoreData.h>

typedef void (^FetchObjectsCallback)(NSArray *fetchedObjects, NSError *error);
typedef void (^FetchObjectCallback)(id fetchedObject, NSError * error);

@interface NSFetchRequest (DBExtensions)

+ (id)db_fetchRequestWithEntity:(NSEntityDescription *)entity;
+ (id)db_fetchRequestWithEntity:(NSEntityDescription *)entity predicate:(NSPredicate *)predicate;
+ (id)db_fetchRequestWithEntity:(NSEntityDescription *)entity sortDescriptors:(NSArray *)sortDescriptors;
+ (id)db_fetchRequestWithEntity:(NSEntityDescription *)entity predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors;

- (id)initWithEntity:(NSEntityDescription *)entity predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors;

@end
