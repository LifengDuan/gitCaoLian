//
//  ShopingViewController.m
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "ShopingViewController.h"
#import "UnSelectGoods.h"
#import "ShoppingCell.h"
#import "UserShopCarTool.h"
#import "TableFootView.h"
#import "positionView.h"
#import "LightningSendView.h"
#import "LightningSendDownView.h"
#import "newAddAdressCotroller.h"

@interface ShopingViewController ()<UITableViewDelegate,UITableViewDataSource,TableFootViewDelegate,didLightningSendDownViewCommitDelegate,UnselectGoodsDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UnSelectGoods *defaultView;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) TableFootView *footView;
//@property (nonatomic,strong) LightningSendView *sendView;
@end

@implementation ShopingViewController
- (void)dealloc{
    [AJNotification removeObserver:self];
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
//    self.sendView.userInteractionEnabled = YES;
//    self.tableView.userInteractionEnabled = YES;
//    self.title = @"<";
    [self bulidNotifacation];
    [self bulidTableView];
    [self bulidDefaultView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(positionClick) name:@"haha" object:nil];
}

-(void)positionClick
{
    newAddAdressCotroller *addressVC = [[newAddAdressCotroller alloc]init];
    [self.navigationController pushViewController:addressVC animated:YES];
}
- (void)bulidNotifacation{
    [AJNotification addObserver:self selector:@selector(IncreaseShoppingCart) name:LFBShopCarBuyNumberDidChangeNotification object:nil];
    [AJNotification addObserver:self selector:@selector(didRemoveGoods) name:LFBShopCarDidRemoveProductNSNotification object:nil];
    
}
- (void)IncreaseShoppingCart{
    self.footView.sumMoney = [[UserShopCarTool sharedInstance]getShopCarGoodsPrice];
}
- (void)didRemoveGoods{
    self.footView.sumMoney = [[UserShopCarTool sharedInstance]getShopCarGoodsPrice];
}
- (void)bulidTableView{
    self.tableView = ({
        UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableview.delegate = self;
        tableview.dataSource = self;
        tableview.rowHeight = 80;
        //tableview.hidden = YES;
        tableview.backgroundColor = [UIColor clearColor];
        tableview;
    });
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self bulidTableHeadView];
    [self bulidTableFootView];
}


- (void)bulidTableHeadView{
    
    // 设置购物车已经添加商品和发货时间的间距
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 151)]; // 150
    positionView *address = [[positionView alloc]initWithFrame:CGRectMake(0, 10, Width, 50)];
//     address.delegate = self;
    
    LightningSendView *lightning = [[LightningSendView alloc]initWithFrame:CGRectMake(0, 70, Width, 30)];
    
    LightningSendDownView *sendDownView = [[LightningSendDownView alloc]initWithFrame:CGRectMake(0,100.5, self.view.bounds.size.width, 50)];
    sendDownView.backgroundColor = [UIColor whiteColor];
    sendDownView.delegate = self;
   
    [self.headView addSubview:sendDownView];
    [self.headView addSubview:address];
    [self.headView addSubview:lightning];
    
//    self.sendView = lightning;
    
    self.tableView.tableHeaderView = self.headView;
}
- (void)bulidTableFootView{
    _footView = [[TableFootView alloc]initWithFrame:CGRectMake(0, 0, Width, 50)];
    _footView.delegate = self;
    self.tableView.tableFooterView = _footView;
}
- (void)bulidDefaultView{
    _defaultView = [[UnSelectGoods alloc]init];
    
    _defaultView.delegate = self;
    _defaultView.hidden = YES;
    [self.view addSubview:_defaultView];
    [_defaultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.mas_equalTo(170);
    }];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
    
    if ([[UserShopCarTool sharedInstance]isEmpty]) {
        self.defaultView.hidden = NO;
        self.tableView.hidden = YES;
    }else{
        self.defaultView.hidden = YES;
        self.tableView.hidden = NO;
        __weak typeof (self) weakSelf = self;
        [SVProgressHUD showWithStatus:@"加载中"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.dataList = [UserShopCarTool sharedInstance].shopCar;
            weakSelf.footView.sumMoney = [[UserShopCarTool sharedInstance]getShopCarGoodsPrice];
            [weakSelf.tableView reloadData];
            [SVProgressHUD dismiss];
        });
    }
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"ID";
    ShoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ShoppingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.goods = self.dataList[indexPath.row];
    return cell;
}

// 立即购买调用方法 -
- (void)didTableFootViewCommit{
    UIViewController *moneyVc = [[UIViewController alloc]init];
    moneyVc.view.backgroundColor = [UIColor whiteColor];
    moneyVc.title = [NSString stringWithFormat:@"%.2lf",[[UserShopCarTool sharedInstance]getShopCarGoodsPrice]];
    [self.navigationController pushViewController:moneyVc animated:YES];
}


// 收货时间调用的方法 -
- (void)didLightningSendViewDownCommit{
    UIViewController *receiveTimeVC = [[UIViewController alloc]init];
    receiveTimeVC.view.backgroundColor = [UIColor yellowColor];
    receiveTimeVC.title = @"收货时间界面";
  
    [self.navigationController pushViewController:receiveTimeVC animated:YES];
}


-(void)UnSelectGood:(UnSelectGoods *)UnSelectGoods
{
    self.tabBarController.selectedIndex = 0;
}


@end
