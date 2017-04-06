//
//  HomeSectionZero.h
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/18.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRButton.h"
@class HomeSectionZero;
@protocol HomeSectionZeroDelegate <NSObject>

@optional;
-(void)cell:(HomeSectionZero *)cell selectItemAtIndex:(NSInteger)index;

@end

@interface HomeSectionZero : UITableViewCell

@property (nonatomic, assign) id<HomeSectionZeroDelegate> delegate;

@property (nonatomic, assign) BOOL isAdded;

@property (nonatomic, strong) UIButton *addBtn;

@property (nonatomic, strong) UIButton *carNoBtn;

@property (nonatomic, strong) UIImageView *carIcon;

@property (nonatomic, strong) UILabel *carNo;

@property (nonatomic, strong) UIButton *waitintEva;

@property (nonatomic, strong) UIButton *checkRecord;

/**********/

@property (nonatomic, strong) CRButton *recordBtn;

@property (nonatomic, strong) CRButton *evaluateBtn;

@property (nonatomic, strong) CRButton *enterpriseBtn;

@property (nonatomic, strong) CRButton *illegalBtn;

@property (nonatomic, strong) CRButton *usedCarBtn;

@property (nonatomic, strong) CRButton *stationBtn;

@property (nonatomic, strong) CRButton *moreBtn;


@end
