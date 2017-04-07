//
//  SRImageView.h
//  CZT_IOS_Longrise
//
//  Created by Mag1cPanda on 16/5/11.
//  Copyright © 2016年 程三. All rights reserved.
//

#import <UIKit/UIKit.h>

//带用户交互的imgeView 点击事件用block方式实现
//有2种响应事件 图片为默认图片时响应一种点击事件
//图片改变后响应另外一种点击事件


@class SRImageView;
typedef void (^TapedBlock)(SRImageView *imageView);

@interface SRImageView : UIImageView

@property (nonatomic, copy) TapedBlock block;

@property (nonatomic, copy) NSString *imageStr;

@property (nonatomic, assign) BOOL isTap;

-(instancetype)initWithFrame:(CGRect)frame andBlock:(TapedBlock)block;

@end
