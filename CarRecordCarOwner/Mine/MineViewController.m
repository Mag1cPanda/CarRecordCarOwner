//
//  MineViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/14.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "MineViewController.h"
#import "MJRefresh.h"
#import "MineCell.h"
#import "AccountInfoViewController.h"
#import "MyCarViewController.h"
#import "MyComplaintViewController.h"
#import "MaintainViewController.h"
#import "VerifyViewController.h"
#import "SettingViewController.h"

@interface MineViewController ()
<UITableViewDelegate,
UITableViewDataSource>
{
    UITableView *table;
    UIImageView *carImageV;
    UILabel *phoneLab;
    
    NSArray *iconArr;
    NSArray *titleArr;
}
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    iconArr = @[@"mycar", @"mycom", @"myrecord"];
    titleArr = @[@"我的车辆", @"我的投诉", @"养车记录"];
    
    UIButton *settingBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [settingBtn setImage:[UIImage imageNamed:@"setting"] forState:0];

    [settingBtn addTarget:self action:@selector(rightBtnClicked) forControlEvents:1<<6];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self initTable];
}

-(void)rightBtnClicked
{
    SettingViewController *vc = [SettingViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 初始化TableView
-(void)initTable
{
    UIImageView *backImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    backImg.image = [UIImage imageNamed:@"top-bg-max"];
    backImg.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToAccountInfo)];
    [backImg addGestureRecognizer:tap];
    
    carImageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    carImageV.image = [UIImage imageNamed:@"caricon"];
    carImageV.layer.cornerRadius = 40;
    carImageV.clipsToBounds = YES;
    [backImg addSubview:carImageV];
    
    phoneLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 150, 20)];
    phoneLab.text = @"18164102706";
    phoneLab.textColor = [UIColor whiteColor];
    [backImg addSubview:phoneLab];
    
    UIImageView *rightImageV = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth-40, 45, 7, 14)];
    rightImageV.image = [UIImage imageNamed:@"enter"];
    [backImg addSubview:rightImageV];
    
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.tableHeaderView = backImg;
    table.tableFooterView = [UIView new];
    table.scrollEnabled = false;
    table.backgroundColor = RGB(234, 234, 236);
    [self.view addSubview:table];
    
    [table registerNib:[UINib nibWithNibName:@"MineCell" bundle:nil] forCellReuseIdentifier:@"MineCell"];
    
}

-(void)jumpToAccountInfo
{
    AccountInfoViewController *vc = [AccountInfoViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - TableView Delegate & DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }
    
    else {
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        cell.icon.image = [UIImage imageNamed:iconArr[indexPath.row]];
        cell.leftLab.text = titleArr[indexPath.row];
    }
    else {
        cell.icon.image = [UIImage imageNamed:@"smrz"];
        cell.leftLab.text = @"实名认证";
        cell.rightLab.text = @"请认证";
        cell.rightLab.textColor = [UIColor redColor];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            MyCarViewController *vc = [MyCarViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        if (indexPath.row == 1) {
            MyComplaintViewController *vc = [MyComplaintViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        if (indexPath.row == 2) {
            MaintainViewController *vc = [MaintainViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
    else {
        VerifyViewController *vc = [VerifyViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
