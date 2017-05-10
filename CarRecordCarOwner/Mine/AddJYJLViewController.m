//
//  AddJYJLViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/28.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "AddJYJLViewController.h"
#import "LRNavButton.h"
#import "DXPopover.h"
#import "ZJInputView.h"

@interface AddJYJLViewController ()
{
    LRNavButton *carnoBtn;
    ZJInputView *cost;
    ZJInputView *date;
    ZJInputView *remarks;
}

@property (weak, nonatomic) IBOutlet UIView *costBack;
@property (weak, nonatomic) IBOutlet UIView *dateBack;
@property (weak, nonatomic) IBOutlet UIView *remarksBack;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation AddJYJLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    carnoBtn = [[LRNavButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    carnoBtn.titleLabel.font = LRFont(15);
    [carnoBtn setImage:[UIImage imageNamed:@"ycxl"] forState:0];
    [carnoBtn setTitle:@"浙A9A9B9" forState:0];
    [carnoBtn addTarget:self action:@selector(carnoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = carnoBtn;
    
    
}

-(void)viewDidLayoutSubviews
{
    cost = [[ZJInputView alloc] initWithFrame:_costBack.bounds];
    cost.title = @"加油费用";
    cost.field.placeholder = @"请输入维修费用（元）";
    [_costBack addSubview:cost];
    
    date = [[ZJInputView alloc] initWithFrame:_dateBack.bounds];
    date.title = @"加油日期";
    date.field.placeholder = @"请输入加油日期";
    [_dateBack addSubview:date];
    
    remarks = [[ZJInputView alloc] initWithFrame:_remarksBack.bounds];
    remarks.title = @"备注";
    remarks.field.placeholder = @"请输入备注信息";
    [_remarksBack addSubview:remarks];
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


- (IBAction)saveBtnClicked:(id)sender {
    
}

@end
