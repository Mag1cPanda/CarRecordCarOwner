//
//  QYDetailHeader.h
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/15.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWStarRateView.h"

@interface QYDetailHeader : UIView
@property (weak, nonatomic) IBOutlet UIImageView *qyImage;

@property (weak, nonatomic) IBOutlet CWStarRateView *starRating;

@property (weak, nonatomic) IBOutlet UILabel *leftLab;

@property (weak, nonatomic) IBOutlet UILabel *rightLab;

@property (weak, nonatomic) IBOutlet UILabel *addressLab;

@property (weak, nonatomic) IBOutlet UILabel *phoneLab;

@end
