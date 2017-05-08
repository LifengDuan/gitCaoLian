//
//  AXFTabbarController.m
//  TNTLoveFreshBeen
//
//  Created by 李丹 on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "AXFTabbarController.h"
#import "AXFNavigationController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "SuperMarketViewController.h"
#import "ZFBGuideView.h"

#define KImageCount 4

@interface AXFTabbarController ()<UITabBarControllerDelegate>

@end

@implementation AXFTabbarController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.delegate = self;
//    这里需要每个页面对应的控制器创建完毕
    UIViewController *vc3 = [self  loadChildViewControllerWithClassName:@"FreshViewController" andTitle:@"新鲜预定" andImageName:@"freshReservation"];
    vc3.tabBarItem.selectedImage = [UIImage imageNamed:@"freshReservation_r"];
    
    UIViewController *vc1 = [self  loadChildViewControllerWithClassName:@"HomeViewController" andTitle:@"首页" andImageName:@"v2_home"];
    vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"v2_home_r"];
    
    UIViewController *vc5 = [self  loadChildViewControllerWithClassName:@"MineViewController" andTitle:@"我的" andImageName:@"v2_my"];
    vc5.tabBarItem.selectedImage = [UIImage imageNamed:@"v2_my_r"];
    
    UIViewController *vc4 = [self  loadChildViewControllerWithClassName:@"ShopingViewController" andTitle:@"购物车" andImageName:@"shopCart"];
    vc4.tabBarItem.selectedImage = [UIImage imageNamed:@"shopCart_r"];

    UIViewController *vc2 = [self  loadChildViewControllerWithClassName:@"LeftViewController" andTitle:@"闪送超市" andImageName:@"v2_order"];
    vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"v2_order_r"];
    
    
//     给标签控制器添加子控制器
    self.viewControllers = @[vc1, vc2, vc3, vc4,vc5];
    
    // 取消tabBar的半透明效果
    self.tabBar.translucent = NO;
    
    // 设置标签栏的主题颜色
    self.tabBar.tintColor = [UIColor grayColor];
    
    [self setupUI];
        [self addGuideView];
}

/// 创建子控制器的方法
- (UIViewController *)loadChildViewControllerWithClassName:(NSString *)className andTitle:(NSString *)title andImageName:(NSString *)imageName;
{
    
    Class calss = NSClassFromString(className);
    UIViewController *viewController = [[calss alloc] init];
    
//    随机颜色 测试用
    viewController.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
//    viewController.view.backgroundColor = [UIColor whiteColor];
    
    return [self setupViewControllerWithViewController:viewController andTitle:title andImageName:imageName] ;
}

/// 将子控制器包装到一个导航控制器的方法
- (UIViewController *)setupViewControllerWithViewController:(UIViewController *)vc andTitle:(NSString *)title andImageName:(NSString *)imageName
{
    vc.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    AXFNavigationController *nav = [[AXFNavigationController alloc] initWithRootViewController:vc];
    
    return nav;
}

- (void)addGuideView {
    
    // 1.实例化界面
    ZFBGuideView *guideView = [[ZFBGuideView alloc] initWithFrame:self.view.bounds];
    
    // 2.传递数据
    guideView.imageNames = [self loadImageNames];
    // 3.把新特性界面添加到控制器根视图上
    [self.view addSubview:guideView];
}

- (NSArray *)loadImageNames {
    // Capacity 容量
    // 创建可变数组的同时就分配好空间
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:KImageCount];
    
    // 循环拼接图片名称
    for (NSInteger i = 0; i < KImageCount; i++) {
        NSString *imageName = [NSString stringWithFormat:@"guide_40_%zd.jpg", i + 1];
        // 添加图片名称
        [arrM addObject:imageName];
    }
    return arrM.copy;
}

// 设置主界面的图片
- (void)setupUI {
    
    // 创建主界面的图片
    UIImageView *imageView = [[UIImageView alloc] init];
    // 设置图片填充模式
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    // 设置图片
    imageView.image = [UIImage imageNamed:@"cozy-control-car"];
    // 把主界面添加到控制器的根视图上
    [self.view addSubview:imageView];
    
    
    
    // 给imageView添加约束,添加约束前imageView一定要被addSubView之后再来加约束
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make center];
        make.width.equalTo(self.view.mas_width);
        make.height.equalTo(self.view.mas_width);
    }];
    
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
//    UIImage *img = viewController.tabBarItem.selectedImage;
    
//    viewController.tabBarItem.selectedImage
    
//    NSLog(@"%zd",viewController.tabBarController.selectedIndex);
}

@end
