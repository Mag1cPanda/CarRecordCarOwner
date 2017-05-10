//
//  RepairEvaCellPhoto.m
//  CZT_IOS_Longrise
//
//  Created by Mag1cPanda on 16/5/26.
//  Copyright © 2016年 程三. All rights reserved.
//

#import "RepairEvaCellPhoto.h"

#define padding 10
#define pictureHW (ScreenWidth - 4*padding)/3
#define MaxImageCount 5

@implementation RepairEvaCellPhoto


-(void)updateImageLayoutWithArray:(NSArray *)array {
    for (NSInteger i = 0; i < array.count; i++) {
        UIImageView *pictureImageView = [[UIImageView alloc]initWithFrame:CGRectMake(padding + (i%3)*(pictureHW+padding), 30 + padding +(i/3)*(pictureHW+padding), pictureHW, pictureHW)];
        
        pictureImageView.tag = i;
        pictureImageView.userInteractionEnabled = YES;
        pictureImageView.image = array[i];
        [self.contentView addSubview:pictureImageView];
        
        //用作放大图片
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageView:)];
        [pictureImageView addGestureRecognizer:tap];
        
        
        _addBtn.frame = CGRectMake(padding + (array.count%3)*(pictureHW+padding), 30 + padding +(array.count/3)*(pictureHW+padding), pictureHW, pictureHW);
        
        NSString *str = [NSString stringWithFormat:@"您还能上传%zi张",5-array.count];
        [_addBtn setTitle:str forState:0];
        [_addBtn setTitleColor:[UIColor darkGrayColor] forState:0];
        _addBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        
        if (array.count >= 5) {
            _addBtn.hidden = YES;
        }
    }
}

#pragma mark - gesture method
-(void)tapImageView:(UITapGestureRecognizer *)tap
{
    UIImageView *imageV = (UIImageView *)tap.view;
    if (_block) {
        _block(imageV);
    }
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _addBtn = [[AddImgButton alloc] initWithFrame:CGRectMake(10, 30, pictureHW, pictureHW) ];
        [self.contentView addSubview:_addBtn];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
