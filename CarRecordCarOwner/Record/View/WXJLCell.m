//
//  WXJLCell.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/4/6.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "WXJLCell.h"

@implementation WXJLCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.comBtn.layer.borderWidth = 1.0;
    self.comBtn.layer.borderColor = RGB(22, 122, 187).CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
