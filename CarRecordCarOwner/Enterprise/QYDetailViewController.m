//
//  QYDetailViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/15.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "QYDetailViewController.h"
#import "QYDetailHeader.h"
#import "QYDSectionZeroCell.h"
#import "QYDSectionOneCell.h"
#import "QYDSectionTwoCell.h"
#import "UIImage+Extension.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

@interface QYDetailViewController ()
<UITableViewDelegate,
UITableViewDataSource>
{
    UITableView *table;
    QYDetailHeader *header;
    CGFloat tmpAlpha;
    
    NSArray *titleArr;
}
@end

@implementation QYDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    titleArr = @[@"企业资质",@"主修品牌",@"质保信息"];
    
    [self initTable];

}

#pragma mark - 初始化TableView
-(void)initTable
{
    header = [[NSBundle mainBundle] loadNibNamed:@"QYDetailHeader" owner:nil options:nil][0];
    header.starRating.userInteractionEnabled = false;
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    
    table.tableHeaderView = header;
    
    [self.view addSubview:table];
    
    [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    [table registerNib:[UINib nibWithNibName:@"QYDSectionZeroCell" bundle:nil] forCellReuseIdentifier:@"QYDSectionZeroCell"];
    
    [table registerNib:[UINib nibWithNibName:@"QYDSectionOneCell" bundle:nil] forCellReuseIdentifier:@"QYDSectionOneCell"];
    
    [table registerNib:[UINib nibWithNibName:@"QYDSectionTwoCell" bundle:nil] forCellReuseIdentifier:@"QYDSectionTwoCell"];
}

#pragma mark - TableView Delegate & DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }
    
    else if (section == 1) {
        return 1;
    }
    
    else {
        return 30;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 40;
    }
    
    else if (indexPath.section == 1) {
        return 100;
    }
    
    else {
        return 50;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }
    
    else {
        return 50;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
        lineView.backgroundColor = RGB(234, 234, 236);
        return lineView;
    }
    
    else if (section == 1) {
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
        backView.backgroundColor = [UIColor whiteColor];
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
        lineView.backgroundColor = RGB(234, 234, 236);
        [backView addSubview:lineView];
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 19, 20)];
        icon.image = [UIImage imageNamed:@"huodong"];
        [backView addSubview:icon];
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(icon.maxX+5, 20, 100, 20)];
        lab.textColor = [UIColor grayColor];
        lab.text = @"服务与活动";
        lab.font = LRFont(14);
        [backView addSubview:lab];
        
//        UIView *bottemLine = [[UIView alloc] initWithFrame:CGRectMake(10, backView.height-1, ScreenWidth-20, 1)];
//        bottemLine.backgroundColor = RGB(234, 234, 236);
//        [backView addSubview:bottemLine];
        
        return backView;
    }
    
    else {
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
        backView.backgroundColor = [UIColor whiteColor];
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
        lineView.backgroundColor = RGB(234, 234, 236);
        [backView addSubview:lineView];
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 16, 20)];
        icon.image = [UIImage imageNamed:@"pingjia"];
        [backView addSubview:icon];
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(icon.maxX+5, 20, 100, 20)];
        lab.textColor = [UIColor grayColor];
        lab.text = @"评价信息";
        lab.font = LRFont(14);
        [backView addSubview:lab];
        
//        UIView *bottemLine = [[UIView alloc] initWithFrame:CGRectMake(10, backView.height-1, ScreenWidth-20, 1)];
//        bottemLine.backgroundColor = RGB(234, 234, 236);
//        [backView addSubview:bottemLine];
        
        return backView;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        QYDSectionZeroCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QYDSectionZeroCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.leftLab.text = titleArr[indexPath.row];
        cell.rightLab.text = @"";
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = @"111";
    cell.textLabel.textColor = [UIColor grayColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    //NavBar渐变
    if (offsetY <= 200) {
        CGFloat alpha = offsetY/200;
        self.navBarView.alpha = alpha;
        //Title显示隐藏
        if (offsetY <= 64) {
            self.title = @"";
        }
        else {
            self.title = @"企业详情";
        }
    }
    
    else {
        self.navBarView.alpha = 1;
    }
}

@end
