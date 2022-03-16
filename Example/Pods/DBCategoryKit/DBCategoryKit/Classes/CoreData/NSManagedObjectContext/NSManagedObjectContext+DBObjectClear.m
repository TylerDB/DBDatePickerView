//
//  NSManagedObjectContext+DBObjectClear.m
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import "NSManagedObjectContext+DBObjectClear.h"

@implementation NSManagedObjectContext (DBObjectClear)

#pragma mark - Utils
- (void)db_deleteObjects:(id <NSFastEnumeration>)objects
{
    for (id obj in objects)
        [self deleteObject:obj];
}

@end
