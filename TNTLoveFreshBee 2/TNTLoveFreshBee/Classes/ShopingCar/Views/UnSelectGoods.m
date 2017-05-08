//
//  UnSelectGoods.m
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "UnSelectGoods.h"

@implementation UnSelectGoods
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        // 设置购物车无添加商品时的展示图片
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:@"v2_shop_empty"];
        imageView.contentMode = UIViewContentModeCenter;
        [self addSubview:imageView];
        
        // 设置购物车无添加商品时的展示文字
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"亲,购物车空空如也~赶紧选购吧";
        titleLabel.font = [UIFont systemFontOfSize:16];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
        [self addSubview:titleLabel];
        
        // 设置购物车无商品添加时的跳转按钮
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:[UIImage imageNamed:@"btn.png"] forState:UIControlStateNormal];
        [button setTitle:@"去逛逛" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0  blue:100/255.0  alpha:1.0] forState:UIControlStateNormal];
        [self addSubview:button];
        
        [button addTarget:self action:@selector(gotoBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        /**
         *  添加以上三者的约束条件
         *
         */
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.centerX.equalTo(self);
        }];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.trailing.equalTo(self);
            make.top.equalTo(imageView.mas_bottom);
            make.height.mas_equalTo(50);
        }];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLabel.mas_bottom);
            make.centerX.equalTo(self);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(150);
        }];
    }
    return self;
}

-(void)gotoBtnClick
{
    if ([self.delegate respondsToSelector:@selector(UnSelectGood:)])
    {
        [self.delegate UnSelectGood:self];
    }
}

@end

