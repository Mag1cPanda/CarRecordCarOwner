//
//  TotalCell.h
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/22.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRNavButton.h"
@interface TotalCell : UITableViewCell
@property (weak, nonatomic) IBOutlet LRNavButton *yearBtn;
@property (weak, nonatomic) IBOutlet UIButton *formsBtn;

@property (weak, nonatomic) IBOutlet UILabel *totalCount;
@property (weak, nonatomic) IBOutlet UILabel *totalCost;
@end
