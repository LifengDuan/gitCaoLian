//
//  FrashGoodsController.m
//  TNTLoveFreshBee
//
//  Created by 王朝阳 on 2016/10/14.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "FrashGoodsController.h"

#import "NextGoodsCell.h"
#import "TopCell.h"
#import "FrashDetailViewController.h"

#define cellID @"cellID"
#define topCellID @"topCellID"
@interface FrashGoodsController ()<UITableViewDelegate,UITableViewDataSource,NextGoodsCellDelegate>

@end

@implementation FrashGoodsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifer;
    if (indexPath.row == 0) {
        identifer = topCellID;
    } else {
        identifer = cellID;
    }
    NextGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer forIndexPath:indexPath];
    //    tableView.rowHeight = 130;
    if ([identifer isEqualToString:cellID]) {
        cell.delegate = self;
    }
    tableView.bounces = NO;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}
#pragma mark - 代理方法
- (void)nextGoodsCell:(NextGoodsCell *)nextGoodsCell andWithImage:(UIImageView *)image {
    
    FrashDetailViewController *frashDetailVC = [[FrashDetailViewController alloc]init];
    frashDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:frashDetailVC animated:YES];
}
#pragma mark - 点击事件
- (void)goShopBtn {
    
    NSLog(@"跳转到购物车");
    //拿到标签控制器的角标进行跳转
    self.tabBarController.selectedIndex = 3;
}
- (void)refreshBtn {
    NSLog(@"刷新界面");
}
#pragma mark - 搭建界面
- (void)setupUI {
    
    //MARK:设置导航条的属性
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"v2_refresh"] style:UIBarButtonItemStylePlain target:self action:@selector(refreshBtn)];
    rightBtn.tintColor = [UIColor lightGrayColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
    //    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationItem.title = @"新鲜预订";
    UIImage *backButtonImage = [[UIImage imageNamed:@"v2_goback"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //1.创建tableView
    UITableView *goodsTab = [[UITableView alloc] init];
    //    goodsTab.backgroundColor = [UIColor redColor];
    [self.view addSubview:goodsTab];
    [goodsTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    goodsTab.delegate = self;
    goodsTab.dataSource = self;
    //    goodsTab.scrollEnabled = NO;
    //MARK:-注册 cell
    [goodsTab registerClass:[NextGoodsCell class] forCellReuseIdentifier:cellID];
    [goodsTab registerClass:[TopCell class] forCellReuseIdentifier:topCellID];
    goodsTab.rowHeight = 130;
    //    2.创建底部视图
    UIImageView *bottomImg = [[UIImageView alloc] init];
    [self.view addSubview:bottomImg];
    bottomImg.backgroundColor = [UIColor clearColor];
    [bottomImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.offset(0);
        make.height.mas_offset(60);
        make.width.mas_offset(80);
    }];
    UIImageView *shopImg = [[UIImageView alloc]init];
    //    shopImg.frame = CGRectMake(bottomImg.frame.origin.x + 310, bottomImg.frame.origin.y + 554, 50, 50);
    shopImg.image = [UIImage imageNamed:@"v2_shopNoBorder"];
    [bottomImg addSubview:shopImg];
    [shopImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-5);
        make.bottom.offset(-5);
    }];
    UITapGestureRecognizer *shopTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goShopBtn)];
    [shopImg addGestureRecognizer:shopTap];
    //3.创建购物车按钮
    UIImageView *carImg= [[UIImageView alloc] init];
    
    carImg.image = [UIImage imageNamed:@"shopCart"];
    ////  shopBtn.frame = CGRectMake(0, 0, 60, 60);
    [shopImg addSubview:carImg];
    [carImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(shopImg);
    }];
    
    
    
    //    [carBtn addTarget:self action:@selector(goShopBtn) forControlEvents:UIControlEventTouchUpInside];
    //MARK:开启用户交互
    bottomImg.userInteractionEnabled = YES;
    shopImg.userInteractionEnabled = YES;
    carImg.userInteractionEnabled = YES;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
