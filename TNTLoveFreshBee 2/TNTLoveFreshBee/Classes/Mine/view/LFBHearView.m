//
//  LFBHearView.m
//  TNTLoveFreshBeen
//
//  Created by Book on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "LFBHearView.h"

@implementation LFBHearView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
//头部设置按钮的监听方法
-(void)setting:(UIButton *)sender{

    if ([_delegate respondsToSelector:@selector(LFBHearView:andwithbt:)]) {
        [self.delegate LFBHearView:self andwithbt:sender];
    }

}


-(void)setupUI{

//    整个头部视图
    
    UIImageView *headImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"v2_my_avatar_bg"]];
    [self addSubview:headImage];
    headImage.userInteractionEnabled = YES;
    
    
//    设置图标
    UIButton *seting = [[UIButton alloc]init];
    [seting setImage:[UIImage imageNamed:@"v2_my_settings_icon"] forState:UIControlStateNormal];
    [seting addTarget:self action:@selector(setting:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:seting];
    
    
    
//    头像图标
    UIImageView *headImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_my_avatar"]];
    [self addSubview:headImageView];
    
    
//   头部试图左边的箭头
    UIImageView *rightArrow = [[UIImageView alloc]init];
    rightArrow.image = [UIImage imageNamed:@"88.pic.jpg"];
    [self addSubview:rightArrow];
    
//    设置电话号码
    UILabel *phoneLabel = [[UILabel alloc]init];
    phoneLabel.text = @"18511405034";
    phoneLabel.font = [UIFont systemFontOfSize:18];
    phoneLabel.textColor = [UIColor whiteColor];
    phoneLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:phoneLabel];
    
    
    
    [seting mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.trailing.equalTo(self).offset(5);
        make.width.and.height.mas_equalTo(50);
    }];
    
    [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(0);
        make.leading.mas_equalTo(10);
    }];

    [rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(20);
        make.centerY.equalTo(self).offset(0);
        make.right.equalTo(self.mas_right).offset(-10);
       
    }];
    
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headImageView);
        make.left.equalTo(headImageView.mas_right).offset(5);
        make.height.mas_equalTo(30);
    }];
    
}
@end
