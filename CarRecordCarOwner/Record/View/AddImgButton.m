//
//  AddImgButton.m
//  SRImagePicker
//
//  Created by Mag1cPanda on 16/5/26.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "AddImgButton.h"

@implementation AddImgButton

-(instancetype)init {
    return  [self initWithFrame:CGRectZero];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    [self setImage:[UIImage imageNamed:@"addimg"] forState:0];
    [self setTitleColor:[UIColor darkGrayColor] forState:0];
    [self setTitle:@"您还能上传5张" forState:0];
    self.titleLabel.font = [UIFont systemFontOfSize:13];
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake((self.frame.size.width - (self.frame.size.height-40))/2, 10, self.frame.size.height-40, self.frame.size.height-40);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    return  CGRectMake(10, self.frame.size.height-30, self.frame.size.width-20, 20);
}

@end
