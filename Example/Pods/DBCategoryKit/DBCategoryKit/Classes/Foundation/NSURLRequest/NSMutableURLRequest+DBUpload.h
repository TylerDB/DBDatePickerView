//
//  NSMutableURLRequest+DBUpload.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableURLRequest (DBUpload)

/**
 *  生成单文件上传的 multipart/form-data 请求
 *
 *  @param URL     负责上传的 url
 *  @param fileURL 要上传的本地文件 url
 *  @param name    服务器脚本字段名
 *
 *  @return multipart/form-data POST 请求，保存到服务器的文件名与本地的文件名一致
 */
+ (instancetype)db_requestWithURL:(NSURL *)URL fileURL:(NSURL *)fileURL name:(NSString *)name;

/**
 *  生成单文件上传的 multipart/form-data 请求
 *
 *  @param URL      负责上传的 url
 *  @param fileURL  要上传的本地文件 url
 *  @param fileName 要保存在服务器上的文件名
 *  @param name     服务器脚本字段名
 *
 *  @return multipart/form-data POST 请求
 */
+ (instancetype)db_requestWithURL:(NSURL *)URL fileURL:(NSURL *)fileURL fileName:(NSString *)fileName name:(NSString *)name;

/**
 *  生成多文件上传的 multipart/form-data 请求
 *
 *  @param URL      负责上传的 url
 *  @param fileURLs 要上传的本地文件 url 数组
 *  @param name     服务器脚本字段名
 *
 *  @return multipart/form-data POST 请求，保存到服务器的文件名与本地的文件名一致
 */
+ (instancetype)db_requestWithURL:(NSURL *)URL fileURLs:(NSArray *)fileURLs name:(NSString *)name;

/**
 *  生成多文件上传的 multipart/form-data 请求
 *
 *  @param URL       负责上传的 url
 *  @param fileURLs  要上传的本地文件 url 数组
 *  @param fileNames 要保存在服务器上的文件名数组
 *  @param name      服务器脚本字段名
 *
 *  @return multipart/form-data POST 请求
 */
+ (instancetype)db_requestWithURL:(NSURL *)URL fileURLs:(NSArray *)fileURLs fileNames:(NSArray *)fileNames name:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
