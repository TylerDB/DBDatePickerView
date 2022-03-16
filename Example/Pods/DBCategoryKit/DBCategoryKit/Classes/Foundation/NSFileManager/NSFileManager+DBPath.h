//
//  NSFileManager+DBPath.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (DBPath)

/**
 Get URL of Documents directory.
 
 @return Documents directory URL.
 */
+ (NSURL *)db_documentsURL;

/**
 Get path of Documents directory.
 
 @return Documents directory path.
 */
+ (NSString *)db_documentsPath;

/**
 Get URL of Library directory.
 
 @return Library directory URL.
 */
+ (NSURL *)db_libraryURL;

/**
 Get path of Library directory.
 
 @return Library directory path.
 */
+ (NSString *)db_libraryPath;

/**
 Get URL of Caches directory.
 
 @return Caches directory URL.
 */
+ (NSURL *)db_cachesURL;

/**
 Get path of Caches directory.
 
 @return Caches directory path.
 */
+ (NSString *)db_cachesPath;

/**
 Adds a special filesystem flag to a file to avoid iCloud backup it.
 
 @param path Path to a file to set an attribute.
 */
+ (BOOL)db_addSkipBackupAttributeToFile:(NSString *)path;

/**
 Get available disk space.
 
 @return An amount of available disk space in Megabytes.
 */
+ (double)db_availableDiskSpace;

@end

NS_ASSUME_NONNULL_END
