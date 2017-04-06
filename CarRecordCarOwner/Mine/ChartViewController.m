//
//  ChartViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/28.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "ChartViewController.h"
#import "LRNavButton.h"
#import "DXPopover.h"
#import "ChartCell.h"
#import "PNPieChart.h"

@interface ChartViewController ()
<UITableViewDelegate,
UITableViewDataSource>
{
    LRNavButton *carnoBtn;
    UITableView *table;
    NSArray *titleArr;
    
    UILabel *titleLab;
    
    PNPieChart *pieChart;
    UILabel *totalCost;
}
@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    titleArr = @[@"加油",
                 @"维修",
                 @"洗车"];
    
    carnoBtn = [[LRNavButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    carnoBtn.titleLabel.font = LRFont(15);
    [carnoBtn setImage:[UIImage imageNamed:@"ycxl"] forState:0];
    [carnoBtn setTitle:@"浙A9A9B9" forState:0];
    [carnoBtn addTarget:self action:@selector(carnoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = carnoBtn;
    
    [self initTable];
}

#pragma mark - 初始化TableView
-(void)initTable
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 320)];
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, ScreenWidth-30, 20)];
    titleLab.font = LRFont(15);
    titleLab.text = @"2016年费用报表";
    [header addSubview:titleLab];
    
    UIView *grayLine = [[UIView alloc] initWithFrame:CGRectMake(10, 50, ScreenWidth-20, 0.5)];
    grayLine.backgroundColor = [UIColor lightGrayColor];
    [header addSubview:grayLine];
    
    UIColor *red = RGB(251, 29, 85);
    UIColor *blue = RGB(22, 122, 187);
    UIColor *orange = RGB(253, 155, 49);
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:90 color:red description:@"加油"],
                       [PNPieChartDataItem dataItemWithValue:6 color:blue description:@"洗车"],
                       [PNPieChartDataItem dataItemWithValue:4 color:orange description:@"维修"]
                       ];
    
    pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(0, 0, 200, 200) items:items];
    pieChart.center = CGPointMake(CGRectGetMidX(header.frame), CGRectGetMidY(header.frame)+20);
    pieChart.descriptionTextColor = [UIColor whiteColor];
    pieChart.descriptionTextFont = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
    pieChart.descriptionTextShadowColor = [UIColor clearColor];
    pieChart.showAbsoluteValues = NO;
    pieChart.showOnlyValues = NO;
    [pieChart strokeChart];
    
    pieChart.legendStyle = PNLegendItemStyleStacked;
    pieChart.legendFontColor = [UIColor darkGrayColor];
    pieChart.legendFont = LRFont(14);
    
    UIView *legend = [pieChart getLegendWithMaxWidth:200];
    [legend setFrame:CGRectMake(ScreenWidth-legend.frame.size.width-30, 70, legend.frame.size.width, legend.frame.size.height)];
    [header addSubview:legend];
    [header addSubview:pieChart];
    
    totalCost = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    totalCost.center = CGPointMake(CGRectGetMidX(header.frame), CGRectGetMidY(header.frame)+20);
    totalCost.textColor = RGB(22, 122, 187);
    totalCost.textAlignment = NSTextAlignmentCenter;
    totalCost.font = LRFont(14);
    totalCost.text = @"总消费\n99999元";
    totalCost.numberOfLines = 2;
    [header addSubview:totalCost];
    
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.tableHeaderView = header;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    table.tableFooterView = [UIView new];
    [self.view addSubview:table];
    
    [table registerNib:[UINib nibWithNibName:@"ChartCell" bundle:nil] forCellReuseIdentifier:@"ChartCell"];
}

-(void)carnoBtnClick:(UIButton *)btn
{
    CGPoint startPoint =
    CGPointMake(CGRectGetMidX(btn.frame), CGRectGetMaxY(btn.frame) + 20);
    NSArray *arr = @[@"浙APK888",@"浙APK888"];
    
    DXPopover *popover = [DXPopover popover];
    [popover sr_showAtPoint:startPoint tableWidth:100 titleArray:arr popoverPostion:DXPopoverPositionDown inView:self.navigationController.view];
    popover.block = ^(NSInteger index, NSString *content) {
        
        NSLog(@"%zi, %@",index,content);
        [btn setTitle:content forState:0];
        
    };
}

#pragma mark - TableView Delegate & DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    backView.backgroundColor = RGB(198, 226, 241);
    
    CGFloat labWidth = ScreenWidth/3;
    UILabel *typeLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labWidth, 40)];
    typeLab.textColor = RGB(22, 122, 187);
    typeLab.font = LRFont(15);
    typeLab.textAlignment = NSTextAlignmentCenter;
    typeLab.text = @"类型";
    [backView addSubview:typeLab];
    
    UILabel *percentLab = [[UILabel alloc] initWithFrame:CGRectMake(labWidth, 0, labWidth, 40)];
    percentLab.textColor = RGB(22, 122, 187);
    percentLab.font = LRFont(15);
    percentLab.textAlignment = NSTextAlignmentCenter;
    percentLab.text = @"消费占比";
    [backView addSubview:percentLab];
    
    UILabel *costLab = [[UILabel alloc] initWithFrame:CGRectMake(labWidth * 2, 0, labWidth, 40)];
    costLab.textColor = RGB(22, 122, 187);
    costLab.font = LRFont(15);
    costLab.textAlignment = NSTextAlignmentCenter;
    costLab.text = @"消费金额";
    [backView addSubview:costLab];
    
    return backView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChartCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.typeLab.text = @"加油";
        cell.percentLab.text = @"90.0%";
        cell.costLab.text = @"90.00";
    }
    
    if (indexPath.row == 1) {
        cell.typeLab.text = @"维修";
        cell.percentLab.text = @"6.0%";
        cell.costLab.text = @"6.00";
    }
    
    if (indexPath.row == 2) {
        cell.typeLab.text = @"洗车";
        cell.percentLab.text = @"4.0%";
        cell.costLab.text = @"4.00";
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
