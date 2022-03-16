//
//  NSManagedObject+DBDictionary.h
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSManagedObject (DBDictionary)

/**
 *
 *  db_toDictionary
 *
 *  @return <#return value description#>
 */
- (NSDictionary *)db_toDictionary;

/**
 *
 *  db_dictionary
 *
 *  @return <#return value description#>
 */
- (NSDictionary *)db_dictionary;

@end

NS_ASSUME_NONNULL_END
