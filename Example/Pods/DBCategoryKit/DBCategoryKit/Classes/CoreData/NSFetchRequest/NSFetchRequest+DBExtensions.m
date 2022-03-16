//
//  NSFetchRequest+DBExtensions.m
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import "NSFetchRequest+DBExtensions.h"

@implementation NSFetchRequest (DBExtensions)

+ (id)db_fetchRequestWithEntity:(NSEntityDescription *)entity
{
    return [[self alloc] initWithEntity:entity predicate:nil sortDescriptors:nil];
}

+ (id)db_fetchRequestWithEntity:(NSEntityDescription *)entity predicate:(NSPredicate *)predicate
{
    return [[self alloc] initWithEntity:entity predicate:predicate sortDescriptors:nil];
}

+ (id)db_fetchRequestWithEntity:(NSEntityDescription *)entity sortDescriptors:(NSArray *)sortDescriptors
{
    return [[self alloc] initWithEntity:entity predicate:nil sortDescriptors:sortDescriptors];
}

+ (id)db_fetchRequestWithEntity:(NSEntityDescription *)entity predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors
{
    return [[self alloc] initWithEntity:entity predicate:predicate sortDescriptors:sortDescriptors];
}

- (id)initWithEntity:(NSEntityDescription *)entity predicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors
{
    self = [self init];
    if(self)
    {
        self.entity = entity;
        self.predicate = predicate;
        self.sortDescriptors = sortDescriptors;
    }
    
    return self;
}

@end
