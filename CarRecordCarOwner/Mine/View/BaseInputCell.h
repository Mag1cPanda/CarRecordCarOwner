//
//  BaseInputCell.h
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/4/5.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseInputCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UITextField *field;
@property (weak, nonatomic) IBOutlet UIView *bottemLine;

@end
