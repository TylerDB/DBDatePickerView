//
//  UIView+DBNib.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIView+DBNib.h"

@implementation UIView (DBNib)

+ (UINib *)db_loadNib
{
    return [self db_loadNibNamed:NSStringFromClass([self class])];
}

+ (UINib *)db_loadNibNamed:(NSString*)nibName
{
    return [self db_loadNibNamed:nibName bundle:[NSBundle mainBundle]];
}

+ (UINib *)db_loadNibNamed:(NSString*)nibName bundle:(NSBundle *)bundle
{
    return [UINib nibWithNibName:nibName bundle:bundle];
}

+ (instancetype)db_loadInstanceFromNib
{
    return [self db_loadInstanceFromNibWithName:NSStringFromClass([self class])];
}

+ (instancetype)db_loadInstanceFromNibWithName:(NSString *)nibName
{
    return [self db_loadInstanceFromNibWithName:nibName owner:nil];
}

+ (instancetype)db_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner
{
    return [self db_loadInstanceFromNibWithName:nibName owner:owner bundle:[NSBundle mainBundle]];
}

+ (instancetype)db_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle
{
    UIView *result = nil;
    NSArray* elements = [bundle loadNibNamed:nibName owner:owner options:nil];
    for (id object in elements)
    {
        if ([object isKindOfClass:[self class]])
        {
            result = object;
            break;
        }
    }
    return result;
}

@end
