//
//  NSIndexPath+DBOffset.m
//  DBCategoryKit
//
//  Created by DB on 2020/3/30.
//

#import "NSIndexPath+DBOffset.h"

@implementation NSIndexPath (DBOffset)

#pragma mark - Offset
- (NSIndexPath *)db_previousRow
{
    return [NSIndexPath indexPathForRow:self.row - 1
                              inSection:self.section];
}

- (NSIndexPath *)db_nextRow
{
    return [NSIndexPath indexPathForRow:self.row + 1
                              inSection:self.section];
}

- (NSIndexPath *)db_previousItem
{
    return [NSIndexPath indexPathForItem:self.item - 1
                               inSection:self.section];
}


- (NSIndexPath *)db_nextItem
{
    return [NSIndexPath indexPathForItem:self.item + 1
                               inSection:self.section];
}


- (NSIndexPath *)db_nextSection
{
    return [NSIndexPath indexPathForRow:self.row
                              inSection:self.section + 1];
}

- (NSIndexPath *)db_previousSection
{
    return [NSIndexPath indexPathForRow:self.row
                              inSection:self.section - 1];
}

@end
