//
//  LFBVipCententHeaderView.m
//  LFBVipCenter
//
//  Created by YVEN on 16/10/12.
//  Copyright © 2016年 YVEN. All rights reserved.
//

#import "LFBVipCententHeaderView.h"
#import "Masonry.h"

@implementation LFBVipCententHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 添加头部视图内的三个子控件
        [self setupTableHeaderView];
    }
    return self;
}

- (void)setupTableHeaderView {
    
//    self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    // 将 根View 增加到 headerView 上
    UIImageView *rootimgV = [[UIImageView alloc] init];
//    rootimgV.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    rootimgV.image = [UIImage imageNamed:@"piao.jpeg"];
    
    [self addSubview:rootimgV];
    
    [rootimgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.offset(0);
        make.width.offset([UIScreen mainScreen].bounds.size.width);
        make.height.offset(180);
    }];

   
    // 头像
    UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"my_002.png"]];
    
    [rootimgV addSubview:imgV];
    
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(30);
        make.centerX.equalTo(rootimgV);
        
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    // 积分(points)
    UILabel *pointsLable = [[UILabel alloc] init];
    pointsLable.text = @"0/999";
    pointsLable.font = [UIFont systemFontOfSize:12];
    pointsLable.textColor = [UIColor whiteColor];
    
    [rootimgV addSubview:pointsLable];
    
    [pointsLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(100);
        make.centerX.equalTo(rootimgV);
    }];
    
    // 积分View (pointsView )
    UIScrollView *scV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 1510, 28)];
    scV.contentInset = UIEdgeInsetsMake(0, -30, 0, 0);
    [scV setContentSize:CGSizeMake(1510, 28)];
    
    scV.showsHorizontalScrollIndicator = FALSE;
    
    scV.bounces = NO;
    
    [self addSubview:scV];
    
    [scV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(115);
        make.left.offset(0);
        
        make.size.mas_equalTo(CGSizeMake(1000, 28));
        
    }];
    
    UIImageView *pointsView = [[UIImageView alloc] initWithFrame:CGRectMake(-30, 0, 1000, 28)];
    
    [pointsView setImage:[UIImage imageNamed:@"my_vip.png"]];
    
    pointsView.userInteractionEnabled = YES;
    
    [scV addSubview:pointsView];
    
    
    // leverLable
    UILabel *leverLable = [[UILabel alloc] init];
    leverLable.text = @"距下一等级还需要30成长值";
    leverLable.font = [UIFont systemFontOfSize:11];
    leverLable.textColor = [UIColor whiteColor];
    
    [rootimgV addSubview:leverLable];
    
    [leverLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(160);
        make.centerX.equalTo(rootimgV);
        
    }];
    
    // 会员攻略
    UIView *vipV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];

//        vipV.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    [self addSubview:vipV];
    
    [vipV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(170);
        make.left.offset(0);
        
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width, 70));
        
    }];
    
    UILabel *vipl = [[UILabel alloc] init];
    vipl.text = @"会员攻略";
    vipl.font = [UIFont systemFontOfSize:13];
    
    [self addSubview:vipl];
    
    [vipl mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(200);
        make.centerX.equalTo(self);
        
    }];
    
    UIImageView *len = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * 0.5, 30)];
    
    [len setImage:[UIImage imageNamed:@"my_len.png"]];
    
    [vipV addSubview:len];
    
    [len mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(20);
        make.left.offset(-40);
        
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.5, 30));
    }];
    
    UIImageView *len2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * 0.5, 30)];
    
    [len2 setImage:[UIImage imageNamed:@"my_len.png"]];
    
    [vipV addSubview:len2];
    
    [len2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(20);
        make.left.equalTo(vipl.mas_right).offset(10);
        
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.5, 30));
    }];
    
}


@end
