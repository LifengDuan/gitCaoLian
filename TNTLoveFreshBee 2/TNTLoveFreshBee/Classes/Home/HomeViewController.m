//
//  HomeViewController.m
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "HomeViewController.h"
#import "HMScannerController.h"
#import "OtherFiles.h"



#define storeCellID @"storeCellID"
#define ChanBottomTableViewCellID @"ChanBottomTableViewCellID"
#define IconLableBtnTableViewCellID @"IconLableBtnTableViewCellID"
#define ScrollImgcellID @"ScrollImgcellID"
#define freshhomeCellID @"freshhomeCellID"

@interface HomeViewController ()<ChanBottomTableViewCellDelegate>

// 控制器
//@property(nonatomic,strong) LeftViewController *leftViewController;
/// 顶部轮播器
@property (nonatomic, strong) NSArray *banner;
/// 按钮视图
@property (nonatomic, strong) NSArray *btnView;
/// 滚动视图
@property (nonatomic, strong) NSArray *collectionView;
/// 便利店
@property (nonatomic, strong) MarketModel *storeView;
/// 新鲜到家
@property (nonatomic, strong) MarketModel *freshHomeView;
/// 底部其他视图
@property (nonatomic, strong) NSArray *bottomViews;

@end

@implementation HomeViewController

-(void)viewDidLoad
{
//    self.tableView
    [super viewDidLoad];
    
    [self setupUI];
    
    [self registerCell];
    
    [self loadHomeDatas];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.backBarButtonItem = item;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    UIImage *backButtonImage = [[UIImage imageNamed:@"v2_goback"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self setupBanner];
}

-(void)registerCell
{
    [self.tableView registerClass:[storeCell class] forCellReuseIdentifier:storeCellID];
    
    [self.tableView registerClass:[ChanBottomTableViewCell class] forCellReuseIdentifier:ChanBottomTableViewCellID];
    
    [self.tableView registerClass:[IconLableBtnTableViewCell class] forCellReuseIdentifier:IconLableBtnTableViewCellID];
    
    [self.tableView registerClass:[freshhomeCell class] forCellReuseIdentifier:freshhomeCellID];
    
    [self.tableView registerClass:[ScrollImgcell class] forCellReuseIdentifier:ScrollImgcellID];
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




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowH;
    if (indexPath.row == 0)
    {
        rowH = 80;
    }
    else if (indexPath.row == 1)
    {
        rowH = 150;
    }
    else if (indexPath.row == 2 || indexPath.row == 3)
    {
        rowH = 300;
    }
    else
    {
        rowH = 360;
    }
    
    return rowH;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (indexPath.row == 0)
    {
        IconLableBtnTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:IconLableBtnTableViewCellID forIndexPath:indexPath];
        cell = cell1;
        cell1.model = self.btnView;
//        reuseID = IconLableBtnTableViewCellID;
    }
    else if (indexPath.row == 1)
    {
//        reuseID = ScrollImgcellID;
        ScrollImgcell *cell2 = [tableView dequeueReusableCellWithIdentifier:ScrollImgcellID forIndexPath:indexPath];
        cell2.model = self.collectionView;
        cell = cell2;
    }
    else if (indexPath.row == 2 || indexPath.row == 3)
    {

        storeCell *cell5 = [tableView dequeueReusableCellWithIdentifier:storeCellID forIndexPath:indexPath];
        cell5.model = self.storeView;
        
        cell = cell5;
    }
//    else if (indexPath.row == 3)
//    {
//        
//            freshhomeCell *cell3 = [tableView dequeueReusableCellWithIdentifier:storeCellID forIndexPath:indexPath];
//            cell3.model = self.storeView;
//            cell = cell3;
//        
//    }
    else
    {
        ChanBottomTableViewCell *cell4 = [tableView dequeueReusableCellWithIdentifier:ChanBottomTableViewCellID forIndexPath:indexPath];
        
        cell = cell4;
        cell4.selectionStyle = UITableViewCellSelectionStyleNone;
        cell4.delegate = self;
//        NSLog(@"%zd --- %zd",indexPath.row,indexPath.section);
        cell4.model = self.bottomViews[indexPath.row - 4];
        
//        reuseID = ChanBottomTableViewCellID;
    }
    
    return cell;
}



#pragma mark - 张木锋的代理方法
// 代理方法1:更多按钮-->跳转到闪送超市
- (void)chanBottomTableViewCell:(ChanBottomTableViewCell *)tableViewCell andMoreButton:(UIButton *)moreButton {
    
    self.tabBarController.selectedIndex = 1;
}
// 代理方法2:中间长图-->跳转到分类的商品列表
- (void)chanBottomTableViewCell:(ChanBottomTableViewCell *)tableViewCell andMidImageView:(UIImageView *)midImageView {
    ChanSubPageViewController *chanSubPageViewController = [[ChanSubPageViewController alloc] init];
    
    
    
    [self.navigationController pushViewController:chanSubPageViewController animated:YES];
}


- (void)viewDidAppear:(BOOL)animated {
    // 接收通知1:商品方图-->跳转到本商品的详情
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpToSelfGoodsDetail:) name:@"mainImageView" object:nil];
    // 接收通知2:添加按钮-->把商品添加到购物车
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addGoodsIntoShopcar:) name:@"addButton" object:nil];
}
// 通知1监听方法:商品方图-->跳转到本商品的详情
- (void)jumpToSelfGoodsDetail:(NSNotification *)notification {
    
    GoodsDetailViewController *goodsDetailViewController = [[GoodsDetailViewController alloc] init];
    
    goodsDetailViewController.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:goodsDetailViewController animated:YES];
}
// 通知2监听方法:添加按钮-->把商品添加到购物车
- (void)addGoodsIntoShopcar:(NSNotification *)notifition {
    
    
}
// 移除观察者
- (void)viewDidDisappear:(BOOL)animated {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    NSLog(@"通知被移除了！");
}

- (void)scanBtn {
    HMScannerController *scanner = [HMScannerController scannerWithCardName:nil avatar:nil completion:^(NSString *stringValue) {
        
        //        self.scanResultLabel.text = stringValue;
    }];
    
    [scanner setTitleColor:[UIColor whiteColor] tintColor:[UIColor greenColor]];
    
    [self showDetailViewController:scanner sender:nil];
}


//MARK: 查找
- (void)searchBtn {
    
    WSTableViewController *searchVC = [[WSTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    searchVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:searchVC animated:YES];
}

#pragma mark - 搭建界面
- (void)setupUI {
    
    //创建Item
    UIBarButtonItem *scanItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_black_scancode"] style:UIBarButtonItemStylePlain target:self action:@selector(scanBtn)];
    self.navigationItem.leftBarButtonItem = scanItem;
    scanItem.tintColor = [UIColor lightGrayColor];
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchBtn)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    rightBtn.tintColor = [UIColor lightGrayColor];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
}


-(void)loadHomeDatas
{
//    NSString *URLPath = @"http://m.beequick.cn/data/home?lat=39.977846184473&lng=116.49718705041&simulate_mobile=true&asid=57fb0b407b9698754&_r=0.292587641548531&reflogid=57fdaf800f1241935&cart_pids=&location=116.50965201661,39.985310454316&defPid=&designated_dealerid=";
    NSString *path = [[NSBundle mainBundle] pathForResource:@"homedata" ofType:nil];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:0 error:nil];
    
//    [DSHTTPClient getUrlString:URLPath withParam:nil withSuccessBlock:^(id data)
//     {
//         NSDictionary *dict = data;
         NSDictionary *jsonData = dict[@"data"];
         NSArray *act_info = jsonData[@"act_info"];
         
         //    首页轮播器  模型：activity
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
         arrBase = act_info[3][@"act_rows"];
         [arrBase enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
             NSDictionary *dict = obj[@"activity"];
             BaseHomeModel *model = [BaseHomeModel baseModelWithDict:dict];
             
             [arrM addObject:model];
         }];
         self.collectionView = arrM.copy;
         [arrM removeAllObjects];
         
         
         //    便利店
         NSDictionary *act_rows4 = act_info[4][@"act_rows"][0][@"act_rows"][0][@"chead_detail"]; // name img
         BaseHomeModel *baseModel = [BaseHomeModel baseModelWithDict:act_rows4];
         NSArray *act_row_2 = act_info[4][@"act_rows"][2][@"act_rows"];
    
         MarketModel *model = [[MarketModel alloc] init];
         [act_row_2 enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
             
             NSDictionary *dict = obj[@"cicons_detail"];
             BaseHomeModel *base = [BaseHomeModel baseModelWithDict:dict];
             model.topTitleModel = baseModel;
             [arrM addObject:base];
         }];
         model.midBtnModel = arrM.copy;
         [arrM removeAllObjects];
         
         NSArray *act_row_1 = act_info[4][@"act_rows"][1][@"act_rows"];
         [act_row_1 enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
             NSDictionary *dict = obj[@"cactivity_detail"];
             BaseHomeModel *base = [BaseHomeModel baseModelWithDict:dict];
             [arrM addObject:base];
         }];
         model.midPictureModel = arrM.copy;
         [arrM removeAllObjects];
         
         NSArray *act_row_3 = act_info[4][@"act_rows"][3][@"act_rows"];
         [act_row_3 enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
             
             NSDictionary *dict = obj[@"activity"];
             BaseHomeModel *base = [BaseHomeModel baseModelWithDict:dict];
             [arrM addObject:base];
         }];
         model.bottomModel = arrM.copy;
         self.storeView = model;
         [arrM removeAllObjects];
         
         //    新鲜到家
         
         
         NSDictionary *fresh_rows4 = act_info[5][@"act_rows"][0][@"act_rows"][0][@"chead_detail"];
         BaseHomeModel *fresh = [BaseHomeModel baseModelWithDict:fresh_rows4];
         
         NSArray *fresh_row_2 = act_info[5][@"act_rows"][1][@"act_rows"];
         MarketModel *freshModel = [[MarketModel alloc] init];
         freshModel.topTitleModel = fresh;
         //    NSLog(@"%@",fresh_row_2);
         [fresh_row_2 enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
             NSDictionary *dict = obj[@"cactivity_detail"];
             BaseHomeModel *base = [BaseHomeModel baseModelWithDict:dict];
             [arrM addObject:base];
         }];
         freshModel.midPictureModel = arrM.copy;
         [arrM removeAllObjects];
         
         
         
         
         NSArray *fresh_row_1 = act_info[5][@"act_rows"][2][@"act_rows"][0][@"cgoods_detail"][@"goods"];
         
         //    NSLog(@"%@",fresh_row_1);
         [fresh_row_1 enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
             //        NSDictionary *dict = obj[@"cactivity_detail"];
             DetailHomeModel *base = [DetailHomeModel detailWithDict:obj];
             [arrM addObject:base];
         }];
         freshModel.bottomModel = arrM.copy;
         self.freshHomeView = freshModel;
         [arrM removeAllObjects];
         
         //        底部
         NSArray *fresh_row_ = act_info[6][@"act_rows"];
         [fresh_row_ enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
             MarketModel *model = [[MarketModel alloc] init];
             //        图片
             NSDictionary *picDict = obj[@"activity"];
             model.topTitleModel = [BaseHomeModel baseModelWithDict:picDict];
             //        产品
             NSArray *goodsArr = obj[@"category_detail"][@"goods"];
             //        model.goods =
             model.colorNum = obj[@"category_detail"][@"category_color"];
             NSMutableArray *garrM = [NSMutableArray array];
             [goodsArr enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                 DetailHomeModel *dmodel = [DetailHomeModel detailWithDict:obj];
                 [garrM addObject:dmodel];
             }];
             model.goods = garrM.copy;
             [arrM addObject:model];
         }];
         self.bottomViews = arrM.copy;
         [arrM removeAllObjects];
         
//         [self.tableView reloadData];
//     } withFailedBlock:^(NSError *error) {
//         NSLog(@"%@",error);
//     } withErrorBlock:^(NSString *message) {
//         NSLog(@"%@",message);
//     }];
}

@end
