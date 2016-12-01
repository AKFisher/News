//
//  BaseViewModel.h
//  News
//
//  Created by tom on 16/12/1.
//  Copyright © 2016年 taogoo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DataSuccess)(id dataValue);
typedef void(^DataError)(id error);

@interface BaseViewModel : NSObject

@property(nonatomic,copy,readonly) DataSuccess dataSuccess ;
@property(nonatomic,copy,readonly) DataError dataError;

-(void)setBlockDataSuccess:(DataSuccess) dataSuccess dataError:(DataError ) dataError ;

@end
