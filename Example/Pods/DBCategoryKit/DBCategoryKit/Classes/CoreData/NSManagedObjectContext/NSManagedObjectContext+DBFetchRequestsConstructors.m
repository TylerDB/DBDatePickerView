//
//  NSManagedObjectContext+DBFetchRequestsConstructors.m
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import "NSManagedObjectContext+DBFetchRequestsConstructors.h"

@implementation NSManagedObjectContext (DBFetchRequestsConstructors)

#pragma mark - Constructors
- (NSFetchRequest *)db_fetchRequestForEntityObject:(NSString *)entityName usingValue:(id)value forKey:(NSString *)key returningAsFault:(BOOL)fault
{
    // Create request
    NSFetchRequest *req        = [[NSFetchRequest alloc] init];
    
    req.entity                 = [NSEntityDescription entityForName:entityName inManagedObjectContext:self];
    req.predicate              = [NSPredicate predicateWithFormat:@"%K == %@", key, value];
    req.fetchLimit             = 1;
    req.returnsObjectsAsFaults = fault;
    
    return req;
}

- (NSFetchRequest *)db_fetchRequestForEntityObject:(NSString *)entityName usingPredicate:(NSPredicate *)predicate returningAsFault:(BOOL)fault
{
    // Create request
    NSFetchRequest *req        = [[NSFetchRequest alloc] init];
    
    req.entity                 = [NSEntityDescription entityForName:entityName inManagedObjectContext:self];
    req.predicate              = predicate;
    req.fetchLimit             = 1;
    req.returnsObjectsAsFaults = fault;
    
    return req;
}

- (NSFetchRequest *)db_fetchRequestForEntityObjects:(NSString *)entityName returningAsFault:(BOOL)fault
{
    return [self db_fetchRequestForEntityObjects:entityName
                                  usingPredicate:nil
                            usingSortDescriptors:nil
                                returningAsFault:fault];
    
}

- (NSFetchRequest *)db_fetchRequestForEntityObjects:(NSString *)entityName usingPredicate:(NSPredicate *)predicate returningAsFault:(BOOL)fault
{
    return [self db_fetchRequestForEntityObjects:entityName
                                  usingPredicate:predicate
                            usingSortDescriptors:nil
                                returningAsFault:fault];
}

- (NSFetchRequest *)db_fetchRequestForEntityObjects:(NSString *)entityName usingSortDescriptors:(NSArray *)sortDescriptors returningAsFault:(BOOL)fault
{
    return [self db_fetchRequestForEntityObjects:entityName
                                  usingPredicate:nil
                            usingSortDescriptors:sortDescriptors
                                returningAsFault:fault];
}

- (NSFetchRequest *)db_fetchRequestForEntityObjects:(NSString *)entityName usingPredicate:(NSPredicate *)predicate usingSortDescriptors:(NSArray *)sortDescriptors returningAsFault:(BOOL)fault
{
    // Create request
    NSFetchRequest *req        = [[NSFetchRequest alloc] init];
    
    req.entity                 = [NSEntityDescription entityForName:entityName inManagedObjectContext:self];
    req.sortDescriptors        = sortDescriptors;
    req.predicate              = predicate;
    req.returnsObjectsAsFaults = fault;
    
    return req;
}

@end
