//
//  LoginViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/14.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "LoginViewController.h"
#import "LRTabBarController.h"
#import "LRTextField.h"
#import "UIImage+Extension.h"
#import "ForgetViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet LRTextField *usrField;
@property (weak, nonatomic) IBOutlet LRTextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *forgetPwd;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LoginViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"登录";
    
    UIButton *regBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    regBtn.titleLabel.font = LRFont(14);
    [regBtn setTitle:@"免费注册" forState:0];
    [regBtn setTitleColor:[UIColor whiteColor] forState:0];
    [regBtn addTarget:self action:@selector(regBtnClicked) forControlEvents:1<<6];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:regBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UIImageView *leftView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 20)];
    leftView1.image = [UIImage imageNamed:@"username"];
    self.usrField.leftView = leftView1;
    self.usrField.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *leftView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 20)];
    leftView2.image = [UIImage imageNamed:@"password"];
    self.pwdField.leftView = leftView2;
    self.pwdField.leftViewMode = UITextFieldViewModeAlways;
}

#pragma mark - 忘记密码
- (IBAction)forgetPassword:(id)sender {
    ForgetViewController *vc = [ForgetViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 免费注册
-(void)regBtnClicked
{
    RegisterViewController *vc = [RegisterViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 登录
- (IBAction)loginBtnClicked:(id)sender {
    
    LRTabBarController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LRTabBarController"];
    self.view.window.rootViewController = vc;
}



@end
