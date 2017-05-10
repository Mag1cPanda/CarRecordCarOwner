//
//  VerifyViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/22.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "VerifyViewController.h"
#import "ZJInputView.h"

@interface VerifyViewController ()
@property (nonatomic, strong) ZJInputView *name;
@property (nonatomic, strong) ZJInputView *idcard;

@property (weak, nonatomic) IBOutlet UIView *nameBack;
@property (weak, nonatomic) IBOutlet UIView *idcardBack;

@property (weak, nonatomic) IBOutlet UIButton *frontBtn;

@property (weak, nonatomic) IBOutlet UIButton *behindBtn;

@end

@implementation VerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"实名认证";
    
}

-(void)viewDidLayoutSubviews
{
    self.name = [[ZJInputView alloc] initWithFrame:self.nameBack.bounds];
    self.name.title = @"真实姓名";
    self.name.field.placeholder = @"请输入真实姓名";
    [self.nameBack addSubview:self.name];
    
    self.idcard = [[ZJInputView alloc] initWithFrame:self.idcardBack.bounds];
    self.idcard.title = @"身份证号";
    self.idcard.field.placeholder = @"请输入身份证号";
    [self.idcardBack addSubview:self.idcard];
}

- (IBAction)frontBtnClicked:(id)sender {
    
}

- (IBAction)behindBtnClicked:(id)sender {
    
}

- (IBAction)submitBtnClicked:(id)sender {
    
}


@end
