//
//  GradientViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/17.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "GradientViewController.h"
#import "UIImage+Extension.h"

@interface GradientViewController ()

@end

@implementation GradientViewController

- (UIView *)navBarView {
    if (!_navBarView) {
        UIImageView *navBarView = [[UIImageView alloc] init];
        navBarView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
        navBarView.image = [UIImage imageNamed:@"top-bg-mini"];
        //        [self.view insertSubview:navBarView atIndex:0];//放入栈顶
        [self.view addSubview:navBarView];
        self.navBarView = navBarView;
    }
    return _navBarView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    NSArray *arr = self.navigationController.viewControllers;
    if (arr.count > 1)
    {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.frame = CGRectMake(0, 0, 44, 44);
        [_backBtn addTarget:self action:@selector(backAction) forControlEvents:1 << 6];
        
        [_backBtn setImage:[UIImage imageNamed:@"nav_back"] forState:0];
        
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:_backBtn];
        self.navigationItem.leftBarButtonItem = item;
        
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - 返回按钮点击事件（返回首页）
- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
