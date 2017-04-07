//
//  EvaluateViewController.m
//  CZT_IOS_Longrise
//
//  Created by Mag1cPanda on 16/5/11.
//  Copyright © 2016年 程三. All rights reserved.
//

#import "EvaluateViewController.h"
#import "SRImageView.h"
#import "RepairEvaCellStar.h"
#import "RepairEvaCellPhoto.h"
#import "TZImagePickerController.h"
#import "CWStarRateView.h"
#import "Util.h"

#define padding 10
#define pictureHW (ScreenWidth - 4*padding)/3
#define FORMATSTR(floatValue) [NSString stringWithFormat:@"%f",floatValue]

@interface EvaluateViewController ()
<UITextViewDelegate,
CWStarRateViewDelegate,
UIActionSheetDelegate,
UITableViewDataSource,
UITableViewDelegate,
UIActionSheetDelegate,
TZImagePickerControllerDelegate>
{
    UITableView *table;;
    CWStarRateView *starView;
    UILabel *nameLab;
    
    NSMutableArray *selectedAssets;
    
    TZImagePickerController *beforePicker;
    TZImagePickerController *afterPicker;
    NSMutableArray *beforePhotos;
    NSMutableArray *afterPhotos;
    
    NSArray *leftImg;
    NSArray *btnImg;
    
    UIActionSheet *callSheet;
    
    BOOL _isSelectOriginalPhoto;
    NSString *isAnonymous;//是否匿名
    
    NSMutableDictionary *imgDic;
    SRSelectGroup *selectGroup;
    UITextView *evaTextView;
    NSArray *rightContent;
    
    NSString *evaTotal;
    
    NSString *starScore1;
    NSString *starScore2;
    NSString *starScore3;
    NSString *starScore4;
    NSString *starScore5;
    NSString *evaDetail;
    
    NSString *beforeImg1Str;
    NSString *beforeImg2Str;
    NSString *beforeImg3Str;
    NSString *beforeImg4Str;
    NSString *beforeImg5Str;
    
    NSString *afterImg1Str;
    NSString *afterImg2Str;
    NSString *afterImg3Str;
    NSString *afterImg4Str;
    NSString *afterImg5Str;
}
@end

@implementation EvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"评价";
    imgDic = [NSMutableDictionary dictionary];
    selectedAssets = [NSMutableArray array];
    beforePhotos = [NSMutableArray array];
    afterPhotos = [NSMutableArray array];
    leftImg = @[@"dot",@"tel"];
    btnImg = @[@"arr",@"phone"];
    
    isAnonymous = @"false";
    beforeImg1Str = @"";
    beforeImg2Str = @"";
    beforeImg3Str = @"";
    beforeImg4Str = @"";
    beforeImg5Str = @"";

    afterImg1Str = @"";
    afterImg2Str = @"";
    afterImg3Str = @"";
    afterImg4Str = @"";
    afterImg5Str = @"";
    
    
    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    table.backgroundColor = [UIColor whiteColor];
    table.delegate = self;
    table.dataSource = self;
    table.allowsSelection = NO;
    [self.view addSubview:table];
    
    //添加头部视图
    UIImageView *backImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    backImg.image = [UIImage imageNamed:@"top-bg-max"];
    
    nameLab = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, ScreenWidth-60, 30)];
    nameLab.textColor = [UIColor whiteColor];
    nameLab.text = @"涂乐汽车养护美容服务专家";
    [backImg addSubview:nameLab];
    
    starView = [[CWStarRateView alloc] initWithFrame:CGRectMake(30, 60, 120, 20)];
    [backImg addSubview:starView];
    table.tableHeaderView = backImg;
    
    //添加底部视图
//    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    
//    UILabel *evaLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(selectBtn.frame)+10, 10, 100, 20)];
//    evaLab.text = @"匿名评价";
//    evaLab.textColor = [UIColor darkGrayColor];
//    evaLab.font = [UIFont systemFontOfSize:13];
//    [footer addSubview:evaLab];
    
//    UIButton *submitBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(evaLab.frame)+10, ScreenWidth-20, 50)];
//    [submitBtn setTitle:@"提交" forState:0];
//    [submitBtn setTitleColor:[UIColor whiteColor] forState:0];
//    [submitBtn setBackgroundImage:[UIImage imageNamed:@"btn-blue-gradient"] forState:0];
//    [submitBtn addTarget:self action:@selector(submitEvaluate:) forControlEvents:1<<6];
//    [footer addSubview:submitBtn];
    
//    table.tableFooterView = footer;
    
    [table registerNib:[UINib nibWithNibName:@"AddressOrPhoneCell" bundle:nil] forCellReuseIdentifier:@"AddressOrPhoneCell"];
    
    [table registerNib:[UINib nibWithNibName:@"RepairRecordCell" bundle:nil] forCellReuseIdentifier:@"RepairRecordCell"];
    
    [table registerNib:[UINib nibWithNibName:@"RepairEvaCellStar" bundle:nil] forCellReuseIdentifier:@"RepairEvaCellStar"];
    
    for (int i=0; i<2; i++) {
        NSString *str = [NSString stringWithFormat:@"RepairEvaCellPhoto%d",i];
        [table registerNib:[UINib nibWithNibName:@"RepairEvaCellPhoto" bundle:nil] forCellReuseIdentifier:str];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - table Delegate & DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else{
        return 2;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        RepairEvaCellStar *cell = [tableView dequeueReusableCellWithIdentifier:@"RepairEvaCellStar"];
        selectGroup = cell.selectGroup;
        evaTextView = cell.evaTextView;
        cell.starView1.delegate = self;
        cell.starView2.delegate = self;
        cell.starView3.delegate = self;
        cell.starView4.delegate = self;
        cell.starView5.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    else{
        NSString *str = [NSString stringWithFormat:@"RepairEvaCellPhoto%zi",indexPath.row];
        RepairEvaCellPhoto *cell = [tableView dequeueReusableCellWithIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0) {
            cell.titleLab.text = @"维修前照片";
            cell.addBtn.tag = 0;
            [cell.addBtn addTarget:self action:@selector(beforeBtnClicked) forControlEvents:1<<6];
            [cell updateImageLayoutWithArray:beforePhotos];
            
            cell.block = ^(UIImageView *imageV) {
                
                beforePicker = [[TZImagePickerController alloc] initWithSelectedAssets:selectedAssets selectedPhotos:beforePhotos index:imageV.tag];
                beforePicker.allowPickingOriginalPhoto = NO;
                beforePicker.isSelectOriginalPhoto = NO;
                [self presentViewController:beforePicker animated:YES completion:nil];
                
            };
        }
        
        else{
            cell.titleLab.text = @"维修后照片";
            cell.addBtn.tag = 1;
            [cell.addBtn addTarget:self action:@selector(afterBtnClicked) forControlEvents:1<<6];
            [cell updateImageLayoutWithArray:afterPhotos];
            
            cell.block = ^(UIImageView *imageV) {
                
                afterPicker = [[TZImagePickerController alloc] initWithSelectedAssets:selectedAssets selectedPhotos:afterPhotos index:imageV.tag];
                afterPicker.allowPickingOriginalPhoto = NO;
                afterPicker.isSelectOriginalPhoto = NO;
                [self presentViewController:afterPicker animated:YES completion:nil];
                
            };
        }
        return cell;
    }
}

-(void)showPickekControllerWithSelectedPhotos:(NSMutableArray *)array Index:(NSInteger)index{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:selectedAssets selectedPhotos:array index:index];
    
    imagePickerVc.isSelectOriginalPhoto = NO;
    
    __block TZImagePickerController *weakVc = imagePickerVc;
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        beforePhotos = [NSMutableArray arrayWithArray:photos];
        selectedAssets = [NSMutableArray arrayWithArray:assets];
        _isSelectOriginalPhoto = isSelectOriginalPhoto;
    }];
    
    [self presentViewController:weakVc animated:YES completion:nil];
}


-(void)beforeBtnClicked{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"请选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照或从相册选择", nil];
    sheet.tag = 0;
    [sheet showInView:self.view];
}

-(void)afterBtnClicked{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"请选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照或从相册选择", nil];
    sheet.tag = 1;
    [sheet showInView:self.view];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 350;
    }
    else {
        if (indexPath.row == 0) {
            return 60 + pictureHW * ((beforePhotos.count/3)+1);
        }
        else{
            return 60 + pictureHW * ((afterPhotos.count/3)+1);
        }
    }
}


#pragma mark - actionSheet Delegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0)
    {
        if (actionSheet.tag == 0) {
            [self selectBeforeImage];
        }
        else{
            [self selectAfterImage];
        }
    }
    else
    {
        //取消
    }
    
}

#pragma mark - starViewDelegate
- (void)starRateView:(CWStarRateView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent{
    
    NSLog(@"newScorePercent -> %f",newScorePercent);
    
    starRateView.scorePercent = newScorePercent;
    
    switch (starRateView.tag) {
            case 101:
            starScore1 = FORMATSTR(starRateView.scorePercent * 5);
            break;
            case 102:
            starScore2 = FORMATSTR(starRateView.scorePercent * 5);
            break;
            case 103:
            starScore3 = FORMATSTR(starRateView.scorePercent * 5);
            break;
            case 104:
            starScore4 = FORMATSTR(starRateView.scorePercent * 5);
            break;
            case 105:
            starScore5 = FORMATSTR(starRateView.scorePercent * 5);
            break;
            
        default:
            break;
    }
    
}

#pragma mark - 从相册选择或拍照
-(void)selectBeforeImage {
    beforePicker = [[TZImagePickerController alloc] initWithMaxImagesCount:5-beforePhotos.count delegate:self];
    beforePicker.isSelectOriginalPhoto = NO;
  
    beforePicker.allowPickingVideo = NO;
    beforePicker.allowPickingOriginalPhoto = NO;
    
    beforePicker.photoWidth = 400;
    beforePicker.photoPreviewMaxWidth = 270;
    
    [self presentViewController:beforePicker animated:YES completion:nil];
}

-(void)selectAfterImage{
    afterPicker = [[TZImagePickerController alloc] initWithMaxImagesCount:5-afterPhotos.count delegate:self];
    afterPicker.isSelectOriginalPhoto = NO;
   
    afterPicker.allowPickingVideo = NO;
    afterPicker.allowPickingOriginalPhoto = NO;
    
    afterPicker.photoWidth = 400;
    afterPicker.photoPreviewMaxWidth = 270;
    
    [self presentViewController:afterPicker animated:YES completion:nil];
}

#pragma mark TZImagePickerControllerDelegate
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
    
    [selectedAssets addObjectsFromArray:assets];
    
    NSIndexPath *indexPath;
    if (picker == beforePicker) {
        [beforePhotos addObjectsFromArray:photos];
        indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    }
    
    else{
        [afterPhotos addObjectsFromArray:photos];
        indexPath = [NSIndexPath indexPathForRow:1 inSection:1];
    }
    
    [table reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    NSLog(@"取消");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 上传之前格式化图片
-(void)formatBeforeImages {
    if (beforePhotos.count > 0) {
        beforeImg1Str = [Util imageToString:beforePhotos[0]];
    }
    if (beforePhotos.count > 1) {
        beforeImg2Str = [Util imageToString:beforePhotos[1]];
    }
    if (beforePhotos.count > 2) {
        beforeImg3Str = [Util imageToString:beforePhotos[2]];
    }
    if (beforePhotos.count > 3) {
        beforeImg4Str = [Util imageToString:beforePhotos[3]];
    }
    if (beforePhotos.count > 4) {
        beforeImg5Str = [Util imageToString:beforePhotos[4]];
    }
}


-(void)formatAfterImages {
    if (afterPhotos.count > 0) {
        afterImg1Str = [Util imageToString:afterPhotos[0]];
    }
    if (afterPhotos.count > 1) {
        afterImg2Str = [Util imageToString:afterPhotos[1]];
    }
    if (afterPhotos.count > 2) {
        afterImg3Str = [Util imageToString:afterPhotos[2]];
    }
    if (afterPhotos.count > 3) {
        afterImg4Str = [Util imageToString:afterPhotos[3]];
    }
    if (afterPhotos.count > 4) {
        afterImg5Str = [Util imageToString:afterPhotos[4]];
    }
}

#pragma mark - 提交评价
- (void)submitEvaluate:(id)sender {
    
}

-(void)popToUpperViewController{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
