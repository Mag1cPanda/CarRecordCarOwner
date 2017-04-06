//
//  CarManageViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/18.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "CarManageViewController.h"
#import "SRPopMenu.h"
#import "AddCarViewController.h"
#import "CameraAddViewController.h"
#import "MJRefresh.h"
#import "HomeSectionTwo.h"
#import "CarDetailViewController.h"

@interface CarManageViewController ()
<UITableViewDelegate,
UITableViewDataSource>
{
    UITableView *table;
}
@end

@implementation CarManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"车辆管理";
    
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moreBtn.frame = CGRectMake(0, 0, 40, 40);
    [moreBtn setImage:[UIImage imageNamed:@"addcar"] forState:0];
    [moreBtn addTarget:self action:@selector(rightBtnClicked:) forControlEvents:1<<6];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:moreBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self initTable];
}

#pragma mark - 初始化TableView
-(void)initTable
{
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    [table registerNib:[UINib nibWithNibName:@"HomeSectionTwo" bundle:nil] forCellReuseIdentifier:@"HomeSectionTwo"];
    
    table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        NSLog(@"MJRefreshHeader");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [table.mj_header endRefreshing];
            
        });
        
    }];
    
    table.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [table.mj_footer endRefreshing];
            
        });
        
    }];
}

#pragma mark - 导航栏右边按钮点击事件
-(void)rightBtnClicked:(UIButton *)sender
{
    [SRPopMenu showWithItems:@[@{@"title":@"手动添加车辆"},
                               @{@"title":@"拍照上传车辆"}]
                       width:120
            triangleLocation:CGPointMake([UIScreen mainScreen].bounds.size.width-35, 64+5)
                      action:^(NSInteger index) {
                          
                          NSLog(@"点击了第%ld行",index);
                          if (index == 0) {
                              AddCarViewController *vc = [AddCarViewController new];
                              vc.hidesBottomBarWhenPushed = YES;
                              [self.navigationController pushViewController:vc animated:YES];
                          }
                          
                          else {
                              CameraAddViewController *vc = [CameraAddViewController new];
                              vc.hidesBottomBarWhenPushed = YES;
                              [self.navigationController pushViewController:vc animated:YES];
                          }
                          
                      }];
}


#pragma mark - TableView Delegate & DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeSectionTwo *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeSectionTwo"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.icon1.hidden = YES;
    cell.icon2.hidden = YES;
    cell.lab1.hidden = YES;
    cell.lab2.hidden = YES;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CarDetailViewController *vc = [CarDetailViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
