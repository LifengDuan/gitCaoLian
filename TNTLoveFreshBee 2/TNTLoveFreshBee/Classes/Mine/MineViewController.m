//
//  MineViewController.m
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "MineViewController.h"
#import "LFBHearView.h"
#import "LFBCollectView.h"
#import "LFBminescroll.h"
#import "LFBMineModel.h"
#import "LFBVipCenterController.h"
#import "Seting.h"
#import "ViewController.h"
#import "shopc.h"
#import "myde.h"
#import "Yue.h"
#import "MineMyFeedbackViewController.h"
//测试controller
@interface MineViewController ()<lFBCollectViewDelegate,LFBHearViewDelegate>
@property (nonatomic, strong) NSArray *orderMens;
@property (nonatomic, strong) NSArray *mineMenus;
@property (nonatomic, strong) NSArray *tileMenus;
@property (nonatomic,weak)LFBCollectView *mainHeadView;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@end


@implementation MineViewController

//自定义的代理收藏跳转控制器
-(void)lFBCollectView:(LFBCollectView *)collec andwith:(UIButton *)btncoll{

    if (collec.bt1.tag == 0 ) {
        ViewController *p = [[ViewController alloc] init];
        p.hidesBottomBarWhenPushed = YES;
        p.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:p animated:YES];
    }else{
    
        shopc *s = [[shopc alloc]init];
        s.hidesBottomBarWhenPushed = YES;
        s.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:s animated:YES];

    }


}

-(void)LFBHearView:(LFBHearView *)lFBHearView andwithbt:(UIButton *)btn{

    Seting *set = [[Seting alloc]init];
    set.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:set animated:YES];
}
-(void)clikHead{
    LFBVipCenterController *vip = [[LFBVipCenterController alloc]init];
    
    vip.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vip animated:YES];
}




//
-(void)loadView{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIImage *backButtonImage = [[UIImage imageNamed:@"v2_goback"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithImage:[[UIImage alloc]init]style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = back;

    
    self.orderMens = [self orderMens];
    self.mineMenus = [self mineMenus];
    self.tileMenus = [self tileMenus];
    [self setupUI];
    //    [self buildScrollView];
}
///将要消失的时候将导航变不透明
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.alpha = 1.0;
    
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [[NSNotificationCenter defaultCenter]removeObserver:self];

    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.alpha = 0.0;
    
    NSNotificationCenter *youhuiquancenter = [NSNotificationCenter defaultCenter];
    [youhuiquancenter addObserver:self selector:@selector(oneview) name:@"oneview" object:nil];
    
    NSNotificationCenter *yue = [NSNotificationCenter defaultCenter];
    [yue addObserver:self selector:@selector(yue) name:@"yue" object:nil];
    
    NSNotificationCenter *me = [NSNotificationCenter defaultCenter];
    [me addObserver:self selector:@selector(me) name:@"me" object:nil];
    

}
-(void)me{

    MineMyFeedbackViewController *me = [[MineMyFeedbackViewController alloc]init];

    me.hidesBottomBarWhenPushed = YES;
    me.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:me animated:YES];

}
-(void)yue{

    Yue *y = [[Yue alloc]init];
    y.hidesBottomBarWhenPushed = YES;
    y.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:y animated:YES];


}

-(void)oneview{

    myde *my = [[myde alloc]init];
    my.hidesBottomBarWhenPushed = YES;
    my.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:my animated:YES];


}
-(void)viewDidAppear:(BOOL)animated{

    self.navigationController.navigationBar.alpha = 0.0;
}



-(void)setupUI{
    
    
    //    顶部试图添加
    LFBHearView *headview = [[LFBHearView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150)];
    [self.view addSubview:headview];
    
    UIButton *headBT = [[UIButton alloc]init];
    
    [headview addSubview:headBT];
    
    headview.delegate = self;
    
    
    
    [headBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(headview);
        make.bottom.equalTo(headview.mas_bottom);
        make.top.equalTo(headview.mas_top).offset(64);
    }];
    [headBT addTarget:self action:@selector(clikHead) forControlEvents:UIControlEventTouchUpInside];
    //    中间收藏试图添加
    LFBCollectView *collect = [[LFBCollectView alloc]initWithFrame:CGRectMake(0, 120, self.view.bounds.size.width, 33)];
    [self.view addSubview:collect];
    collect.delegate = self;
    _mainHeadView = collect;
    //
    LFBminescroll *scroll = [[LFBminescroll alloc]initWithFrame:CGRectMake(0, 153, self.view.bounds.size.width,  self.view.bounds.size.height-153)];
    [self.view addSubview:scroll];
    [scroll mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(collect.mas_bottom).offset(0);
        make.left.right.bottom.equalTo(self.view).offset(0);
        
    }];
    //    给scrollview里的三个数组初始化
    scroll.orderMens = _orderMens;
    scroll.mineMenus = _mineMenus;
    scroll.tileMenus = _tileMenus;
    
}











//给试图模型赋值
- (NSArray *)orderMens{
    
    _orderMens = @[
                   [LFBMineModel titleIconWith:@"待付款" icon:[UIImage imageNamed:@"001"] controller:nil tag:0],
                   [LFBMineModel titleIconWith:@"待收货" icon:[UIImage imageNamed:@"002"] controller:nil tag:1],
                   [LFBMineModel titleIconWith:@"待评价" icon:[UIImage imageNamed:@"003"] controller:nil tag:2],
                   [LFBMineModel titleIconWith:@"退款/售后" icon:[UIImage imageNamed:@"004"] controller:nil tag:3]
                   ];
    
    return _orderMens;
}
-(NSArray *)mineMenus{
    
    
    _mineMenus = @[[LFBMineModel titleIconWith:@"余额" text:@"¥0.00" controller:nil tag:4],
                   [LFBMineModel titleIconWith:@"优惠券" text:@"0" controller:nil tag:5],
                   [LFBMineModel titleIconWith:@"积分" text:@"0" controller:nil tag:6]
                   ];
    
    
    return _mineMenus;
    
}
-(NSArray *)tileMenus{
    
    
    _tileMenus = @[[LFBMineModel titleIconWith:@"积分商城" icon:[UIImage imageNamed:@"005"] controller:nil tag:7],
                   [LFBMineModel titleIconWith:@"收货地址" icon:[UIImage imageNamed:@"006"] controller:nil tag:8],
                   [LFBMineModel titleIconWith:@"我的信息" icon:[UIImage imageNamed:@"007"] controller:nil tag:9],
                   [LFBMineModel titleIconWith:@"客服/反馈" icon:[UIImage imageNamed:@"008"] controller:nil tag:10],
                   [LFBMineModel titleIconWith:@"加盟合作" icon:[UIImage imageNamed:@"009"] controller:nil tag:11]];
    
    return _tileMenus;
}
@end
