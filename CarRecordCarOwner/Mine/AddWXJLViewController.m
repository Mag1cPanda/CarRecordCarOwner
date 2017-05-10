//
//  AddWXJLViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/28.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "AddWXJLViewController.h"
#import "LRNavButton.h"
#import "DXPopover.h"
#import "BaseInputCell.h"
#import "WXJLPJCell.h"

@interface AddWXJLViewController ()
<UITableViewDelegate,
UITableViewDataSource>
{
    LRNavButton *carnoBtn;
    UITableView *table;
    NSArray *titleArr;
    NSArray *placeholdArr;
}
@end

@implementation AddWXJLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    titleArr = @[@"维修费用",
                 @"送修日期",
                 @"里程表",
                 @"故障描述",
                 @"维修项目",
                 @"备注"];
    placeholdArr = @[@"请输入维修费用",
                     @"请输入送修日期",
                     @"请输入里程",
                     @"请输入故障描述",
                     @"请输入维修项目",
                     @"请输入备注信息"];
    
    carnoBtn = [[LRNavButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    carnoBtn.titleLabel.font = LRFont(15);
    [carnoBtn setImage:[UIImage imageNamed:@"ycxl"] forState:0];
    [carnoBtn setTitle:@"浙A9A9B9" forState:0];
    [carnoBtn addTarget:self action:@selector(carnoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = carnoBtn;
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
    
//    [table registerNib:[UINib nibWithNibName:@"BaseInputCell" bundle:nil] forCellReuseIdentifier:@"BaseInputCell"];
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    
    UIButton *saveBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 40, ScreenWidth-40, 50)];
    [saveBtn setTitle:@"保存" forState:0];
    [saveBtn setBackgroundColor:RGB(22, 122, 187)];
    saveBtn.layer.cornerRadius = 5;
    saveBtn.titleLabel.font = LRFont(14);
    [footer addSubview:saveBtn];
    table.tableFooterView = footer;
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 6;
    }
    
    else {
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 50;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    
    UIView *gap = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
    gap.backgroundColor = RGB(239, 239, 239);
    [backView addSubview:gap];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 200, 20)];
    lab.textColor = RGB(22, 122, 187);
    lab.font = LRFont(15);
    lab.text = @"如果您有更换配件";
    [backView addSubview:lab];
    
    UIButton *arrowBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-40, 25, 20, 10)];
    [arrowBtn setImage:[UIImage imageNamed:@"xlblue"] forState:0];
    [backView addSubview:arrowBtn];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 49, ScreenWidth, 0.5)];
    line.backgroundColor = [UIColor lightGrayColor];
    [backView addSubview:line];
    
    return backView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 50;
    }
    
    else {
        return 100;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        //根据indexPath准确地取出一行，而不是从cell重用队列中取出
        BaseInputCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (!cell) {
            cell= (BaseInputCell *)[[[NSBundle  mainBundle] loadNibNamed:@"BaseInputCell" owner:nil options:nil]  lastObject];
            cell.titleLab.text = titleArr[indexPath.row];
            cell.field.placeholder = placeholdArr[indexPath.row];
        }
        
        //隐藏最底部的横线
        if (indexPath.row == 5) {
            cell.bottemLine.hidden = YES;
        }
        return cell; ;;
    }
    
    else {
        //根据indexPath准确地取出一行，而不是从cell重用队列中取出
        WXJLPJCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (!cell) {
            cell= (WXJLPJCell *)[[[NSBundle  mainBundle] loadNibNamed:@"WXJLPJCell" owner:nil options:nil]  lastObject];
        }
        return cell; ;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end
