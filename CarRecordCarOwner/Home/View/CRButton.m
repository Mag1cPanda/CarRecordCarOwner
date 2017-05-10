//
//  CRButton.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/18.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "CRButton.h"

@implementation CRButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor redColor];
//        self.imageView.backgroundColor = [UIColor blueColor];
//        self.titleLabel.backgroundColor = [UIColor greenColor];
        
        self.titleLabel.font = LRFont(13);
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor darkGrayColor] forState:0];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(10, 0, 50, 50);
    self.titleLabel.frame = CGRectMake(0, 60, 70, 20);
}

//- (void)verticalImageAndTitle:(CGFloat)spacing
//{
//    self.titleLabel.backgroundColor = [UIColor greenColor];
//    CGSize imageSize = self.imageView.frame.size;
//    CGSize titleSize = self.titleLabel.frame.size;
//    CGSize textSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
//    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
//    if (titleSize.width + 0.5 < frameSize.width) {
//        titleSize.width = frameSize.width;
//    }
//    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
//    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
//    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
//    
//}

@end
