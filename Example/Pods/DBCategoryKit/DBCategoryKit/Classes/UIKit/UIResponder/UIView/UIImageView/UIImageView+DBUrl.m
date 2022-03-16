//
//  UIImageView+DBUrl.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIImageView+DBUrl.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (DBUrl)

- (void)db_setImageWithUrl:(NSString *)urlString placeholderImage:(UIImage *)placeholder{
    [self sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:placeholder options:SDWebImageAllowInvalidSSLCertificates|SDWebImageRetryFailed completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
#if DEBUG
        if (imageURL && error) {
            NSLog(@"yc_setImageWithUrl:%@ error:%@",urlString,error);
        }
#endif
    }];
}

@end
