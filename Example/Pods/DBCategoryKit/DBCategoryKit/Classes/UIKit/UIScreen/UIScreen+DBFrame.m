//
//  UIScreen+DBFrame.m
//  DBCategoryKit
//
//  Created by DB on 2020/3/30.
//

#import "UIScreen+DBFrame.h"

@implementation UIScreen (DBFrame)

+ (CGSize)db_size
{
    return [[UIScreen mainScreen] bounds].size;
}

+ (CGFloat)db_width
{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)db_height
{
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (CGSize)db_orientationSize
{
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion]
                             doubleValue];
    BOOL isLand =   UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    return (systemVersion>8.0 && isLand) ? db_SizeSWAP([UIScreen db_size]) : [UIScreen db_size];
}

+ (CGFloat)db_orientationWidth
{
    return [UIScreen db_orientationSize].width;
}

+ (CGFloat)db_orientationHeight
{
    return [UIScreen db_orientationSize].height;
}

+ (CGSize)db_DPISize
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return CGSizeMake(size.width * scale, size.height * scale);
}


/**
 *  交换高度与宽度
 */
static inline CGSize db_SizeSWAP(CGSize size) {
    return CGSizeMake(size.height, size.width);
}

@end
