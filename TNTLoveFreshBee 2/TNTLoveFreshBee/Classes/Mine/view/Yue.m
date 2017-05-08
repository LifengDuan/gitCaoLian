//
//  Yue.m
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/16.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "Yue.h"

@interface Yue ()

@end

@implementation Yue

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的余额";
    UIImageView *vi = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"014"]];
    vi.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64);
    [self.view addSubview:vi];
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
