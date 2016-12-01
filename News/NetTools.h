//
//  NetTools.h
//  
//
//  Created by tom on 16/5/20.
//  Copyright © 2016年 sm. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HttpSuccess)(id responseObject);

typedef void(^HttpFailure)(NSError *error );

@interface NetTools : NSObject

+(NSURLSessionDataTask *) GetPath:(NSString *) path params:(NSDictionary *) params success:(HttpSuccess) success failure:(HttpFailure) failure ;
+(NSURLSessionDataTask *) GetPath:(NSString *) path params:(NSDictionary *) params headerParams:(NSDictionary *)headerParams success:(HttpSuccess) success failure:(HttpFailure) failure ;



+(NSURLSessionDataTask *) PostPath:(NSString *)path params:(NSDictionary *) params success:(HttpSuccess) success failure :(HttpFailure) failure;

@end
