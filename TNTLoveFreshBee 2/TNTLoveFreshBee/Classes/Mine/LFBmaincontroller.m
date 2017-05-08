//
//  LFBmaincontroller.m
//  TNTLoveFreshBeen
//
//  Created by Book on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "LFBmaincontroller.h"
#import "LFBHearView.h"
#import "LFBCollectView.h"
@interface LFBmaincontroller ()

@end

@implementation LFBmaincontroller
-(void)loadView{

    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
-(void)setupUI{
//    顶部试图添加
    LFBHearView *headview = [[LFBHearView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150)];
    [self.view addSubview:headview];
//    中间收藏试图添加
    LFBCollectView *collect = [[LFBCollectView alloc]initWithFrame:CGRectMake(0, 120, self.view.bounds.size.width, 33)];
    [self.view addSubview:collect];
    
    

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
