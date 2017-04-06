//
//  EnterpriseViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/14.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "EnterpriseViewController.h"
#import "QYDetailViewController.h"
#import "MJRefresh.h"
#import "EnterpriseCell.h"
#import "JSDropDownMenu.h"

@interface EnterpriseViewController ()
<UITableViewDelegate,
UITableViewDataSource,
UISearchBarDelegate,
JSDropDownMenuDelegate,
JSDropDownMenuDataSource>
{
    UITableView *table;
    UISearchBar *searchBar;
    
    JSDropDownMenu *menu;
    NSMutableArray *data1;
    NSMutableArray *data2;
    NSMutableArray *data3;
    
    NSInteger currentData1Index;
    NSInteger currentData2Index;
    NSInteger currentData3Index;
    
}
@end

@implementation EnterpriseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initDropMenu];
    
    [self initTable];
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-30, 30)];
    searchBar.delegate = self;
    searchBar.placeholder = @"请输入维修企业名称";
    self.navigationItem.titleView = searchBar;
}

#pragma mark - DropMenu

-(void)initDropMenu
{
    // 指定默认选中

    data1 = [NSMutableArray arrayWithArray:@[@"全部区域", @"市辖区", @"上城区", @"下城区", @"江干区", @"拱墅区", @"西湖区"]];
    data2 = [NSMutableArray arrayWithObjects:@"全部维修企业", @"综合维修企业", @"4S店", nil];
    data3 = [NSMutableArray arrayWithObjects:@"总体评分", @"距离最近", @"服务态度", @"服务质量", @"维修效率", @"价格透明度", @"店面环境", nil];
    
    menu = [[JSDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:40];
    menu.indicatorColor = [UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:1.0];
    menu.separatorColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:0.9];//中间线
    menu.textColor = [UIColor colorWithRed:83.f/255.0f green:83.f/255.0f blue:83.f/255.0f alpha:1.0f];
    menu.dataSource = self;
    menu.delegate = self;
    
    [self.view addSubview:menu];
}

#pragma mark - JSDropDownMenu Detegate & DataSource
- (NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu//数量
{
    return 3;
}

//格式
-(BOOL)displayByCollectionViewInColumn:(NSInteger)column
{
    return NO;
}

-(BOOL)haveRightTableViewInColumn:(NSInteger)column
{
    return NO;
}

-(CGFloat)widthRatioOfLeftColumn:(NSInteger)column
{
    return 1;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column
{
    
    if (column == 0)
    {
        return currentData1Index;
    }
    else if (column==1)
    {
        
        return currentData2Index;
    }
    else
    {
        return currentData3Index;
    }
    
}

- (NSInteger)menu:(JSDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow
{
    if (column==0)
    {
        return data1.count;
    }
    else if (column==1)
    {
        return data2.count;
    }
    else
    {
        return data3.count;
    }
 
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForColumn:(NSInteger)column
{
    
    switch (column)
    {
        case 0: return data1[currentData1Index];
            break;
        case 1: return data2[currentData2Index];
            break;
        case 2: return data3[currentData3Index];
            break;
        default:
            return nil;
            break;
    }
    
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForRowAtIndexPath:(JSIndexPath *)indexPath//产生
{
    if (indexPath.column == 0)
    {
        return data1[indexPath.row];
    }
    else if (indexPath.column == 1)
    {
        return data2[indexPath.row];
    }
    else
    {
        return data3[indexPath.row];
    }
}

//此出可以和其他一起使用
- (void)menu:(JSDropDownMenu *)menu didSelectRowAtIndexPath:(JSIndexPath *)indexPath//点击
{
    
    if (indexPath.column == 0)
    {
        currentData1Index = indexPath.row;
        NSLog(@"%@",data1[currentData1Index]);
        
    }
    else if(indexPath.column == 1)
    {
        currentData2Index = indexPath.row;
        NSLog(@"%@",data2[currentData2Index]);
        
    }
    else
    {
        currentData3Index = indexPath.row;
        NSLog(@"%@",data3[currentData3Index]);
        
    }
    
}


#pragma mark - 初始化Table
-(void)initTable
{
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 104, ScreenWidth, ScreenHeight-104) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    [table registerNib:[UINib nibWithNibName:@"EnterpriseCell" bundle:nil] forCellReuseIdentifier:@"EnterpriseCell"];
    
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

#pragma mark - TableView Delegate & DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EnterpriseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EnterpriseCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QYDetailViewController *vc = [QYDetailViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}



@end
