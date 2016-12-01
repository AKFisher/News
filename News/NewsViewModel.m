//
//  NewsViewModel.m
//  News
//
//  Created by tom on 16/12/1.
//  Copyright © 2016年 taogoo. All rights reserved.
//

#import "NewsViewModel.h"
#import "NetTools.h"


@implementation NewsViewModel

-(void)fetchNewsData {

    NSDictionary *params = @{@"num":@10,@"page":@1};
    NSDictionary *header = @{@"apikey":@"6de7df48cdbb4a341a57ec2755982347"};
    [NetTools GetPath:@"http://apis.baidu.com/txapi/world/world" params:params headerParams:header success:^(id responseObject) {
        [self fetchNewsDataSuccess:responseObject];
    } failure:^(NSError *error) {
        [self fetchNewsDataError:error];
    }];

}

-(void)fetchNewsDataSuccess:(NSDictionary *) dict {
    NSArray *newslist = [dict objectForKey:@"newslist"];
    NSMutableArray *newsListArr = [NSMutableArray array];
    for (NSDictionary *news in newslist) {
        NewsModel *model = [[NewsModel alloc]init];
        model.ctime = [news objectForKey:@"ctime"];
        model.title = [news objectForKey:@"title"];
        model.desc = [news objectForKey:@"description"];
        model.picUrl = [news objectForKey:@"picUrl"];
        model.url = [news objectForKey:@"url"];
        [newsListArr addObject:model];
    }
    if (self.dataSuccess) {
        self.dataSuccess(newsListArr);
    }
}

-(void)fetchNewsDataError:(NSError *)error {

    if (self.dataError) {
        self.dataError(error);
    }
  
}

- (void)newsDetail:(NewsModel *)newsModel controller:(UIViewController *)controller {
    
    // 调转
    NSLog(@"跳转新闻详情页");
}

@end
