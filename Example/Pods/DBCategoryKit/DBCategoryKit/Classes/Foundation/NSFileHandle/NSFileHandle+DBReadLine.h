//
//  NSFileHandle+DBReadLine.h
//  DBCategoryKit
//
//  Created by DB on 2020/3/30.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileHandle (DBReadLine)

/**
 *  @brief   A Cocoa / Objective-C NSFileHandle category that adds the ability to read a file line by line.

 *
 *  @param theDelimier 分隔符
 *
 *  @return An NSData* object is returned with the line if found, or nil if no more lines were found
 */
- (NSData *)db_readLineWithDelimiter:(NSString *)theDelimier;

@end

NS_ASSUME_NONNULL_END
