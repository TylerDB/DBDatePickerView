//
//  NSFileManager+DBPath.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSFileManager+DBPath.h"
#include <sys/xattr.h>

@implementation NSFileManager (DBPath)

+ (NSURL *)db_URLForDirectory:(NSSearchPathDirectory)directory
{
    return [self.defaultManager URLsForDirectory:directory inDomains:NSUserDomainMask].lastObject;
}

+ (NSString *)db_pathForDirectory:(NSSearchPathDirectory)directory
{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}

+ (NSURL *)db_documentsURL
{
    return [self db_URLForDirectory:NSDocumentDirectory];
}

+ (NSString *)db_documentsPath
{
    return [self db_pathForDirectory:NSDocumentDirectory];
}

+ (NSURL *)db_libraryURL
{
    return [self db_URLForDirectory:NSLibraryDirectory];
}

+ (NSString *)db_libraryPath
{
    return [self db_pathForDirectory:NSLibraryDirectory];
}

+ (NSURL *)db_cachesURL
{
    return [self db_URLForDirectory:NSCachesDirectory];
}

+ (NSString *)db_cachesPath
{
    return [self db_pathForDirectory:NSCachesDirectory];
}

+ (BOOL)db_addSkipBackupAttributeToFile:(NSString *)path
{
    return [[NSURL.alloc initFileURLWithPath:path] setResourceValue:@(YES) forKey:NSURLIsExcludedFromBackupKey error:nil];
}

+ (double)db_availableDiskSpace
{
    NSDictionary *attributes = [self.defaultManager attributesOfFileSystemForPath:self.db_documentsPath error:nil];
    
    return [attributes[NSFileSystemFreeSize] unsignedLongLongValue] / (double)0x100000;
}

@end
