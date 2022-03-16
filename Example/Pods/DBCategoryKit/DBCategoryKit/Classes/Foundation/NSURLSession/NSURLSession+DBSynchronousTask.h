//
//  NSURLSession+DBSynchronousTask.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURLSession (DBSynchronousTask)

#pragma mark - NSURLSessionDataTask
- (nullable NSData *)db_sendSynchronousDataTaskWithURL:(nonnull NSURL *)url returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response error:(NSError *_Nullable __autoreleasing*_Nullable)error;
- (nullable NSData *)db_sendSynchronousDataTaskWithRequest:(nonnull NSURLRequest *)request returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response error:(NSError *_Nullable __autoreleasing*_Nullable)error;

#pragma mark - NSURLSessionDownloadTask
- (nullable NSURL *)db_sendSynchronousDownloadTaskWithURL:(nonnull NSURL *)url returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response error:(NSError *_Nullable __autoreleasing *_Nullable)error;
- (nullable NSURL *)db_sendSynchronousDownloadTaskWithRequest:(nonnull NSURLRequest *)request returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response error:(NSError *_Nullable __autoreleasing *_Nullable)error;

#pragma mark - NSURLSessionUploadTask
- (nullable NSData *)db_sendSynchronousUploadTaskWithRequest:(nonnull NSURLRequest *)request fromFile:(nonnull NSURL *)fileURL returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response error:(NSError *_Nullable __autoreleasing *_Nullable)error;
- (nullable NSData *)db_sendSynchronousUploadTaskWithRequest:(nonnull NSURLRequest *)request fromData:(nonnull NSData *)bodyData returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response error:(NSError *_Nullable __autoreleasing *_Nullable)error;

@end

NS_ASSUME_NONNULL_END
