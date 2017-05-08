//
//  AJSelectedAdressViewController.m
//  loveFreshPeak
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 吕文苑. All rights reserved.
//  当前需要统一改变导航栏样式的控制器

#import "SelectedAdressViewController.h"
//#import "UIBarButtonItem+Button.h"

@interface SelectedAdressViewController ()

@end

@implementation SelectedAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self buildNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)buildNavigationBar
//{
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItem:@"扫一扫" image:@"icon_black_scancode" target:self action:@selector(LeftItemButtonClicket) type:LeftItemButton];
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItem:@"搜索" image:@"icon_search" target:self action:@selector(rightBarButtonClick) type:RightItemButton];
//    
//    self.navigationController.navigationBar.barTintColor = GeneralColor;
//}

/**
 *  将要显示进入控制器调用
 */
- (void)viewWillAppear:(BOOL)animated
{
    
}

#pragma callBack method
- (void)LeftItemButtonClicket{
    
}
- (void)rightBarButtonClick{
    
}


@end
