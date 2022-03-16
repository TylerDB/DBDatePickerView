//
//  NSManagedObjectContext+DBFetching.m
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import "NSManagedObjectContext+DBFetching.h"

@implementation NSManagedObjectContext (DBFetching)

#pragma mark Fetching
- (id)db_fetchObject:(NSString*)entityName usingValue:(id)value forKey:(NSString *)key returningAsFault:(BOOL)fault
{
    return [self db_fetchObject:entityName
                 usingPredicate:[NSPredicate predicateWithFormat:@"%K == %@", key, value]
               returningAsFault:fault];
}

- (id)db_fetchObject:(NSString*)entityName usingPredicate:(NSPredicate*)predicate returningAsFault:(BOOL)fault
{
    // Create request
    NSFetchRequest *req        = [[NSFetchRequest alloc] init];
    
    req.entity                 = [NSEntityDescription entityForName:entityName inManagedObjectContext:self];
    req.predicate              = predicate;
    req.fetchLimit             = 1;
    req.returnsObjectsAsFaults = fault;
    
    // Execute request
    return [[self executeFetchRequest:req
                                error:nil] lastObject];
}

- (NSArray *)db_fetchObjects:(NSString*)entityName usingPredicate:(NSPredicate*)predicate returningAsFault:(BOOL)fault
{
    // Create request
    NSFetchRequest *req        = [[NSFetchRequest alloc] init];
    
    req.entity                 = [NSEntityDescription entityForName:entityName inManagedObjectContext:self];
    req.predicate              = predicate;
    req.returnsObjectsAsFaults = fault;
    
    // Execute request
    return [self executeFetchRequest:req
                               error:nil];
}

- (NSArray *)db_fetchObjects:(NSString*)entityName usingSortDescriptors:(NSArray*)sortDescriptors returningAsFault:(BOOL)fault
{
    // Create request
    NSFetchRequest *req        = [[NSFetchRequest alloc] init];
    
    req.entity                 = [NSEntityDescription entityForName:entityName inManagedObjectContext:self];
    req.sortDescriptors        = sortDescriptors;
    req.returnsObjectsAsFaults = fault;
    
    // Execute request
    return [self executeFetchRequest:req
                               error:nil];
}

- (NSArray *)db_fetchObjects:(NSString*)entityName usingPredicate:(NSPredicate*)predicate usingSortDescriptors:(NSArray*)sortDescriptors returningAsFault:(BOOL)fault
{
    // Create request
    NSFetchRequest *req        = [[NSFetchRequest alloc] init];
    
    req.entity                 = [NSEntityDescription entityForName:entityName inManagedObjectContext:self];
    req.sortDescriptors        = sortDescriptors;
    req.predicate              = predicate;
    req.returnsObjectsAsFaults = fault;
    
    // Execute request
    return [self executeFetchRequest:req
                               error:nil];
}

- (NSArray*)db_fetchObjects:(NSString*)entityName returningAsFault:(BOOL)fault
{
    return [self db_fetchObjects:entityName usingSortDescriptors:nil returningAsFault:fault];
}

#pragma mark - Count
- (NSInteger)db_countObjects:(NSString*)entityName
{
    return [self db_countObjects:entityName usingPredicate:nil];
}

- (NSInteger)db_countObjects:(NSString*)entityName usingPredicate:(NSPredicate*)predicate
{
    // Create request
    NSFetchRequest *req        = [[NSFetchRequest alloc] init];
    
    req.entity                 = [NSEntityDescription entityForName:entityName inManagedObjectContext:self];
    req.resultType             = NSDictionaryResultType;
    req.predicate              = predicate;
    req.returnsObjectsAsFaults = YES;
    
    // Execute request
    return [self countForFetchRequest:req error:nil];
}

@end
