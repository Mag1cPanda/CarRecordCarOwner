//
//  AddCarViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/18.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "AddCarViewController.h"
#import "ZJInputView.h"

@interface AddCarViewController ()
{
    NSArray *titleArr;
}
@end

@implementation AddCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"添加车辆";
    titleArr = @[@"车牌号",
                 @"VIN",
                 @"验证码"];
    
    for (int i=0; i<3; i++) {
        ZJInputView *inputView = [[ZJInputView alloc] initWithFrame:CGRectMake(10, 64+10+50*i, ScreenWidth-20, 50)];
        inputView.title = titleArr[i];
        inputView.tag = 100+i;
        [self.view addSubview:inputView];
    }
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 64+180, 100, 20)];
    lab.font = LRFont(14);
    lab.textColor = [UIColor darkGrayColor];
    lab.text = @"车辆照片";
    [self.view addSubview:lab];
    
    UIButton *addimgBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.width/2-46.5, lab.maxY+30, 93, 93)];
    [addimgBtn setImage:[UIImage imageNamed:@"addimg"] forState:0];
    [addimgBtn addTarget:self action:@selector(addImgae) forControlEvents:1<<6];
    [self.view addSubview:addimgBtn];
    
    UIButton *bottemBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, addimgBtn.maxY+30, ScreenWidth-30, 50)];
    [bottemBtn setTitle:@"添加" forState:0];
    [bottemBtn setBackgroundColor:RGB(22, 122, 187)];
    bottemBtn.layer.cornerRadius = 5;
    bottemBtn.titleLabel.font = LRFont(14);
    [self.view addSubview:bottemBtn];
}

-(void)addImgae
{
    
}



@end
