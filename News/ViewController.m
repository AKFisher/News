//
//  ViewController.m
//  News
//
//  Created by tom on 16/12/1.
//  Copyright © 2016年 taogoo. All rights reserved.
//

#import "ViewController.h"
#import "NewsViewModel.h"
#import "NewsViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSArray <NewsModel *> * newsModels ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NewsViewModel *newsVM = [[NewsViewModel alloc]init];
    [newsVM setBlockDataSuccess:^(id dataValue) {
        NSLog(@"请求数据成功,跟新UI");
        self.newsModels = dataValue ;
        [self.tableView reloadData];
    } dataError:^(id error) {
        NSLog(@"请求数据失败,更新UI");
    }];
    [newsVM fetchNewsData];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.newsModels.count ;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsViewCell *cell = [NewsViewCell cellWithTableView:tableView];
    cell.newsModel = self.newsModels[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsViewModel *newsVM = [[NewsViewModel alloc]init];
    
    [newsVM newsDetail:self.newsModels[indexPath.row] controller:self];


}


@end
