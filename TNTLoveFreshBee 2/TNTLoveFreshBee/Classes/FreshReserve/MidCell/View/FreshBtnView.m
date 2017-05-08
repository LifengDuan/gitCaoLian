//
//  FreshBtnView.m
//  tableViewTest
//
//  Created by 李丹 on 16/10/13.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "FreshBtnView.h"
#import "BaseHomeModel.h"
#import "Masonry.h"

@interface FreshBtnView ()

// 图标
@property (nonatomic, weak) UIImageView *imgV;
// 标题
@property (nonatomic, weak) UILabel *label;

@end

@implementation FreshBtnView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI
{
    UIImageView *imgV = [[UIImageView alloc] init];
    imgV.contentMode = UIViewContentModeScaleAspectFit;
    imgV.image = [UIImage imageNamed:@"miaosha"];
    [self addSubview:imgV];
    
    UILabel *lab = [[UILabel alloc] init];
    lab.text = @"秒杀";
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:12];
    [self addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.offset(-8);
    }];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(lab);
        make.top.left.offset(8);
        make.right.offset(-8);
        make.bottom.equalTo(lab.mas_top).offset(-8);
        
    }];

    self.imgV = imgV;
    self.label = lab;
    
}


-(void)setModel:(BaseHomeModel *)model
{
    _model = model;
    [self.imgV sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"005"]];
    
    if (model.name != nil)
    {
        self.label.text = model.name;
    }
    
}

@end
