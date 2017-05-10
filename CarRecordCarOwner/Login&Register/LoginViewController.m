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
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
        LRTabBarController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LRTabBarController"];
        
        CATransition *transition = [CATransition animation];
        transition.duration = 1.0;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        transition.type = kCATransitionReveal;
        [self.view.window.layer addAnimation:transition forKey:@"animation"];
        
        self.view.window.rootViewController = vc;
        
        //修改根控制器时，注意内存，以免泄露
        //如果是设置页面点击退出按钮present过来的必须dismiss
        //如果不dismiss掉 ，则settingVC不会被释放，栈顶元素无法被释放，栈顶下面的控制器都无法释放。
        /*
         1.动画状态必须关闭，根控制器的切换与dismisse的动画同时进行会给用户带来较差的体验效果。
         2在项目开发中，只要有present出来的控制器，一定要有对应的dismiss，否则项目中会存在无法估量的bug
         */
        if (_isLogout) {
            NSLog(@"dismiss");
            [self.navigationController dismissViewControllerAnimated:false completion:nil];
        }
    });
    
}



@end
