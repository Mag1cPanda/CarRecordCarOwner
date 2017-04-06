//
//  LRCitySelectController.h
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/17.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "BaseViewController.h"
@class LRCitySelectController;

@protocol LRCitySelectDelegate <NSObject>

@optional;
-(void)cityListController:(LRCitySelectController *)listController
            didSelectCity:(NSDictionary *)cityData;

-(void)cancelButtonPressed:(LRCitySelectController *)listController;

@end

@interface LRCitySelectController : BaseViewController

/*
 0
 
 cityData数据
 *@city_key 城市编号
 *@city_name 城市名字
 *@initials 城市
 *@pinyin 城市拼音
 *@short_name 城市短名
 */
@property(nonatomic,assign)id<LRCitySelectDelegate> delegate;

@property(nonatomic,strong)NSMutableArray *hotCityArr;//热门城市数组


@end
