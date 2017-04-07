//
//  SRSectionHeader.m
//  QQSectionCopy
//
//  Created by Siren on 16/1/30.
//  Copyright © 2016年 Siren. All rights reserved.
//

#import "SRSectionHeader.h"
#define kScreenW [UIScreen mainScreen].bounds.size.width

@implementation SRSectionHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
  
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.frame = CGRectMake(0, 0, kScreenW, kHeaderHeight);
        
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = self.bounds;

        CGFloat centerY = _btn.frame.size.height/2;
        
        _arrow = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenW-34, centerY-3.5, 14, 7)];
        _arrow.image = [UIImage imageNamed:@"uparrow"];
        [_btn addSubview:_arrow];
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(15, centerY-10, 200, 20)];
        _titleLab.font = [UIFont systemFontOfSize:14];
        _titleLab.textColor = [UIColor darkGrayColor];
        [_btn addSubview:_titleLab];
        
        UIView *bottemLine = [[UIView alloc] initWithFrame:CGRectMake(0, 43, kScreenW, 0.5)];
        bottemLine.backgroundColor = [UIColor lightGrayColor];
        [_btn addSubview:bottemLine];
        
        [_btn addTarget:self action:@selector(clickButton) forControlEvents:1 <<  6];
    
        [self.contentView addSubview:_btn];
    }
    return self;
}

- (void)clickButton{
    
    //执行代理方法
    if ([_delegate respondsToSelector:@selector(sr_SectionHeader:didSelectedSection:)]) {
    
        [_delegate sr_SectionHeader:self didSelectedSection:self.section];
        
    }

}

#pragma mark - isOpen的setter方法
- (void)setIsOpen:(BOOL)isOpen{
    _isOpen = isOpen;
    CGFloat angle = isOpen ? M_PI : 0;
    
    [UIView animateWithDuration:0.5f animations:^{
       
        [_arrow setTransform:CGAffineTransformMakeRotation(angle)];
        
    }];

}

@end
