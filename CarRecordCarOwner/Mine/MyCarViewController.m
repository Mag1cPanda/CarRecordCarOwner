//
//  MyCarViewController.m
//  CarRecordCarOwner
//
//  Created by Mag1cPanda on 2017/3/28.
//  Copyright © 2017年 Mag1cPanda. All rights reserved.
//

#import "MyCarViewController.h"
#import "LRNavButton.h"
#import "DXPopover.h"
#import "MyCarCollectionViewCell.h"
#import "AddWXJLViewController.h"
#import "AddJYJLViewController.h"

@interface MyCarViewController ()
<UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>
{
    UICollectionView *collection;
    LRNavButton *carnoBtn;
    NSArray *iconNameArr;
    NSArray *titleArr;
}
@end

static NSString *cellID = @"MyCarCollectionViewCell";

@implementation MyCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(239, 239, 239);
    iconNameArr = @[@"wxjl",
                    @"jiayou",
                    @"xc",
                    @"qita",
                    @"qita"];
    titleArr = @[@"维修记录",
                 @"加油",
                 @"洗车",
                 @"违章罚款",
                 @"其他"];
    
    carnoBtn = [[LRNavButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    carnoBtn.titleLabel.font = LRFont(15);
    [carnoBtn setImage:[UIImage imageNamed:@"ycxl"] forState:0];
    [carnoBtn setTitle:@"浙A9A9B9" forState:0];
    [carnoBtn addTarget:self action:@selector(carnoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = carnoBtn;
    
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64) collectionViewLayout:layout];
    
    collection.backgroundColor = [UIColor clearColor];
    collection.delegate = self;
    collection.dataSource = self;
    collection.bounces = NO;
    [self.view addSubview:collection];
    
    [collection registerNib:[UINib nibWithNibName:cellID bundle:nil] forCellWithReuseIdentifier:cellID];
}

-(void)carnoBtnClick:(UIButton *)btn
{
    CGPoint startPoint =
    CGPointMake(CGRectGetMidX(btn.frame), CGRectGetMaxY(btn.frame) + 20);
    NSArray *arr = @[@"浙APK888",@"浙APK888"];
    
    DXPopover *popover = [DXPopover popover];
    [popover sr_showAtPoint:startPoint tableWidth:100 titleArray:arr popoverPostion:DXPopoverPositionDown inView:self.navigationController.view];
    popover.block = ^(NSInteger index, NSString *content) {
        
        NSLog(@"%zi, %@",index,content);
        [btn setTitle:content forState:0];
        
    };
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5+1;
}

- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    MyCarCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.layer.borderColor = RGB(234, 234, 236).CGColor;
    cell.layer.borderWidth = 0.5;
    if (indexPath.item>4) {
        cell.icon.hidden = YES;
        cell.title.hidden = YES;
    }
    
    else {
        cell.icon.image = [UIImage imageNamed:iconNameArr[indexPath.item]];
        cell.title.text = titleArr[indexPath.item];
    }
    
    
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%zi",indexPath.item);
    if (indexPath.row == 0) {
        AddWXJLViewController *vc = [AddWXJLViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 1) {
        AddJYJLViewController *vc = [AddJYJLViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 2) {
        
        
    }
    
    if (indexPath.row == 3) {
        
        
    }
    
    if (indexPath.row == 4) {
        
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath*)indexPath
{
    CGFloat width = ScreenWidth / 2;
    return (CGSize){ width, width/2 };
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


@end
