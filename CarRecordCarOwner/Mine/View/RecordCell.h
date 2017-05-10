//
//  RecordCell.h
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/22.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *blueLine;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *tips;

@end
