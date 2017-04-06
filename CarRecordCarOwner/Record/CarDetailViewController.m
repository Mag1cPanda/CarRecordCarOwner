//
//  CarDetailViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/18.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "CarDetailViewController.h"
#import "SRSelectListView.h"
#import "ZJInputView.h"

@interface CarDetailViewController ()
{
    UIScrollView *scroll;
    UIImageView *carImageV;
    UILabel *carnoLab;
    
    ZJInputView *clsbm;
    ZJInputView *fdjh;
    ZJInputView *cllx;
    ZJInputView *syxz;
    ZJInputView *clpp;
    ZJInputView *rllx;
    ZJInputView *zcrq;
    ZJInputView *fzrq;
    
    SRSelectListView *carTypeSelect;
    SRSelectListView *useTypeSelect;
    SRSelectListView *carBrandSelect;
    SRSelectListView *fuelTypeSelect;
    
    NSArray *titleArr;
}

@end

@implementation CarDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"车辆详情";
    titleArr = @[@"车辆识别码",
                 @"发动机号",
                 @"车辆类型",
                 @"使用性质",
                 @"车辆品牌",
                 @"燃料类型",
                 @"注册日期",
                 @"发证日期"];
    
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moreBtn.frame = CGRectMake(0, 0, 40, 40);
    [moreBtn setImage:[UIImage imageNamed:@"addcar"] forState:0];
    [moreBtn addTarget:self action:@selector(rightBtnClicked:) forControlEvents:1<<6];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:moreBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self initScroll];
}

-(void)initScroll
{
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64)];
    [self.view addSubview:scroll];
    
    UIImageView *backImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    backImg.image = [UIImage imageNamed:@"top-bg-max"];
    [scroll addSubview:backImg];
    
    carImageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    carImageV.image = [UIImage imageNamed:@"caricon"];
    carImageV.layer.cornerRadius = 40;
    carImageV.clipsToBounds = YES;
    [backImg addSubview:carImageV];
    
    carnoLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 150, 20)];
    carnoLab.text = @"浙APK888";
    carnoLab.textColor = [UIColor whiteColor];
    [backImg addSubview:carnoLab];
    
    UIView *gapView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 10)];
    gapView.backgroundColor = RGB(239, 239, 239);
    [scroll addSubview:gapView];
    
    for (int i=0; i<8; i++) {
        ZJInputView *inputView = [[ZJInputView alloc] initWithFrame:CGRectMake(10, 110+50*i, ScreenWidth-20, 50)];
        inputView.title = titleArr[i];
        inputView.tag = 100+i;
        [scroll addSubview:inputView];
    }
    
    UIButton *editBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 110+400+50, ScreenWidth-30, 50)];
    [editBtn setTitle:@"编辑" forState:0];
    [editBtn setBackgroundColor:RGB(22, 122, 187)];
    editBtn.layer.cornerRadius = 5;
    editBtn.titleLabel.font = LRFont(14);
    [scroll addSubview:editBtn];
    
    scroll.contentSize = CGSizeMake(ScreenWidth, editBtn.maxY + 50);
    
}

#pragma mark - 导航栏右边按钮点击事件
-(void)rightBtnClicked:(UIButton *)sender
{

}


@end
