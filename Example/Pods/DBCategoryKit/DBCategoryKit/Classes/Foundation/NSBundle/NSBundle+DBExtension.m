//
//  NSBundle+DBExtension.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSBundle+DBExtension.h"

@implementation NSBundle (DBExtension)

+ (NSBundle *)db_getBundleWithObject:(id)object{
    return [NSBundle bundleForClass:[object class]];
}

+ (NSBundle *)db_getBundleWithBundleName:(NSString *)bundleName
                           frameworkName:(NSString *)frameworkName{
    NSAssert(bundleName != nil, @"bundleName不能为空");
    if (frameworkName == nil) {
        frameworkName = bundleName;
    }
    
    if ([bundleName containsString:@".bundle"]) {
        bundleName = [bundleName componentsSeparatedByString:@".bundle"].firstObject;
    }
    //没使用framework的情况下
    NSURL *associatedBundleURL = [[NSBundle mainBundle] URLForResource:bundleName withExtension:@"bundle"];
    //使用framework形式
    if (!associatedBundleURL) {
        associatedBundleURL = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];
        associatedBundleURL = [associatedBundleURL URLByAppendingPathComponent:frameworkName];
        associatedBundleURL = [associatedBundleURL URLByAppendingPathExtension:@"framework"];
        NSBundle *associatedBundle = [NSBundle bundleWithURL:associatedBundleURL];
        associatedBundleURL = [associatedBundle URLForResource:bundleName withExtension:@"bundle"];
    }
    
    NSAssert(associatedBundleURL, @"取不到关联bundle");
    //生产环境直接返回空
    return associatedBundleURL?[NSBundle bundleWithURL:associatedBundleURL]:nil;
}

@end
