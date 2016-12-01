//
//  NewsViewCell.m
//  News
//
//  Created by tom on 16/12/1.
//  Copyright © 2016年 taogoo. All rights reserved.
//

#import "NewsViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface NewsViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *newsDesc;
@property (weak, nonatomic) IBOutlet UILabel *newsTime;

@end

@implementation NewsViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView {

  static NSString *ID = @"NewsViewCelll";
    
    NewsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[UINib nibWithNibName:@"NewsViewCell" bundle:nil]  instantiateWithOwner:nil options:nil] lastObject ];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setNewsModel:(NewsModel *)newsModel {
    _newsModel = newsModel ;

    self.newsTitle.text = newsModel.title ;
    self.newsDesc.text = newsModel.desc ;
    self.newsTime.text = newsModel.ctime ;

    [self.newsImage setImageWithURL:[NSURL URLWithString:newsModel.picUrl]];
}

@end
