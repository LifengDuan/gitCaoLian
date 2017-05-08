//
//  aboutWe.m
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/14.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "aboutWe.h"

@interface aboutWe ()

@end

@implementation aboutWe

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.alpha = 0.0;
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.alpha = 1.0;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    设置头部试图
    UIView *top = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width , 64)];
    top.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:top];
    UIImageView *vi = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-60)];
    [self.view addSubview:vi];
    vi.image = [UIImage imageNamed:@"010"];
    
    
//    设置上部返回按钮
    UIImage *backimg = [UIImage imageNamed:@"my_goback.png"];
    backimg = [backimg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithImage:backimg style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = back;
}

@end
