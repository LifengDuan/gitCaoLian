//
//  OrdersViewController.m
//  我的订单
//
//  Created by 王朝阳 on 2016/10/15.
//  Copyright © 2016年 wangzhaoyang. All rights reserved.
//

#import "OrdersViewController.h"
#import "Masonry.h"

@interface OrdersViewController ()

@end

@implementation OrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QQ20161015-2"]];
    
    [self.view addSubview:bg];
    [bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(0);
    }];
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
