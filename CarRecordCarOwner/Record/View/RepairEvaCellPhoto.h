//
//  RepairEvaCellPhoto.h
//  CZT_IOS_Longrise
//
//  Created by Mag1cPanda on 16/5/26.
//  Copyright © 2016年 程三. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddImgButton.h"

typedef void (^ImageViewTapedBlock)(UIImageView *imgV);

@interface RepairEvaCellPhoto : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (nonatomic, strong) AddImgButton *addBtn;

@property (nonatomic, copy) ImageViewTapedBlock block;

-(void)updateImageLayoutWithArray:(NSArray *)array;
@end
