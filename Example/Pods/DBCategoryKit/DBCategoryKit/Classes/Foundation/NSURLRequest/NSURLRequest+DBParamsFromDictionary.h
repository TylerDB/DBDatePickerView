//
//  NSURLRequest+DBParamsFromDictionary.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (DBParamsFromDictionary)

- (id)initWithURL:(NSURL *)URL parameters:(NSDictionary *)params;

+ (NSURLRequest *)db_requestGETWithURL:(NSURL *)url parameters:(NSDictionary *)params;

+ (NSString *)db_URLfromParameters:(NSDictionary *)params;

+ (NSArray *)db_queryStringComponentsFromKey:(NSString *)key value:(id)value;

+ (NSArray *)db_queryStringComponentsFromKey:(NSString *)key dictionaryValue:(NSDictionary *)dict;

+ (NSArray *)db_queryStringComponentsFromKey:(NSString *)key arrayValue:(NSArray *)array;

@end
