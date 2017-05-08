//
//  LeftViewController.m
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "LeftViewController.h"
#import "RightViewController.h"
#import "SuperMarketViewController.h"
#import "LeftCell.h"
#import "LightningStoreHeaderContrller.h"

// 顶部视图的高度104
#define kHeaderHeight 107

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *sortTableView;
@property (nonatomic, strong) RightViewController *productsController;
@property (nonatomic, strong) SuperMarketData *supermarketSouce;

// 排序视图
@property (nonatomic, weak) LightningStoreHeaderContrller *sortView;

// 定义一个顶部视图的全局属性
@property(weak,nonatomic) UIView * topView;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [super viewDidLoad];
    [self bulidSortTableView];
    [self bulidProductsTableView];
    [self loadData];
    
    [self setupUI];
}

// 搭建界面
- (void)setupUI
{
    // 1.顶部视图
    UIView *topV = [[UIView alloc] init];
    topV.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    topV.alpha = 1;
    [self.view addSubview:topV];
    
    [topV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(94);
        make.right.top.equalTo(self.view);
        make.height.mas_equalTo(kHeaderHeight);
        
    }];
    
    _topView = topV;
    
    // 2.排序视图
    LightningStoreHeaderContrller *sortView = [[LightningStoreHeaderContrller alloc] init];
    self.sortView.backgroundColor = [UIColor greenColor];
    
    [topV addSubview:sortView];
    [sortView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(topV);
        make.bottom.equalTo(topV.mas_bottom).offset(-20);
        make.height.mas_equalTo(0);
    }];
}

- (void)bulidSortTableView{
    self.sortTableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 42.5;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        tableView;
    });
    [self.view addSubview:self.sortTableView];
    [self.sortTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.leading.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(0.25);
    }];
}
- (void)bulidProductsTableView{
    self.productsController = [[RightViewController alloc]init];
    [self addChildViewController:self.productsController];
    [self.view addSubview:self.productsController.view];
    self.delegate = self.productsController;
    
}

- (void)loadData{
    __weak typeof (self) weak = self;
    [SuperMarketViewController loadSupermarketData:^(id data, NSError *error) {
        weak.supermarketSouce = data;
        [weak.sortTableView reloadData];
        [weak.sortTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        weak.productsController.supermarketSouce = data;
//        NSLog(@"data = %@",data);
    }];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.supermarketSouce.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    LeftCell *cell = [LeftCell cellWithTable:tableView];
    cell.categoryData = self.supermarketSouce.categories[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(didTableView:clickIndexPath:)]) {
        [self.delegate didTableView:self.sortTableView clickIndexPath:indexPath];
    }
}

@end
