//
//  LightningSendDownView.m
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/14.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "LightningSendDownView.h"

@interface LightningSendDownView ()
// 收货时间
@property (nonatomic, strong) UILabel * receiveTimeLabel;
// 指示器
@property (nonatomic, strong) UIImageView *arrows;
// 购买商品按时间减免
@property (nonatomic,strong) UILabel *cutMoneyLabel;
// 用户需求时间
@property (nonatomic,strong) UILabel *demandTimeLabel;
// 闪送超市下的View
@property (nonatomic,strong) UIButton *LightningSendBtn;
@end

@implementation LightningSendDownView
#pragma mark - 监听按钮点击事件 - 用户需求时间 -
- (void)addUserdemandTimeClick
{

    if ([self.delegate respondsToSelector:@selector(didLightningSendDownViewCommit)]) {
        [self.delegate didLightningSendDownViewCommit];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    // 创建承载发货时间的按钮
#pragma mark  -监听按钮点击事件 -
    
    _LightningSendBtn = [[UIButton alloc]init];
    _LightningSendBtn.backgroundColor = [UIColor whiteColor];
    [self addSubview:_LightningSendBtn];
    [_LightningSendBtn addTarget:self action:@selector(addUserdemandTimeClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_LightningSendBtn];
    
//    // 按钮约束
//    [_LightningSendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(self.bounds.size.width);
//        make.height.mas_equalTo(49.9);
//        make.top.equalTo(self.mas_bottom).offset(7.8);
//        make.left.equalTo(self);
//    }];
    
    // 收货时间
    _receiveTimeLabel = [[UILabel alloc]init];
    _receiveTimeLabel.font = [UIFont systemFontOfSize:13];
    //        _receiveTimeLabel.backgroundColor = [UIColor redColor];
    _receiveTimeLabel.textColor = [UIColor darkTextColor];
    _receiveTimeLabel.text = @"收货时间";
    [_receiveTimeLabel sizeToFit];
    [_LightningSendBtn addSubview:_receiveTimeLabel];
    
    // 动态时间Label ---- 时间根据用户选择动态确定 ----
    _demandTimeLabel = [[UILabel alloc]init];
    _demandTimeLabel.font = [UIFont systemFontOfSize:11];
    _demandTimeLabel.textColor = [UIColor orangeColor];
    //        _demandTimeLabel.backgroundColor = [UIColor magentaColor];
    
#warning mark - 此处时间需要动态传值 - 时间根据用户选择动态确定 -
    _demandTimeLabel.text = @"21:00-22:00"; // 占位文字
    [_demandTimeLabel sizeToFit];
    [_LightningSendBtn addSubview:_demandTimeLabel];
    
    // 指示器
    _arrows = [[UIImageView alloc]init];
    _arrows.image = [UIImage imageNamed:@"icon_go"];
    [_LightningSendBtn addSubview:_arrows];
    
    [_receiveTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(10);
        make.top.equalTo(self.mas_top).offset(8);
        
    }];
    [_arrows mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).offset(-10);
        make.top.equalTo(self.mas_top).offset(8);
    }];
    
    // 动态时间
    [_demandTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).offset(-20);
        make.top.equalTo(self.mas_top).offset(7);
    }];
    
    // 减免介绍
    _cutMoneyLabel = [[UILabel alloc]init];
    _cutMoneyLabel.font = [UIFont systemFontOfSize:11];
//    _cutMoneyLabel.textColor = [UIColor darkGrayColor];
    _cutMoneyLabel.textColor = [UIColor blackColor];
    _cutMoneyLabel.text = @"￥0起送，22:00前满￥30减免运费，22:00后满￥69元减免运费";
    [_cutMoneyLabel sizeToFit];
    [_LightningSendBtn addSubview:_cutMoneyLabel];
    
    [_cutMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(10);
        make.bottom.equalTo(self.mas_bottom).offset(-8);
    }];
    

}

@end
