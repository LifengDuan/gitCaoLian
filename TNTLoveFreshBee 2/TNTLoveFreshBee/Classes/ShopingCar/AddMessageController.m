//
//  AddMessageController.m
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/14.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "AddMessageController.h"
//#import "HMLoginController.h"
@interface AddMessageController ()

@end

@implementation AddMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor greenColor];
//    [self addContactMessage];
}

//- (void)addContactMessage
//{
//    HMLoginController *contactVc = [[HMLoginController alloc]init];
//    UIView * loginListView = contactVc.view;
//    [self.view addSubview:loginListView];
//    [self addChildViewController:contactVc];
//}

/**
 *   // 创建功能列表控制器
 ZFBFunctionListViewController *functionListVC = [[ZFBFunctionListViewController alloc] init];
 // 获取到功能列表控制器中的collectionView
 UICollectionView *functionListView = functionListVC.collectionView;
 
 // 把功能列表控制器的collectionVeiw添加到首页控制器的view上
 [self.view addSubview:functionListView];
 
 //    self.listVc = functionListVC;
 // 把功能列表控制器变成home首页控制器的根控制器"不建立父子控制器的关系 将来会影响它的屏幕旋转的事件传递还有影响 psuh的操作"
 [self addChildViewController:functionListVC];
 */



@end







