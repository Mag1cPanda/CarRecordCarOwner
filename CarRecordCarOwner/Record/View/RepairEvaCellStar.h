//
//  RepairEvaCellStar.h
//  CZT_IOS_Longrise
//
//  Created by Mag1cPanda on 16/5/26.
//  Copyright © 2016年 程三. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRSelectGroup.h"
#import "CWStarRateView.h"

@interface RepairEvaCellStar : UITableViewCell
<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet SRSelectGroup *selectGroup;

@property (weak, nonatomic) IBOutlet CWStarRateView *starView1;
@property (weak, nonatomic) IBOutlet CWStarRateView *starView2;
@property (weak, nonatomic) IBOutlet CWStarRateView *starView3;
@property (weak, nonatomic) IBOutlet CWStarRateView *starView4;
@property (weak, nonatomic) IBOutlet CWStarRateView *starView5;

@property (weak, nonatomic) IBOutlet UILabel *placeholder;

@property (weak, nonatomic) IBOutlet UITextView *evaTextView;
@end
