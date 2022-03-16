//
//  NSURL+DBParam.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSURL+DBParam.h"

@implementation NSURL (DBParam)

- (NSDictionary *)db_parameters
{
    NSMutableDictionary * parametersDictionary = [NSMutableDictionary dictionary];
    NSArray * queryComponents = [self.query componentsSeparatedByString:@"&"];
    for (NSString * queryComponent in queryComponents) {
        NSString * key = [queryComponent componentsSeparatedByString:@"="].firstObject;
        if (queryComponent.hash == key.hash) {
            continue;
        }
        NSString * value = [queryComponent substringFromIndex:(key.length + 1)];
        [parametersDictionary setObject:value forKey:key];
    }
    return parametersDictionary;
}

- (NSString *)db_valueForParameter:(NSString *)parameterKey
{
    return [[self db_parameters] objectForKey:parameterKey];
}

@end
