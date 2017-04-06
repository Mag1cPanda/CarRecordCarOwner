//
//  LRNavButton.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/31.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "LRNavButton.h"

@implementation LRNavButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = LRFont(14);
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor whiteColor] forState:0];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(self.width-18, self.height/2-3.5, 12, 7);
    self.titleLabel.frame = CGRectMake(0, 0, self.width-23, self.height);
}

@end
