//
//  NewsViewModel.h
//  News
//
//  Created by tom on 16/12/1.
//  Copyright © 2016年 taogoo. All rights reserved.
//

#import "BaseViewModel.h"
#import "NewsModel.h"
#import <UIKit/UIKit.h>

@interface NewsViewModel : BaseViewModel

-(void)fetchNewsData ;

-(void)newsDetail:(NewsModel *)newsModel controller:(UIViewController *) controller ;

@end
