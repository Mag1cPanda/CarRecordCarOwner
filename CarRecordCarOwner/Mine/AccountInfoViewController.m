//
//  AccountInfoViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/20.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "AccountInfoViewController.h"
#import "AccountInfoCell.h"
#import "VerifyViewController.h"

@interface AccountInfoViewController ()
<UITableViewDelegate,
UITableViewDataSource>
{
    UITableView *table;
    UIImageView *carImageV;
    UILabel *isVerLab;
    
    NSArray *titleArr;
}
@end

@implementation AccountInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"账户信息";
    titleArr = @[@"更换头像",
                 @"账号",
                 @"昵称",
                 @"手机号码"];
    
    UIImageView *backImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    backImg.image = [UIImage imageNamed:@"top-bg-max"];
    backImg.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToVerify)];
    [backImg addGestureRecognizer:tap];
    
    carImageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    carImageV.image = [UIImage imageNamed:@"caricon"];
    carImageV.layer.cornerRadius = 40;
    carImageV.clipsToBounds = YES;
    [backImg addSubview:carImageV];
    
    isVerLab = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth-100, 42, 50, 20)];
    isVerLab.font = LRFont(14);
    isVerLab.text = @"未认证";
    isVerLab.textColor = [UIColor whiteColor];
    [backImg addSubview:isVerLab];
    
    UIImageView *rightImageV = [[UIImageView alloc] initWithFrame:CGRectMake(isVerLab.maxX+5, 45, 7, 14)];
    rightImageV.image = [UIImage imageNamed:@"enter"];
    [backImg addSubview:rightImageV];
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.tableHeaderView = backImg;
    table.tableFooterView = [UIView new];
    table.backgroundColor = RGB(234, 234, 236);
    table.scrollEnabled = false;
    [self.view addSubview:table];
    
    [table registerNib:[UINib nibWithNibName:@"AccountInfoCell" bundle:nil] forCellReuseIdentifier:@"AccountInfoCell"];
}

-(void)jumpToVerify
{
    VerifyViewController *vc = [VerifyViewController new];
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
        return 4;
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
    AccountInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccountInfoCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        cell.leftLab.text = titleArr[indexPath.row];
        if (indexPath.row == 1) {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    else {
        cell.leftLab.text = @"修改密码";
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
        }
        
        if (indexPath.row == 1) {
            
        }
        
        if (indexPath.row == 2) {
            
        }
    }
    
    else {
        
    }
}


@end
