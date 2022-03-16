//
//  NSManagedObject+DBDictionary.m
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import "NSManagedObject+DBDictionary.h"
#import <objc/runtime.h>

@implementation NSManagedObject (DBDictionary)

- (NSDictionary *)db_toDictionary {
    unsigned int count;
    
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    for (int i = 0; i<count; i++) {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        id obj = [self valueForKey:name];
        if (obj) {
            
            if (![[obj class] isSubclassOfClass:[NSData class]]) {
                if ([[obj class] isSubclassOfClass:[NSManagedObject class]]) {
                    
                    NSArray *relationships = [[obj entity] relationshipsWithDestinationEntity:[self entity]];
                    if ([relationships count] > 0) {
                        NSString *relName = [[relationships objectAtIndex:0] name];
                        
                        NSDictionary *namedRelationships = [[obj entity] relationshipsByName];
                        BOOL isParent = [[[(NSRelationshipDescription *)[namedRelationships objectForKey:relName] destinationEntity] name] isEqualToString:NSStringFromClass([self class])];
                        if (!isParent)
                            [dictionary setObject:[(NSManagedObject *)obj db_toDictionary] forKey:name];
                    }
                    else {
                        [dictionary setObject:[(NSManagedObject *)obj db_toDictionary] forKey:name];
                    }
                }
                else if ([[obj class] isSubclassOfClass:[NSSet class]]) {
                    if ([obj count] > 0) {
                        NSArray *array = [(NSSet *)obj allObjects];
                        NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:[array count]];
                        for (id o in array)
                            [mutableArray addObject:[(NSManagedObject *)o db_toDictionary]];
                        
                        [dictionary setObject:[NSArray arrayWithArray:mutableArray] forKey:name];
                    }
                }
                else if ([[obj class] isSubclassOfClass:[NSDate class]]) {
                    [dictionary setObject:[obj description] forKey:name];
                }
                else {
                    [dictionary setObject:obj forKey:name];
                }
            }
        }
    }
    free(properties);
    
    return dictionary;
}
- (NSDictionary *)db_dictionary{
    NSArray *keys = [[[self entity] attributesByName] allKeys];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:keys];
    return dict;
}

@end
