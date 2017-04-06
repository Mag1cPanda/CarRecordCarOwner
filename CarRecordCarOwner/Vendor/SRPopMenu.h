//
//  SRPopMenu.h
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/18.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TrianglePosition) {
    SRPopMenuTrianglePositionCenter = 0,
    SRPopMenuTrianglePositionLeft   = 1,
    SRPopMenuTrianglePositionRight  = 2,
};

@interface SRPopMenu : UIView
<UITableViewDelegate,
UITableViewDataSource,
UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *tableData;
@property (nonatomic, assign) CGPoint trianglePoint;
@property (nonatomic, copy) void(^action)(NSInteger index);


@property (nonatomic, copy) void (^hideHandle)();

/**
 *  实例化方法
 *
 *  @param array  items，包含字典，字典里面包含标题（title）、图片名（imageName）
 *  @param width  宽度
 *  @param point  三角的顶角坐标（基于window）
 *  @param action 点击回调
 */
- (instancetype)initWithItems:(NSArray <NSDictionary *>*)array
                        width:(CGFloat)width
             triangleLocation:(CGPoint)point
                       action:(void(^)(NSInteger index))action;

/**
 *  类方法展示
 *
 *  @param array  items，包含字典，字典里面包含标题（title）、图片名（imageName）
 *  @param width  宽度
 *  @param point  三角的顶角坐标（基于window）
 *  @param action 点击回调
 */
+ (void)showWithItems:(NSArray <NSDictionary *>*)array
                width:(CGFloat)width
     triangleLocation:(CGPoint)point
               action:(void(^)(NSInteger index))action;

- (void)show;
- (void)hide;

@end
