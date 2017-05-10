//
//  WXJLViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/4/6.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "WXJLViewController.h"
#import "MJRefresh.h"
#import "WXJLCell.h"
#import "WXJLDetailViewController.h"

@interface WXJLViewController ()
<UITableViewDelegate,
UITableViewDataSource>
{
    UITableView *table;
    UIImageView *carImageV;
    UILabel *carnoLab;
    
}
@end

@implementation WXJLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"维修记录";
    
    UIImageView *backImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    backImg.image = [UIImage imageNamed:@"top-bg-max"];
    
    carImageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    carImageV.image = [UIImage imageNamed:@"caricon"];
    carImageV.layer.cornerRadius = 40;
    carImageV.clipsToBounds = YES;
    [backImg addSubview:carImageV];
    
    carnoLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 150, 20)];
    carnoLab.text = @"浙APK888";
    carnoLab.textColor = [UIColor whiteColor];
    [backImg addSubview:carnoLab];
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.tableHeaderView = backImg;
    [self.view addSubview:table];
    
    [table registerNib:[UINib nibWithNibName:@"WXJLCell" bundle:nil] forCellReuseIdentifier:@"WXJLCell"];
    
    table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        NSLog(@"MJRefreshHeader");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [table.mj_header endRefreshing];
            
        });
        
    }];
}

#pragma mark - TableView Delegate & DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 181;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WXJLCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WXJLCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WXJLDetailViewController *vc = [WXJLDetailViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
