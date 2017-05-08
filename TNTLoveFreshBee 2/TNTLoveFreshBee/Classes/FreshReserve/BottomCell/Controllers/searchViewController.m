//
//  searchViewController.m
//  TNTLoveFreshBee
//
//  Created by 王朝阳 on 2016/10/14.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "searchViewController.h"
#import "SCSearchBar.h"

@interface searchViewController ()

@end

@implementation searchViewController {
    SCSearchBar *_searchBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigationBar];
}

#pragma mark - 点击事件
- (void)makeSure:(UIBarButtonItem *)item {
//    NSLog(@"确认信息");
    
}
- (void)setNavigationBar {
    
    // 1. 创建searchBar
    _searchBar = [[SCSearchBar alloc] init];
    _searchBar.placeholder = @"请输入商品关键字";
    // 2. 中间添加searchBar
    [self.navigationController.navigationBar addSubview:_searchBar];
    
    UIImage *backButtonImage = [[UIImage imageNamed:@"v2_goback"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"确认" style:UIBarButtonItemStylePlain target:self action:@selector(makeSure:)];
    rightItem.tintColor = [UIColor lightGrayColor];
    self.navigationItem.rightBarButtonItem = rightItem;
}
//- (void)viewDidDisappear:(BOOL)animated {
//    [_searchBar removeFromSuperview];
//}
- (void)viewDidAppear:(BOOL)animated {
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [_searchBar removeFromSuperview];
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
