//
//  NSIndexPath+DBOffset.h
//  DBCategoryKit
//
//  Created by DB on 2020/3/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSIndexPath (DBOffset)

/**
 *
 *  Compute previous row indexpath
 *
 */
- (NSIndexPath *)db_previousRow;
/**
 *
 *  Compute next row indexpath
 *
 */
- (NSIndexPath *)db_nextRow;
/**
 *
 *  Compute previous item indexpath
 *
 */
- (NSIndexPath *)db_previousItem;
/**
 *
 *  Compute next item indexpath
 *
 */
- (NSIndexPath *)db_nextItem;
/**
 *
 *  Compute next section indexpath
 *
 */
- (NSIndexPath *)db_nextSection;
/**
 *
 *  Compute previous section indexpath
 *
 */
- (NSIndexPath *)db_previousSection;

@end

NS_ASSUME_NONNULL_END
