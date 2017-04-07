//
//  EvaluateViewController.h
//  CZT_IOS_Longrise
//
//  Created by Mag1cPanda on 16/5/11.
//  Copyright © 2016年 程三. All rights reserved.
//

#import "BaseViewController.h"
#import "SRSelectGroup.h"

typedef void (^RefreshDataBlock)(BOOL);

@interface EvaluateViewController : BaseViewController

@property (nonatomic, strong) SRSelectGroup *group;
@property (nonatomic, copy) RefreshDataBlock refreshDataBlock;


@end
