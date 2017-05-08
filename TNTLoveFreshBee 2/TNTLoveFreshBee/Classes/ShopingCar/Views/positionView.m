//
//  AddressView.m
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "positionView.h"

@interface positionView ()
@property (nonatomic,strong) UIButton *addressBtn;
@property (nonatomic, strong) UIImageView *arrows;
@end

@implementation positionView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUIOne];
    }
    return self;
}

- (void)setupUIOne
{
    _addressBtn = [[UIButton alloc]init];
    _addressBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_addressBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_addressBtn setTitle:@"鲜蜂侠需要您的坐标" forState:UIControlStateNormal];
    [_addressBtn sizeToFit];
    
    [_addressBtn addTarget:self action:@selector(positionCommitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    

    
    [self addSubview:_addressBtn];
    
    _arrows = [[UIImageView alloc]init];
    _arrows.image = [UIImage imageNamed:@"icon_go"];
    [self addSubview:_arrows];
    
    [_addressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(10);
        make.centerY.equalTo(self);
    }];
    [_arrows mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).offset(-10);
        make.centerY.equalTo(self);
    }];
}


- (void)positionCommitBtnClick
{
//    if ([self.delegate respondsToSelector:@selector(didTablePositionViewCommit)]) {
//        [self.delegate didTablePositionViewCommit];
//    }
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center postNotificationName:@"haha" object:self userInfo:nil];
    
}


@end
