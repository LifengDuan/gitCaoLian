//
//  IconLabelView.m
//  TNTLoveFreshBee
//
//  Created by 赵世得 on 2016/10/14.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "IconLabelView.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "BaseHomeModel.h"

@interface IconLabelView ()
@property (nonatomic, weak) UIImageView *imageV;
@property (nonatomic, weak) UILabel *label;
@end
@implementation IconLabelView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}


- (void)setUpUI{
    UIImageView *imgV = [[UIImageView alloc] init];
    [imgV sizeToFit];
    imgV.image = [UIImage imageNamed:@"qiandao"];
    [self addSubview:imgV];
    
    UILabel *lab = [[UILabel alloc] init];
    lab.text = @"签到";
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
    self.imageV = imgV;
    self.label = lab;
    imgV.userInteractionEnabled = NO;
    lab.userInteractionEnabled = NO;
}

-(void)setModel:(BaseHomeModel *)model
{
    _model = model;
    
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"005"]];
    
    if (model.name != nil)
    {
        self.label.text = model.name;
    }
    
}

@end
