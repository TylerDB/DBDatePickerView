//
//  NSBundle+DBExtension.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (DBExtension)

+ (NSBundle *)db_getBundleWithObject:(id)object;

/**
 获取文件所在bundle，若podspec使用resource_bundles引用资源，则可以使用此方法，否则可以使用db_getBundleWithObject；
 若podfile使用use_frameworks!来指定pod为Dynamic Framework，则两个参数都必传(若name相同，可只传bundleName)，否则可以只传bundleName；
 相关链接：https://juejin.im/post/5a77fb8df265da4e99576702
 
 @param bundleName bundle名字，就是在resource_bundles里面的名字
 @param frameworkName pod.framework的名字
 @return bundle
 */
+ (NSBundle *)db_getBundleWithBundleName:(NSString *)bundleName
                           frameworkName:(NSString *)frameworkName;

@end
