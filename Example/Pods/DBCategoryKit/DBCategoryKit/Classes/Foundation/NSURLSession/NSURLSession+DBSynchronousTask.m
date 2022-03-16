//
//  NSURLSession+DBSynchronousTask.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSURLSession+DBSynchronousTask.h"

@implementation NSURLSession (DBSynchronousTask)

#pragma mark - NSURLSessionDataTask
- (nullable NSData *)db_sendSynchronousDataTaskWithURL:(nonnull NSURL *)url returningResponse:(NSURLResponse *_Nullable*_Nullable)response error:(NSError *_Nullable*_Nullable)error {
    return [self db_sendSynchronousDataTaskWithRequest:[NSURLRequest requestWithURL:url] returningResponse:response error:error];
}

- (nullable NSData *)db_sendSynchronousDataTaskWithRequest:(nonnull NSURLRequest *)request returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response error:(NSError *_Nullable __autoreleasing *_Nullable)error {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block NSData *data = nil;
    [[self dataTaskWithRequest:request completionHandler:^(NSData *taskData, NSURLResponse *taskResponse, NSError *taskError) {
        data = taskData;
        if (response) {
            *response = taskResponse;
        }
        if (error) {
            *error = taskError;
        }
        dispatch_semaphore_signal(semaphore);
    }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    return data;
}

#pragma mark - NSURLSessionDownloadTask
- (nullable NSURL *)db_sendSynchronousDownloadTaskWithURL:(nonnull NSURL *)url returningResponse:(NSURLResponse *_Nullable*_Nullable)response error:(NSError *_Nullable*_Nullable)error {
    return [self db_sendSynchronousDownloadTaskWithRequest:[NSURLRequest requestWithURL:url] returningResponse:response error:error];
}

- (nullable NSURL *)db_sendSynchronousDownloadTaskWithRequest:(nonnull NSURLRequest *)request returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response error:(NSError *_Nullable __autoreleasing *_Nullable)error {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block NSURL *location = nil;
    [[self downloadTaskWithRequest:request completionHandler:^(NSURL *taskLocation, NSURLResponse *taskResponse, NSError *taskError) {
        location = taskLocation;
        if (response) {
            *response = taskResponse;
        }
        if (error) {
            *error = taskError;
        }
        dispatch_semaphore_signal(semaphore);
    }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    return location;
}

#pragma mark - NSURLSessionUploadTask
- (nullable NSData *)db_sendSynchronousUploadTaskWithRequest:(nonnull NSURLRequest *)request fromFile:(nonnull NSURL *)fileURL returningResponse:(NSURLResponse *_Nullable*_Nullable)response error:(NSError *_Nullable*_Nullable)error {
    return [self db_sendSynchronousUploadTaskWithRequest:request fromData:[NSData dataWithContentsOfURL:fileURL] returningResponse:response error:error];
}

- (nullable NSData *)db_sendSynchronousUploadTaskWithRequest:(nonnull NSURLRequest *)request fromData:(nonnull NSData *)bodyData returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response error:(NSError *_Nullable __autoreleasing *_Nullable)error {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    __block NSData *data = nil;
    [[self uploadTaskWithRequest:request fromData:bodyData completionHandler:^(NSData *taskData, NSURLResponse *taskResponse, NSError *taskError) {
        data = taskData;
        if (response) {
            *response = taskResponse;
        }
        if (error) {
            *error = taskError;
        }
        dispatch_semaphore_signal(semaphore);
    }] resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    return data;
}

@end
