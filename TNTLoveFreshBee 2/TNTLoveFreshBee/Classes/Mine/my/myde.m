//
//  myde.m
//  shouCangShop
//
//  Created by Book on 16/10/16.
//  Copyright © 2016年 qau. All rights reserved.
//

#import "myde.h"
#import "TopView.h"
#import "CZAdditions.h"
@interface myde ()<UIScrollViewDelegate>
// 顶部视图
@property (nonatomic, weak) TopView *topView;


// 滚动视图
@property (nonatomic, weak) UIScrollView *scrollView;

@end

@implementation myde

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 监听事件
// MARK: - 2.分类视图值改变事件
- (void)categoryViewValueChanged:(TopView *)sender {
    
    // 1.获取页码数
    NSUInteger pageNumber = sender.pageNumber;
    // 2.让scrollView滚动
    CGRect rect = CGRectMake(_scrollView.bounds.size.width * pageNumber, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height);
    [_scrollView scrollRectToVisible:rect animated:YES];
    
}

- (void)setupUI {
    
    TopView *topV = [[TopView alloc] init];
    topV.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:topV];
    [topV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(64);
    }];
    // 监听分类视图的值改变事件
    [topV addTarget:self action:@selector(categoryViewValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    //    [topV mas_makeConstraints:^(MASConstraintMaker *make) {
    //
    //        make.left.top.right.offset(0);
    //        make.height.mas_equalTo(44);
    //
    //    }];
    
    UIScrollView *scrollV = [self setupContentView];
    scrollV.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:scrollV];
    
    [scrollV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(topV);
        make.top.equalTo(topV.mas_bottom);
        make.bottom.equalTo(self.view);
    }];
    
    _topView = topV;
    _scrollView = scrollV;
}

// 负责创建底部滚动视图的方法
- (UIScrollView *)setupContentView {
    
    UIScrollView *scrollV = [[UIScrollView alloc] init];
    scrollV.backgroundColor = [UIColor whiteColor];
    scrollV.pagingEnabled = YES;
    scrollV.scrollEnabled = NO;
    // 设置代理
    scrollV.delegate = self;
    
    // MARK: - 添加3个控制器的视图!
    // 1.确定要添加子控制器的名称
    NSArray<NSString *> *vcNamesArr = @[@"OrdersViewController", @"MoneyViewController", @"GoodsViewController",@"AppraiseViewController"];
    
    // 2.遍历创建vc对象,并建立父子关系
    NSMutableArray<UIView *> *vcViewsArrM = [NSMutableArray array];
    
    [vcNamesArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 2.1 创建vc对象
        Class cls = NSClassFromString(obj);
        UIViewController *vc = [[cls alloc] init];
        
        // 2.2 建立控制器的父子关系
        [self cz_addChildController:vc intoView:scrollV];
        
        // 2.3添加控制器的视图到view中
        [vcViewsArrM addObject:vc.view];
        
    }];
    
    [vcViewsArrM mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [vcViewsArrM mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(scrollV);
        // 确定内容的高度
        make.bottom.top.equalTo(scrollV);
        
    }];
    
    return scrollV;
}


- (void)viewWillDisappear:(BOOL)animated {
    //    [self.navigationController.navigationBar removeFromSuperview];
    
}
- (void)viewWillAppear:(BOOL)animated {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

