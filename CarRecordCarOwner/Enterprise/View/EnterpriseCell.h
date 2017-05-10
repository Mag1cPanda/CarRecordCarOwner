//
//  EnterpriseCell.h
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/20.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWStarRateView.h"

@interface EnterpriseCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *business;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet CWStarRateView *starRating;
@property (weak, nonatomic) IBOutlet UILabel *numRating;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *brand;

@end
