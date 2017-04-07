//
//  WXJLCell.h
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/4/6.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXJLCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *storeName;
@property (weak, nonatomic) IBOutlet UILabel *typeLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;
@property (weak, nonatomic) IBOutlet UILabel *mileLab;

@property (weak, nonatomic) IBOutlet UIButton *evaBtn;
@property (weak, nonatomic) IBOutlet UIButton *comBtn;
@end
