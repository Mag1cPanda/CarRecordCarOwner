//
//  HomeViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/14.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "HomeViewController.h"
#import "LRCycleScrollView.h"
#import "QYDetailViewController.h"
#import "MJRefresh.h"
#import "UIImage+Extension.h"
#import "LRCitySelectController.h"
#import "LRNavigationController.h"
#import "HomeSectionZero.h"
#import "HomeSectionOne.h"
#import "HomeSectionTwo.h"
#import "HomeNavBtn.h"

@interface HomeViewController ()
<LRCycleScrollViewDelegate,
UITableViewDelegate,
UITableViewDataSource,
LRCitySelectDelegate,
HomeSectionZeroDelegate>
{
    UITableView *table;
    LRCycleScrollView *cycleScrollView;
    HomeNavBtn *cityBtn;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
//    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initTable];
    
    cityBtn = [[HomeNavBtn alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    [cityBtn setTitle:@"选择城市" forState:0];
    [cityBtn setTitleColor:[UIColor whiteColor] forState:0];
    cityBtn.titleLabel.font = LRFont(13);
    [cityBtn setImage:[UIImage imageNamed:@"icon_homepage_downArrow"] forState:UIControlStateNormal];
    cityBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [cityBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:cityBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}

#pragma mark - 左边按钮点击事件
-(void)leftBtnClick:(UIButton *)button
{
    NSLog(@"城市");
    LRCitySelectController *vc = [[LRCitySelectController alloc]init];
    vc.delegate = self;
    [self presentViewController:[[LRNavigationController alloc] initWithRootViewController:vc] animated:YES completion:^{
        
    }];
}

#pragma mark - LRCitySelectDelegate
-(void)cityListController:(LRCitySelectController *)listController didSelectCity:(NSDictionary *)cityData{
    
//    NSLog(@"%@",cityData);
    /*
     *@city_key 城市编号
     *@city_name 城市名字
     *@initials 城市
     *@pinyin 城市拼音
     *@short_name 城市短名
     */
    [cityBtn setTitle:[NSString stringWithFormat:@"%@",cityData[@"city_name"]] forState:UIControlStateNormal];
    [listController dismissViewControllerAnimated:YES completion:nil];
    
    NSDictionary *attrs = @{NSFontAttributeName : LRFont(13)};
    CGSize size=[cityBtn.titleLabel.text sizeWithAttributes:attrs];
    
    NSLog(@"%f",size.width);
    //需要加上图标的宽度
    [cityBtn setFrame:CGRectMake(0, 0, size.width+25, 40)];
    
}

-(void)cancelButtonPressed:(LRCitySelectController *)listController{
    
    [listController dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - 初始化TableView
-(void)initTable
{
    cycleScrollView = [LRCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 200) placeholderImage:[UIImage imageNamed:@"slide_img"]];
    cycleScrollView.delegate = self;
//    cycleScrollView.pageControlBottomOffset = 30;
    cycleScrollView.infiniteLoop = YES;
//    cycleScrollView.autoScrollTimeInterval = 3.0;
    cycleScrollView.autoScroll = false;
    
    NSArray *imgURLArr = @[@"http://p1.bqimg.com/567571/bb20a661a0210133.jpg",
                           @"http://p1.bqimg.com/567571/d159dd39c15025ce.jpg",
                           @"http://p1.bpimg.com/567571/1a105a4f6ab5f7ce.jpg"];
    
    cycleScrollView.imageURLStringsGroup = imgURLArr;
    
    
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.showsVerticalScrollIndicator = NO;
    table.tableHeaderView = cycleScrollView;
    //设置拉伸效果必须添加而不是设置tableHeaderView
//    [table insertSubview:cycleScrollView atIndex:0];
//    table.contentInset = UIEdgeInsetsMake(imageH, 0, 49, 0);
//    table.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 49, 0);
    
    [self.view addSubview:table];
    
//    [table registerClass:[HomeSectionZero class] forCellReuseIdentifier:@"HomeSectionZero"];
    
    [table registerNib:[UINib nibWithNibName:@"HomeSectionOne" bundle:nil] forCellReuseIdentifier:@"HomeSectionOne"];
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

#pragma mark - LRCycleScrollViewDelegate
-(void)cycleScrollView:(LRCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    NSLog(@"Scroll to index ~ %zi",index);
}

-(void)cycleScrollView:(LRCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"Click index ~ %zi",index);
}

#pragma mark - HomeSectionZeroDelegate
-(void)cell:(HomeSectionZero *)cell selectItemAtIndex:(NSInteger)index
{
    NSLog(@"%zi",index);
    if (index == 0) {
        
    }
    
    if (index == 1) {
        
    }
    
    if (index == 2) {
        
    }
    
    if (index == 3) {
        
    }
    
    if (index == 4) {
        
    }
    
    if (index == 5) {
        
    }
    
    if (index == 6) {
        
    }
}

#pragma mark - TableView Delegate & DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 30;
    }
    
    else {
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 170;//10 + 60 + 10 + 80 + 10
    }
    
    else if (indexPath.section == 1) {
        return 50;
    }
    
    else {
        return 100;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return 50;
    }
    
    else {
        return 10;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
        view.backgroundColor = RGB(234, 234, 236);
        [backView addSubview:view];
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 20, 20)];
        icon.image = [UIImage imageNamed:@"tuijian"];
        [backView addSubview:icon];
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(icon.maxX+5, 23, 100, 20)];
        lab.textColor = [UIColor darkGrayColor];
        lab.font = LRFont(14);
        lab.text = @"为您推荐";
        [backView addSubview:lab];
        
        UIView *bottemLine = [[UIView alloc] initWithFrame:CGRectMake(0, backView.height-1, ScreenWidth, 0.5)];
        bottemLine.backgroundColor = RGB(234, 234, 236);
        [backView addSubview:bottemLine];
        
        return backView;
    }
    
    else {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
        view.backgroundColor = RGB(234, 234, 236);
        return view;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *cellId = @"HomeSectionZero";
        
        HomeSectionZero *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell = [[HomeSectionZero alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.delegate = self;
            cell.isAdded = YES;
        }
        
        return cell;
    }
    
    else if (indexPath.section == 1) {
        HomeSectionOne *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeSectionOne"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    else {
        HomeSectionTwo *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeSectionTwo"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.icon2.hidden = YES;
        cell.lab2.hidden = YES;
        
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        //为您推荐
        QYDetailViewController *vc = [QYDetailViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.section == 1) {
        //通知
    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"%f",offsetY);
    
    //NavBar渐变
    if (offsetY <= 200) {
        CGFloat alpha = offsetY/200;
        self.navBarView.alpha = alpha;
        //Title显示隐藏
        if (offsetY <= 64) {
            //单独设置self.title会导致TabBarItem.title也改变
            self.navigationItem.title = @"";
        }
        else {
            self.navigationItem.title = @"首页";
        }
    }
    
    else {
        self.navBarView.alpha = 1;
    }
}

@end
