//
//  SRSectionHeader.h
//  QQSectionCopy
//
//  Created by Siren on 16/1/30.
//  Copyright © 2016年 Siren. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kHeaderHeight 44

@class SRSectionHeader;

@protocol SRSectionHeaderDelegate <NSObject>

-(void)sr_SectionHeader:(SRSectionHeader *)header didSelectedSection:(NSInteger)section;

@end

@interface SRSectionHeader : UITableViewHeaderFooterView

@property (nonatomic, weak) id<SRSectionHeaderDelegate> delegate;
//标题栏按钮
@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, strong) UIImageView *arrow;

@property (nonatomic, strong) UILabel *titleLab;

//标题栏分组
@property (nonatomic, assign) NSInteger section;
//是否展开
@property (nonatomic, assign) BOOL isOpen;

@end
