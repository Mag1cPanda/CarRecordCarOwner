//
//  HomeSectionZero.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/18.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "HomeSectionZero.h"

@implementation HomeSectionZero

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBtn.frame = CGRectMake(10, 10, ScreenWidth-20, 60);
        _addBtn.backgroundColor = [UIColor greenColor];
        [_addBtn setBackgroundImage:[UIImage imageNamed:@""] forState:0];
        [self addSubview:_addBtn];
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 40)];
        icon.image = [UIImage imageNamed:@""];
        [_addBtn addSubview:icon];
        
        UILabel *topLab = [[UILabel alloc] initWithFrame:CGRectMake(icon.maxX+10, 10, 100, 20)];
        topLab.font = LRFont(14);
        topLab.textColor = [UIColor whiteColor];
        topLab.text = @"添加车辆";
        [_addBtn addSubview:topLab];
        
        
        UILabel *bottemLab = [[UILabel alloc] initWithFrame:CGRectMake(icon.maxX+10, 30, 220, 20)];
        bottemLab.font = LRFont(11);
        bottemLab.textColor = [UIColor whiteColor];
        bottemLab.text = @"添加车辆保养信息后，可以实时查询维修保养记录";
        [_addBtn addSubview:bottemLab];
        
        /*added car*/
        _carNoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _carNoBtn.frame = CGRectMake(15, 15, 130, 40);
        _carNoBtn.hidden = YES;
        [self.contentView addSubview:_carNoBtn];
        
        _carNo = [[UILabel alloc] initWithFrame:CGRectMake(30, 10, 100, 20)];
        _carNo.backgroundColor = RGB(23, 122, 186);
        _carNo.textColor = [UIColor whiteColor];
        _carNo.font = LRFont(13);
        _carNo.textAlignment = NSTextAlignmentCenter;
        _carNo.layer.cornerRadius = 10;
        _carNo.clipsToBounds = YES;
        _carNo.text = @"浙APK888";
        [_carNoBtn addSubview:_carNo];
        
        _carIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _carIcon.image = [UIImage imageNamed:@"caricon"];
        _carIcon.layer.cornerRadius = 20;
        _carIcon.clipsToBounds = YES;
        [_carNoBtn addSubview:_carIcon];
        
        _waitintEva = [UIButton buttonWithType:UIButtonTypeCustom];
        _waitintEva.frame = CGRectMake(_carNoBtn.maxX+20, 25, 60, 20);
        _waitintEva.titleLabel.font = LRFont(13);
        [_waitintEva setTitle:@"待评价 2 " forState:0];
        [_waitintEva setTitleColor:[UIColor darkGrayColor] forState:0];
        _waitintEva.hidden = YES;
        [self.contentView addSubview:_waitintEva];
        
        _checkRecord = [UIButton buttonWithType:UIButtonTypeCustom];
        _checkRecord.frame = CGRectMake(_waitintEva.maxX+20, 25, 50, 20);
        _checkRecord.titleLabel.font = LRFont(13);
        _checkRecord.backgroundColor = RGB(23, 122, 186);
        _checkRecord.layer.cornerRadius = 10;
        [_checkRecord setTitleColor:[UIColor whiteColor] forState:0];
        [_checkRecord setTitle:@"查档案" forState:0];
        _checkRecord.hidden = YES;
        [self.contentView addSubview:_checkRecord];
        
        /*--------scroll----------*/
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 80, ScreenWidth, 80)];
        scroll.contentSize = CGSizeMake(ScreenWidth * 2, 80);
        scroll.pagingEnabled = YES;
        scroll.showsHorizontalScrollIndicator = false;
        [self.contentView addSubview:scroll];
        
        CGFloat btnHeight = 80;
        CGFloat btnWidth = 70;
        CGFloat btnY = 0;
        CGFloat margin = (ScreenWidth-20-(btnWidth*4))/3;
        
        _recordBtn = [[CRButton alloc] initWithFrame:CGRectMake(10, btnY, btnWidth, btnHeight)];
        [_recordBtn setTitle:@"档案查询" forState:0];
        [_recordBtn setImage:[UIImage imageNamed:@"dacx"] forState:0];
        [_recordBtn addTarget:self action:@selector(recordBtnClicked:) forControlEvents:1<<6];
        [scroll addSubview:_recordBtn];
        
        _evaluateBtn = [[CRButton alloc] initWithFrame:CGRectMake(_recordBtn.maxX+margin, btnY, btnWidth, btnHeight)];
        [_evaluateBtn setTitle:@"服务评价" forState:0];
        [_evaluateBtn setImage:[UIImage imageNamed:@"fwpj"] forState:0];
        [_evaluateBtn addTarget:self action:@selector(evaluateBtnClicked:) forControlEvents:1<<6];
        [scroll addSubview:_evaluateBtn];
        
        _enterpriseBtn = [[CRButton alloc] initWithFrame:CGRectMake(_evaluateBtn.maxX+margin, btnY, btnWidth, btnHeight)];
        [_enterpriseBtn setTitle:@"企业查询" forState:0];
        [_enterpriseBtn setImage:[UIImage imageNamed:@"qycx"] forState:0];
        [_enterpriseBtn addTarget:self action:@selector(enterpriseBtnClicked:) forControlEvents:1<<6];
        [scroll addSubview:_enterpriseBtn];
        
        _illegalBtn = [[CRButton alloc] initWithFrame:CGRectMake(_enterpriseBtn.maxX+margin, btnY, btnWidth, btnHeight)];
        [_illegalBtn setTitle:@"违章查询" forState:0];
        [_illegalBtn setImage:[UIImage imageNamed:@""] forState:0];
        [_illegalBtn addTarget:self action:@selector(illegalBtnClicked:) forControlEvents:1<<6];
        [scroll addSubview:_illegalBtn];
        
        _usedCarBtn = [[CRButton alloc] initWithFrame:CGRectMake(10+ScreenWidth, btnY, btnWidth, btnHeight)];
        [_usedCarBtn setTitle:@"二手车评估" forState:0];
        [_usedCarBtn setImage:[UIImage imageNamed:@"escpg"] forState:0];
        [_usedCarBtn addTarget:self action:@selector(usedCarBtnClicked:) forControlEvents:1<<6];
        [scroll addSubview:_usedCarBtn];
        
        _stationBtn = [[CRButton alloc] initWithFrame:CGRectMake(_usedCarBtn.maxX+margin, btnY, btnWidth, btnHeight)];
        [_stationBtn setTitle:@"附近加油站" forState:0];
        [_stationBtn setImage:[UIImage imageNamed:@"fjjyz"] forState:0];
        [_stationBtn addTarget:self action:@selector(stationBtnClicked:) forControlEvents:1<<6];
        [scroll addSubview:_stationBtn];
        
        _moreBtn = [[CRButton alloc] initWithFrame:CGRectMake(_stationBtn.maxX+margin, btnY, btnWidth, btnHeight)];
        [_moreBtn setTitle:@"更多" forState:0];
        [_moreBtn setImage:[UIImage imageNamed:@""] forState:0];
        [_moreBtn addTarget:self action:@selector(moreBtnClicked:) forControlEvents:1<<6];
        [scroll addSubview:_moreBtn];
        
        
    }
    return self;
}

-(void)setIsAdded:(BOOL)isAdded
{
    _isAdded = isAdded;
    _addBtn.hidden = YES;
    
    _carNoBtn.hidden = NO;
    _waitintEva.hidden = NO;
    _checkRecord.hidden = NO;
}

-(void)recordBtnClicked:(UIButton *)btn
{
    if (_delegate && [_delegate respondsToSelector:@selector(cell:selectItemAtIndex:)]) {
        [_delegate cell:self selectItemAtIndex:0];
    }
}

-(void)evaluateBtnClicked:(UIButton *)btn
{
    if (_delegate && [_delegate respondsToSelector:@selector(cell:selectItemAtIndex:)]) {
        [_delegate cell:self selectItemAtIndex:1];
    }
}

-(void)enterpriseBtnClicked:(UIButton *)btn
{
    if (_delegate && [_delegate respondsToSelector:@selector(cell:selectItemAtIndex:)]) {
        [_delegate cell:self selectItemAtIndex:2];
    }
}

-(void)illegalBtnClicked:(UIButton *)btn
{
    if (_delegate && [_delegate respondsToSelector:@selector(cell:selectItemAtIndex:)]) {
        [_delegate cell:self selectItemAtIndex:3];
    }
}

-(void)usedCarBtnClicked:(UIButton *)btn
{
    if (_delegate && [_delegate respondsToSelector:@selector(cell:selectItemAtIndex:)]) {
        [_delegate cell:self selectItemAtIndex:4];
    }
}

-(void)stationBtnClicked:(UIButton *)btn
{
    if (_delegate && [_delegate respondsToSelector:@selector(cell:selectItemAtIndex:)]) {
        [_delegate cell:self selectItemAtIndex:5];
    }
}

-(void)moreBtnClicked:(UIButton *)btn
{
    if (_delegate && [_delegate respondsToSelector:@selector(cell:selectItemAtIndex:)]) {
        [_delegate cell:self selectItemAtIndex:6];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
