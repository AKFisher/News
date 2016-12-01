//
//  BaseViewModel.m
//  News
//
//  Created by tom on 16/12/1.
//  Copyright © 2016年 taogoo. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

-(void)setBlockDataSuccess:(DataSuccess) dataSuccess
               dataError:(DataError)dataError{
    _dataSuccess  = [dataSuccess copy];
    _dataError = [dataError copy];
}
@end
