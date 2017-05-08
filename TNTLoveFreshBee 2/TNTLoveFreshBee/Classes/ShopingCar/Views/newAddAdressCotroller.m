//
//  newAddAdressCotroller.m
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/14.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "newAddAdressCotroller.h"
#import "AddMessageController.h"

@interface newAddAdressCotroller ()<UITableViewDataSource>
// 列表视图
@property (nonatomic, weak) UITableView *tableView;

// 分段控件
@property (nonatomic, weak) UISegmentedControl *segment;

@end

// 重用cell的标示符
static NSString *cellID = @"cellID";

@implementation newAddAdressCotroller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
//    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;

}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 数据源方法
// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // 行数 = (分段控件选中的位置的索引! + 1) * 10;
//    NSLog(@"%zd", _segment.selectedSegmentIndex);
//    return (_segment.selectedSegmentIndex + 1) * 10;
    return 0;
}

// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.创建cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    // 2.设置数据
    cell.textLabel.text = @(indexPath.row).description;
    
    // 3.返回cell
    return cell;
    
}

#pragma mark - 监听事件
//点击分段控件时调用
- (void)segmentControlClick:(UISegmentedControl *)sender {
    
    NSInteger index = sender.selectedSegmentIndex;
        switch (index) {
            case 0:
                [self seperateLeftView];
                break;
            case 1:
                [self seperateRightView];
                break;
            case 2:
                [self seperateAddAdress];
                break;
            default:
                break;
        }

    [_tableView reloadData]; // 刷新数据!
    
}

- (void)seperateLeftView
{
    self.tableView.backgroundColor = [UIColor yellowColor];
//    UIView *bottomView = [[UIView alloc]init];
//    bottomView.userInteractionEnabled = YES;
//    bottomView.backgroundColor = [UIColor greenColor];
////    [[UIApplication sharedApplication].keyWindow addSubview:bottomView];
//    [self.view addSubview:bottomView];
////    [self.tabBarController.tabBar addSubvi ew:bottomView];
//    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.left.equalTo(self.view).offset(0);
//        make.height.mas_equalTo(49);
//        make.bottom.mas_equalTo(49);
//    }];
    
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
//    btn.backgroundColor = [UIColor redColor];
//    [btn setTitle:@"+新增地址" forState:UIControlStateNormal];
//    btn.titleLabel.font = [UIFont systemFontOfSize:13];
//    [bottomView addSubview:btn];
//    
//    [btn addTarget:self action:@selector(addAdress) forControlEvents:UIControlEventTouchUpInside];
    
}
//- (void)addAdress
//{
//    
//}


- (void)seperateRightView
{
    self.tableView.backgroundColor = [UIColor magentaColor];
}

- (void)seperateAddAdress
{
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    AddMessageController *addMessageVc = [[AddMessageController alloc]init];
//    addMessageVc.view.backgroundColor = [UIColor greenColor];
    [self.navigationController pushViewController:addMessageVc animated:YES];
}

- (void) setupUI
{
    
    // 1.列表视图
    UITableView *tv = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tv];
    
    _tableView = tv;
    
    tv.separatorStyle = UITableViewCellSelectionStyleNone;
    
    // 1.2 设置数据源
    tv.dataSource = self;
    // 1.3 注册cell
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    
    // 2.顶部的segment
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"送货上门", @"店铺自提",@"新增地址"]];
    
    // 2.4 设置默认选中第0个分段
    [seg setSelectedSegmentIndex:0];
    
    seg.tintColor = [UIColor orangeColor];
    
//    seg.segmentedControlStyle = UISegmentedControlStyleBordered;
    
    
    seg.layer.cornerRadius = 5;
    seg.layer.masksToBounds = YES;
    
    // 2.2 调整宽度
    // 通过for循环设置控件的宽度
    for (int i = 0; i < seg.numberOfSegments; i++) {
        [seg setWidth:80 forSegmentAtIndex:i];
    }
    
    // 2.3 监听分段控件的事件
    [seg addTarget:self action:@selector(segmentControlClick:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = seg;
    
    _segment = seg;

    // 取出返回文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
}

@end


/*
 #import "AddMessageController.h"
 
 @interface AddMessageController ()<UITableViewDelegate,UITableViewDataSource>
 
 @end
 
 @implementation AddMessageController
 
 - (void)viewDidLoad {
 [super viewDidLoad];
 
 [self setupUI];
 }
 
 //- (instancetype)init
 //{
 //    self = [super init];
 //    if (self) {
 //        [self setupUI];
 //    }
 //    return self;
 //}
 - (void)setupUI
 {
 self.title = @"";
 self.tableView.rowHeight = 60;
 
 
 }
 */






