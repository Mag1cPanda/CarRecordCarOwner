//
//  RepairEvaCellStar.m
//  CZT_IOS_Longrise
//
//  Created by Mag1cPanda on 16/5/26.
//  Copyright © 2016年 程三. All rights reserved.
//

#import "RepairEvaCellStar.h"

@implementation RepairEvaCellStar

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.starView1.scorePercent = 0;
    self.starView2.scorePercent = 0;
    self.starView3.scorePercent = 0;
    self.starView4.scorePercent = 0;
    self.starView5.scorePercent = 0;
    
    self.starView1.allowIncompleteStar = NO;
    self.starView2.allowIncompleteStar = NO;
    self.starView3.allowIncompleteStar = NO;
    self.starView4.allowIncompleteStar = NO;
    self.starView5.allowIncompleteStar = NO;
    
    self.starView1.tag = 101;
    self.starView2.tag = 102;
    self.starView3.tag = 103;
    self.starView4.tag = 104;
    self.starView5.tag = 105;
    
    self.evaTextView.delegate = self;
}

-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        self.placeholder.hidden = NO;
    }else{
        self.placeholder.hidden = YES;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
