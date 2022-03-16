//
//  NSManagedObjectContext+DBObjectClear.h
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSManagedObjectContext (DBObjectClear)

/* Delete all given objects*/
- (void)db_deleteObjects:(id <NSFastEnumeration>)objects;

@end

NS_ASSUME_NONNULL_END
