//
//  ChartCell.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/4/5.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "ChartCell.h"

@implementation ChartCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews
{
    CGFloat labWidth = ScreenWidth/3;
    self.typeLab.frame = CGRectMake(0, 0, labWidth, self.height);
    self.percentLab.frame = CGRectMake(labWidth, 0, labWidth, self.height);
    self.costLab.frame = CGRectMake(labWidth*2, 0, labWidth, self.height);
}

@end
