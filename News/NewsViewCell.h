//
//  NewsViewCell.h
//  News
//
//  Created by tom on 16/12/1.
//  Copyright © 2016年 taogoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
@interface NewsViewCell : UITableViewCell


+(instancetype)cellWithTableView:(UITableView*)tableView;

@property(nonatomic,strong) NewsModel  *newsModel ;


@end
