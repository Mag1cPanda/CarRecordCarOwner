//
//  SettingViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/28.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *logo;

@property (weak, nonatomic) IBOutlet UILabel *versionLab;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"设置";
    self.view.backgroundColor = RGB(239, 239, 239);
    
}
- (IBAction)messageAlert:(id)sender {
    
    
}

- (IBAction)allowGetLocation:(id)sender {
    
}

- (IBAction)safeLogout:(id)sender {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
