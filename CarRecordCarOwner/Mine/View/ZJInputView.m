//
//  ZJInputView.m
//  ZhuJianBuApp
//
//  Created by Mag1cPanda on 2017/2/3.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "ZJInputView.h"
#import "Masonry.h"
#define ViewWidth self.frame.size.width
#define ViewHeight self.frame.size.height


@implementation ZJInputView

#pragma mark - Xib初始化
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - 代码初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.backgroundColor = [UIColor clearColor];
    
    _leftLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 9, 80, 40)];
    _leftLab.textColor = [UIColor darkGrayColor];
    _leftLab.font = LRFont(14);

    _field = [[UITextField alloc] initWithFrame:CGRectMake(90, 9, ViewWidth-90, 40)];
    _field.textAlignment = NSTextAlignmentRight;
    _field.font = LRFont(14);

    _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, ViewHeight-1, ViewWidth, 0.5)];
    _bottomLine.backgroundColor = [UIColor lightGrayColor];
    
    [self addSubview:self.field];
    [self addSubview:self.bottomLine];
    [self addSubview:self.leftLab];
}


#pragma mark - setter
-(void)setLineColor:(UIColor *)lineColor
{
    _bottomLine.backgroundColor = lineColor;
}

-(void)setText:(NSString *)text
{
    _field.text = text;
}

-(void)setPlaceholder:(NSString *)placeholder
{
    _field.placeholder = placeholder;
}

//-(void)setLeftImage:(UIImage *)leftImage
//{
//    _imageView.image = leftImage;
//}

-(void)setTitle:(NSString *)title
{
    _leftLab.text = title;
}

-(void)setTextColor:(UIColor *)textColor
{
    _field.textColor = textColor;
}

-(void)setTextAlignment:(NSTextAlignment)textAlignment
{
    _field.textAlignment = textAlignment;
}

#pragma mark - getter
-(NSString *)text
{
    return self.field.text;
}

@end
