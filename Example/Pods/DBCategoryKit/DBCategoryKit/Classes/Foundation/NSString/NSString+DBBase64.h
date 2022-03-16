//
//  NSString+DBBase64.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (DBBase64)

+ (NSString *)db_stringWithBase64EncodedString:(NSString *)string;
- (NSString *)db_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)db_base64EncodedString;
- (NSString *)db_base64DecodedString;
- (NSData *)db_base64DecodedData;

@end

NS_ASSUME_NONNULL_END
