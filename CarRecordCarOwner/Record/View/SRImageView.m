//
//  SRImageView.m
//  CZT_IOS_Longrise
//
//  Created by Mag1cPanda on 16/5/11.
//  Copyright © 2016年 程三. All rights reserved.
//

#import "SRImageView.h"

@implementation SRImageView

-(instancetype)initWithFrame:(CGRect)frame andBlock:(TapedBlock)block{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageNamed:@"icon_addpic"];
        self.imageStr = nil;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewTaped:)];
        [self addGestureRecognizer:tap];
        
        _block = block;
    
    }
    return self;
}



-(void)setBlock:(TapedBlock)block{
    _block = block;
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.userInteractionEnabled = YES;
    self.image = [UIImage imageNamed:@"icon_addpic"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewTaped:)];
    [self addGestureRecognizer:tap];
}

-(void)imageViewTaped:(SRImageView *)imageView{
    if (_block) {
        _block(self);
    }
}





@end
