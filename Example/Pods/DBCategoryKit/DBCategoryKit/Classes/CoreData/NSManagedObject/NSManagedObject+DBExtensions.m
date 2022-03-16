//
//  NSManagedObject+DBExtensions.m
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import "NSManagedObject+DBExtensions.h"

@implementation NSManagedObject (DBExtensions)

+ (id)db_create:(NSManagedObjectContext *)context {
    return [NSEntityDescription insertNewObjectForEntityForName:[self db_entityName] inManagedObjectContext:context];
}

+ (id)db_create:(NSDictionary *)dict inContext:(NSManagedObjectContext *)context {
    id instance = [self db_create:context];
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [instance setValue:obj forKey:key];
    }];
    return instance;
}

+ (id)db_find:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context {
    return [context db_fetchObjectForEntity:[self db_entityName] predicate:predicate];
}

+ (id)db_find:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors inContext:(NSManagedObjectContext *)context {
    return [context db_fetchObjectForEntity:[self db_entityName] predicate:predicate sortDescriptors:sortDescriptors];
}

+ (NSArray *)db_all:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context {
    return [context db_fetchObjectsForEntity:[self db_entityName] predicate:predicate];
}

+ (NSArray *)db_all:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors inContext:(NSManagedObjectContext *)context {
    return [context db_fetchObjectsForEntity:[self db_entityName] predicate:predicate sortDescriptors:sortDescriptors];
}

+ (NSUInteger)db_count:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:[self db_entityName] inManagedObjectContext:context];
    [request setPredicate:predicate];
    [request setEntity:entity];
    NSError *error = nil;
    return [context countForFetchRequest:request error:&error];
}

+ (NSString *)db_entityName {
    return [NSString stringWithCString:object_getClassName(self) encoding:NSASCIIStringEncoding];
}

+ (NSError *)db_deleteAll:(NSManagedObjectContext *)context {
    NSFetchRequest * req = [[NSFetchRequest alloc] init];
    [req setEntity:[NSEntityDescription entityForName:[self db_entityName] inManagedObjectContext:context]];
    [req setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError * error = nil;
    NSArray * objects = [context executeFetchRequest:req error:&error];
    //error handling goes here
    for (NSManagedObject * obj in objects) {
        [context deleteObject:obj];
    }
    NSError *saveError = nil;
    [context save:&saveError];
    return error;
}

@end
