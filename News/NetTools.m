//
//  NetTools.m
//  
//
//  Created by tom on 16/5/20.
//  Copyright © 2016年 sm. All rights reserved.
//

#import "NetTools.h"
#import "AFNetworking.h"

@implementation NetTools


+(NSURLSessionDataTask *)GetPath:(NSString *)path params:(NSDictionary *)params headerParams:(NSDictionary *)headerParams success:(HttpSuccess)success failure:(HttpFailure)failure {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain",nil];
    
   [headerParams enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
       [manager.requestSerializer setValue:obj forHTTPHeaderField:key];
   }];
    
   
    NSURLSessionDataTask *task = [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO ;
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (failure) {
            failure(error);
        }
    }];

    return task;
}
+(NSURLSessionDataTask *)GetPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES ;
    return [self GetPath:path params:params headerParams:nil success:success failure:failure];
}

+ (NSURLSessionDataTask *)PostPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES ;

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
    NSURLSessionDataTask *task = [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (failure) {
            failure(error);
        }
    }];
    
    return task;
}
@end
