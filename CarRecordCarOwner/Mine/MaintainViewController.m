//
//  MaintainViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/20.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "MaintainViewController.h"
#import "RecordCell.h"
#import "TotalCell.h"
#import "LRNavButton.h"
#import "DXPopover.h"
#import "ChartViewController.h"

@interface MaintainViewController ()
<UITableViewDelegate,
UITableViewDataSource>
{
    UITableView *table;
    LRNavButton *carnoBtn;
}
@end

@implementation MaintainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    carnoBtn = [[LRNavButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    carnoBtn.titleLabel.font = LRFont(15);
    [carnoBtn setImage:[UIImage imageNamed:@"ycxl"] forState:0];
    [carnoBtn setTitle:@"浙A9A9B9" forState:0];
    [carnoBtn addTarget:self action:@selector(carnoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = carnoBtn;
    
    
    UIButton *moreBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    moreBtn.titleLabel.font = LRFont(14);
    [moreBtn setTitle:@"更多" forState:0];
    [moreBtn setTitleColor:[UIColor whiteColor] forState:0];
    [moreBtn addTarget:self action:@selector(rightBtnClicked) forControlEvents:1<<6];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:moreBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.tableFooterView = [UIView new];
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
    
    
    [table registerNib:[UINib nibWithNibName:@"TotalCell" bundle:nil] forCellReuseIdentifier:@"TotalCell"];
    [table registerNib:[UINib nibWithNibName:@"RecordCell" bundle:nil] forCellReuseIdentifier:@"RecordCell"];
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

-(void)rightBtnClicked
{
    
}

#pragma mark - TableView Delegate & DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5+1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 100;
    }
    
    else {
        return 130;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        TotalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TotalCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.yearBtn addTarget:self action:@selector(yearBtnClicked:) forControlEvents:1<<6];
        [cell.formsBtn addTarget:self action:@selector(formsBtnClicked) forControlEvents:1<<6];
        return cell;
    }
    
    else {
        RecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecordCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 5) {
            cell.blueLine.hidden = YES;
        }
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - 年份
-(void)yearBtnClicked:(UIButton *)btn
{
    CGRect rc = [btn.superview convertRect:btn.frame toView:self.view];
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rc), CGRectGetMaxY(rc));
    NSArray *arr = @[@"2016",@"2017"];
    
    DXPopover *popover = [DXPopover popover];
    [popover sr_showAtPoint:startPoint tableWidth:100 titleArray:arr popoverPostion:DXPopoverPositionDown inView:self.navigationController.view];
    popover.block = ^(NSInteger index, NSString *content) {
      
        NSLog(@"%zi, %@",index,content);
        [btn setTitle:content forState:0];
        
    };
}

#pragma mark - 报表
-(void)formsBtnClicked
{
    ChartViewController *vc = [ChartViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
