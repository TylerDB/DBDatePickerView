//
//  NSURL+DBURLQuery.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (DBURLQuery)

/**
 *  @return URL's query component as keys/values
 *  Returns nil for an empty query
 */
- (NSDictionary *)db_queryDictionary;

/**
 *  @return URL with keys values appending to query string
 *  @param queryDictionary Query keys/values
 *  @param sortedKeys Sorted the keys alphabetically?
 *  @warning If keys overlap in receiver and query dictionary,
 *  behaviour is undefined.
 */
- (NSURL *)db_URLByAppendingQueryDictionary:(NSDictionary *)queryDictionary
                             withSortedKeys:(BOOL)sortedKeys;

/** As above, but `sortedKeys=NO` */
- (NSURL *)db_URLByAppendingQueryDictionary:(NSDictionary *)queryDictionary;

/**
 *  @return Copy of URL with its query component replaced with
 *  the specified dictionary.
 *  @param queryDictionary A new query dictionary
 *  @param sortedKeys      Whether or not to sort the query keys
 */
- (NSURL *)db_URLByReplacingQueryWithDictionary:(NSDictionary *)queryDictionary
                                 withSortedKeys:(BOOL)sortedKeys;

/** As above, but `sortedKeys=NO` */
- (NSURL *)db_URLByReplacingQueryWithDictionary:(NSDictionary *)queryDictionary;

/** @return Receiver with query component completely removed */
- (NSURL *)db_URLByRemovingQuery;

@end

@interface NSString (DBURLQuery)

/**
 *  @return If the receiver is a valid URL query component, returns
 *  components as key/value pairs. If couldn't split into *any* pairs,
 *  returns nil.
 */
- (NSDictionary *)db_URLQueryDictionary;

@end

@interface NSDictionary (DBURLQuery)

/**
 *  @return URL query string component created from the keys and values in
 *  the dictionary. Returns nil for an empty dictionary.
 *  @param sortedKeys Sorted the keys alphabetically?
 *  @see cavetas from the main `NSURL` category as well.
 */
- (NSString *)db_URLQueryStringWithSortedKeys:(BOOL)sortedKeys;

@end
