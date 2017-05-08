//
//  FreshViewController.m
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "FreshViewController.h"
#import "FrashCell.h"
#import "MidFreshBtnCell.h"
#import "MidFreshCollectionCell.h"
#import "SDCycleScrollView.h"
#import "FrashGoodsController.h"
#import "searchViewController.h"
#import "BaseHomeModel.h"
#import "MarketModel.h"
#import "FreshModel.h"
#import "GoodsModel.h"
#import "WSTableViewController.h"
#import "FrashDetailViewController.h"


#define MidFreshBtnCellID @"MidFreshBtnCellID"
#define MidFreshCollectionCellID @"MidFreshCollectionCellID"
#define FrashCellID @"FrashCellID"


@interface FreshViewController ()<FrashCellDelegate>

/// 顶部轮播器
@property (nonatomic, strong) NSArray<BaseHomeModel *> *banner;
/// 按钮视图
@property (nonatomic, strong) NSArray<BaseHomeModel *> *btnView;
/// 滚动视图
@property (nonatomic, strong) NSArray<FreshModel *> *collectionView;
/// 底部其他视图
@property (nonatomic, strong) NSArray<GoodsModel *> *bottomViews;

@end
@implementation FreshViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadHomeDatas];
    
    [self setBanner];
    
}

- (void)setBanner
{
    //创建右侧查找按钮
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchBtn)];
    rightBtn.tintColor = [UIColor lightGrayColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
    self.navigationItem.title = @"新鲜预订";
    
    [self.tableView registerClass:[FrashCell class] forCellReuseIdentifier:FrashCellID];
    [self.tableView registerClass:[MidFreshBtnCell class] forCellReuseIdentifier:MidFreshBtnCellID];
    [self.tableView registerClass:[MidFreshCollectionCell class] forCellReuseIdentifier:MidFreshCollectionCellID];

    //MARK: 取消下个界面导航条返回的文字
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    [self setupBanner];
}

-(void)setupBanner
{
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200) delegate:nil placeholderImage:[UIImage imageNamed:@"11111"]];
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    
    cycleScrollView2.imageURLStringsGroup = [self setupBannerImgs];
    
    self.tableView.tableHeaderView = cycleScrollView2;
    
}

-(NSArray *)setupBannerImgs
{
    NSMutableArray *arrM = [NSMutableArray array];
    [self.banner enumerateObjectsUsingBlock:^(BaseHomeModel *obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
         [arrM addObject:obj.img];
     }];
    return arrM.copy;
}
#pragma mark - 代理方法
-(void)goToNextBtn:(FrashCell *)fcell andWithbut:(UIButton *)btn{
    
    FrashGoodsController *frashGoodsVC = [[FrashGoodsController alloc]init];
    frashGoodsVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:frashGoodsVC animated:YES];
    
}



#pragma mark - 点击事件
//MARK:查找
- (void)searchBtn {
    //    NSLog(@"进入查找界面");
    WSTableViewController *searchVC = [[WSTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    searchVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:searchVC animated:YES];
    
}
//MARK: 优惠券
- (void)youhuiquan {
    
    //    YouHuiQuanViewController *youhuiquan = [[YouHuiQuanViewController alloc] init];
    //    [self.navigationController pushViewController:youhuiquan animated:YES];
    FrashDetailViewController *frashDetailVC = [[FrashDetailViewController alloc]init];
    frashDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:frashDetailVC animated:YES];
}
//MARK:商品详情界面
- (void)goodsMessageGoTo {
    
    FrashDetailViewController *frashDetailVC = [[FrashDetailViewController alloc]init];
    frashDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:frashDetailVC animated:YES];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = self.btnView.count + self.collectionView.count + self.btnView.count;
    return rows;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowH;
    if (indexPath.row == 0)
    {
        rowH = 80;
    }
    else if (indexPath.row == 1 || indexPath.row == 2)
    {
        rowH = 200;
    }
    else
    {
        rowH = 500;
    }
    return rowH;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (indexPath.row == 0)
    {
        MidFreshBtnCell *cell1 = [tableView dequeueReusableCellWithIdentifier:MidFreshBtnCellID forIndexPath:indexPath];
        
        cell1.btnModel = self.btnView;
        cell = cell1;
        
    }
    else if (indexPath.row == 1)
    {
        MidFreshCollectionCell *cell2 = [tableView dequeueReusableCellWithIdentifier:MidFreshCollectionCellID forIndexPath:indexPath];
        cell2.model = self.collectionView[0];
        cell = cell2;
    }
    else if (indexPath.row == 2)
    {
        MidFreshCollectionCell *cell3 = [tableView dequeueReusableCellWithIdentifier:MidFreshCollectionCellID forIndexPath:indexPath];
        cell3.model = self.collectionView[1];
        cell = cell3;
    }
    else
    {
        FrashCell *cell3 = [tableView dequeueReusableCellWithIdentifier:FrashCellID forIndexPath:indexPath];
        cell3.model = self.bottomViews[indexPath.row - 3];
        cell3.delegate = self;
        cell = cell3;
    }
    
    return cell;
    
}

-(void)loadHomeDatas
{

    NSString *path = [[NSBundle mainBundle] pathForResource:@"xinxianyuding" ofType:nil];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:0 error:nil];
    

    NSDictionary *jsonData = dict[@"data"];
    NSArray *act_info = jsonData[@"act_info"];
    
    
    NSArray *arrBase = act_info[0][@"act_rows"];
    
    NSMutableArray *arrM = [NSMutableArray array];
    [arrBase enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *dict = obj[@"activity"];
        BaseHomeModel *model = [BaseHomeModel baseModelWithDict:dict];
        
        [arrM addObject:model];
    }];
    self.banner = arrM.copy;
    [arrM removeAllObjects];
    
    
    //    轮播器下面的导航条
    arrBase = act_info[1][@"act_rows"];
    [arrBase enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *dict = obj[@"activity"];
        BaseHomeModel *model = [BaseHomeModel baseModelWithDict:dict];
        
        [arrM addObject:model];
    }];
    self.btnView = arrM.copy;
    [arrM removeAllObjects];
    
    //    导航条下面的横屏banner
    arrBase = act_info[2][@"act_rows"];
    [arrBase enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        FreshModel *model = [FreshModel freshModelWith:obj];
        
        [arrM addObject:model];
    }];
    self.collectionView = arrM.copy;
    [arrM removeAllObjects];
    
    // 底部商品视图
    NSArray *act_row_1 = act_info[3][@"act_rows"];
    [act_row_1 enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        GoodsModel *base = [GoodsModel goodsModelWith:obj];
        [arrM addObject:base];
    }];
    self.bottomViews = arrM.copy;
    
}

- (void)viewWillAppear:(BOOL)animated {
    //获取通知中心
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(goodsMessageGoTo) name:@"goToGoodsMessage" object:nil];
    
    NSNotificationCenter *youhuiquancenter = [NSNotificationCenter defaultCenter];
    [youhuiquancenter addObserver:self selector:@selector(youhuiquan) name:@"youhuiquan" object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    NSLog(@"通知移除");
}


@end
