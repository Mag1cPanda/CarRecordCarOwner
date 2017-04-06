//
//  LRTabBarController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/14.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "LRTabBarController.h"
#import "LRNavigationController.h"
#import "HomeViewController.h"
#import "RecordViewController.h"
#import "EnterpriseViewController.h"
#import "MineViewController.h"

@interface LRTabBarController ()


@end

@implementation LRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"2086c5"]} forState:UIControlStateSelected];
    
    NSArray *names = @[@"首页", @"档案", @"企业", @"我的"];
    NSArray *imgAry = @[@"home", @"record", @"enterprise", @"mine"];
    NSArray *selectedImgAry = @[@"homeon", @"recordon", @"enterpriseon", @"mineon"];
    
    NSLog(@"%zi",self.viewControllers.count);
    
    for (int i=0; i<4; i++) {
        LRNavigationController *nav = self.viewControllers[i];
        UIViewController *vc = nav.viewControllers[0];
        UIImage *image = [UIImage imageNamed:imgAry[i]];
        UIImage *selectedImage = [[UIImage imageNamed:selectedImgAry[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:names[i] image:image selectedImage:selectedImage];
    }
    
}

#pragma mark - Lazy

@end
