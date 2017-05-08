//
//  LFBMyOrderController.m
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/13.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "LFBMyOrderController.h"

@interface LFBMyOrderController ()

@end

@implementation LFBMyOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupUI{

    UIView *topV = [[UIView alloc] init];
    topV.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:topV];
    
    [topV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(64);
        
    }];


}
@end
