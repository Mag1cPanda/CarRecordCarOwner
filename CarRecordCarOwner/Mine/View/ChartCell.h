//
//  ChartCell.h
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/4/5.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChartCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *typeLab;

@property (weak, nonatomic) IBOutlet UILabel *percentLab;

@property (weak, nonatomic) IBOutlet UILabel *costLab;

@end
