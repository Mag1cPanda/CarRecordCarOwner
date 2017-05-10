//
//  WXJLDetailViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/4/6.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "WXJLDetailViewController.h"
#import "CWStarRateView.h"
#import "DetailCell.h"
#import "WXGSCell.h"
#import "WXPJCell.h"
#import "QTFYCell.h"
#import "LastCell.h"
#import "SRSectionHeader.h"
#import "EvaluateViewController.h"

@interface WXJLDetailViewController ()
<UITableViewDataSource,
UITableViewDelegate,
SRSectionHeaderDelegate>
{
    UITableView *table;
    CWStarRateView *starView;
    UILabel *nameLab;
    
    NSMutableDictionary *sectionDict;
    
    NSArray *titleArr0;
    
    UIButton *evaBtn;
    UIButton *comBtn;
}
@end

@implementation WXJLDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"维修记录详情";
    sectionDict = [NSMutableDictionary dictionary];
    titleArr0 = @[@"车牌号码",
                  @"车辆识别代码",
                  @"发动机号",
                  @"结算日期",
                  @"送修里程(公里)",
                  @"维修类别",
                  @"故障诊断"];
    
    UIImageView *backImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    backImg.image = [UIImage imageNamed:@"top-bg-max"];
    
    nameLab = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, ScreenWidth-60, 30)];
    nameLab.textColor = [UIColor whiteColor];
    nameLab.text = @"涂乐汽车养护美容服务专家";
    [backImg addSubview:nameLab];
    
    starView = [[CWStarRateView alloc] initWithFrame:CGRectMake(30, 60, 120, 20)];
    [backImg addSubview:starView];
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.tableHeaderView = backImg;
    [self.view addSubview:table];

    [table registerNib:[UINib nibWithNibName:@"DetailCell" bundle:nil] forCellReuseIdentifier:@"DetailCell"];
    [table registerNib:[UINib nibWithNibName:@"WXGSCell" bundle:nil] forCellReuseIdentifier:@"WXGSCell"];
    [table registerNib:[UINib nibWithNibName:@"WXPJCell" bundle:nil] forCellReuseIdentifier:@"WXPJCell"];
    [table registerNib:[UINib nibWithNibName:@"QTFYCell" bundle:nil] forCellReuseIdentifier:@"QTFYCell"];
    [table registerNib:[UINib nibWithNibName:@"LastCell" bundle:nil] forCellReuseIdentifier:@"LastCell"];
    
    [table registerClass:[SRSectionHeader class] forHeaderFooterViewReuseIdentifier:@"SRSectionHeader"];
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    footer.backgroundColor = RGB(234, 234, 236);
    
    UIColor *red = RGB(251, 29, 85);
    comBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 10, 60, 30)];
    [comBtn setTitle:@"投诉" forState:0];
    [comBtn setTitleColor:red forState:0];
    comBtn.titleLabel.font = LRFont(14);
    [comBtn addTarget:self action:@selector(comBtnClicked) forControlEvents:1<<6];
    [footer addSubview:comBtn];
    
    evaBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-100, 0, 100, 50)];
    evaBtn.backgroundColor = red;
    [evaBtn setTitle:@"评价" forState:0];
    [evaBtn setTitleColor:[UIColor whiteColor] forState:0];
    evaBtn.titleLabel.font = LRFont(14);
    [evaBtn addTarget:self action:@selector(evaBtnClicked) forControlEvents:1<<6];
    [footer addSubview:evaBtn];
    
    table.tableFooterView = footer;
    
}

#pragma mark - 评价
-(void)evaBtnClicked
{
    EvaluateViewController *vc = [EvaluateViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 投诉
-(void)comBtnClicked
{
    
}

#pragma mark - TableView Delegate & DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 7;
    }
    
    else if (section == 1) {
        SRSectionHeader *header = sectionDict[@(section)];
        if (header.isOpen) {
            return 1;
        }
        else {
            return 0;
        }
    }
    
    else if (section == 2) {
        SRSectionHeader *header = sectionDict[@(section)];
        if (header.isOpen) {
            return 1;
        }
        else {
            return 0;
        }
    }
    
    else if (section == 3) {
        SRSectionHeader *header = sectionDict[@(section)];
        if (header.isOpen) {
            return 1;
        }
        else {
            return 0;
        }
    }
    
    else {
        return 1;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    static NSString *headerID = @"srHeader";
    SRSectionHeader *header = sectionDict[@(section)];
    if (!header) {
        header = [[SRSectionHeader alloc] initWithReuseIdentifier:headerID];
//        header.contentView.backgroundColor = [UIColor whiteColor];
//        header.isOpen = YES;//默认打开
        header.delegate = self;
        header.section = section;
        //把sectionheader保存到字典中
        [sectionDict setObject:header forKey:@(section)];
    }
    
    //设置分组名
    if (section == 1) {
        header.titleLab.text = @"维修工时";
        return header;
    }
    
    else if (section == 2) {
        header.titleLab.text = @"维修配件";
        return header;
    }
    
    else if (section == 3) {
        header.titleLab.text = @"其他费用";
        return header;
    }
    
    else {
        return nil;
    }
    
}

-(void)sr_SectionHeader:(SRSectionHeader *)header didSelectedSection:(NSInteger)section
{
    NSLog(@"点击分组 -> %zi",section);
    SRSectionHeader *srHeader = sectionDict[@(section)];
    
    BOOL isOpen = srHeader.isOpen;
    [srHeader setIsOpen:!isOpen];
    
    [table reloadSections:[NSIndexSet indexSetWithIndex:header.section] withRowAnimation:UITableViewRowAnimationFade];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1 || section == 2 || section == 3) {
        return 44;
    }

    
    else {
        return 0;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 44;
    }
    
    else if (indexPath.section == 1) {
        return 176;
    }
    
    else if (indexPath.section == 2) {
        return 264;
    }
    
    else if (indexPath.section == 3) {
        return 88;
    }
    
    else {
        return 140;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.leftLab.text = titleArr0[indexPath.row];
        return cell;
    }
    
    else if (indexPath.section == 1) {
        WXGSCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WXGSCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    else if (indexPath.section == 2) {
        WXPJCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WXPJCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    else if (indexPath.section == 3) {
        QTFYCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QTFYCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    else {
        LastCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LastCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}




@end
