//
//  HomeSectionOne.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/17.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "HomeSectionOne.h"

@implementation HomeSectionOne

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.newsView.textLabel.font = LRFont(14);
    self.newsView.textLabel.textColor = [UIColor darkGrayColor];
    self.newsView.textLabel.textAlignment = NSTextAlignmentLeft;
    [self.newsView animationWithTexts:@[@"这是第1条",@"这是第2条",@"这是第3条"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
