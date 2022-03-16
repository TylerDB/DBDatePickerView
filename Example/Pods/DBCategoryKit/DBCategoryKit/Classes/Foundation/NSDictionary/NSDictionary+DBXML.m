//
//  NSDictionary+DBXML.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSDictionary+DBXML.h"

@implementation NSDictionary (DBXML)

- (NSString *)db_XMLString {
    
    return [self  db_XMLStringWithRootElement:nil declaration:nil];
}

- (NSString *)db_XMLStringDefaultDeclarationWithRootElement:(NSString *)rootElement{
    return [self  db_XMLStringWithRootElement:rootElement declaration:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"];
}

- (NSString *)db_XMLStringWithRootElement:(NSString *)rootElement declaration:(NSString *)declaration{
    NSMutableString *xml = [[NSMutableString alloc] initWithString:@""];
    if (declaration) {
        [xml appendString:declaration];
    }
    if (rootElement) {
        [xml appendString:[NSString stringWithFormat:@"<%@>",rootElement]];
    }
    [self db_convertNode:self withString:xml andTag:nil];
    if (rootElement) {
        [xml appendString:[NSString stringWithFormat:@"</%@>",rootElement]];
    }
    NSString *finalXML=[xml stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
    return finalXML;
}

- (void)db_convertNode:(id)node withString:(NSMutableString *)xml andTag:(NSString *)tag{
    if ([node isKindOfClass:[NSDictionary class]] && !tag) {
        NSArray *keys = [node allKeys];
        for (NSString *key in keys) {
            [self db_convertNode:[node objectForKey:key] withString:xml andTag:key];
        }
    }else if ([node isKindOfClass:[NSArray class]]) {
        for (id value in node) {
            [self db_convertNode:value withString:xml andTag:tag];
        }
    }else {
        [xml appendString:[NSString stringWithFormat:@"<%@>", tag]];
        if ([node isKindOfClass:[NSString class]]) {
            [xml appendString:node];
        }else if ([node isKindOfClass:[NSDictionary class]]) {
            [self db_convertNode:node withString:xml andTag:nil];
        }
        [xml appendString:[NSString stringWithFormat:@"</%@>", tag]];
    }
}

- (NSString *)db_plistString{
    NSString *result = [[NSString alloc] initWithData:[self db_plistData]  encoding:NSUTF8StringEncoding];
    return result;
}

- (NSData *)db_plistData{
    NSError *error = nil;
    return [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListXMLFormat_v1_0 options:0 error:&error];
}

@end
