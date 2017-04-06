//
//  EnterpriseCell.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/20.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "EnterpriseCell.h"

@implementation EnterpriseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.starRating.userInteractionEnabled = false;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
