//
//  LightningView.m
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "LightningSendView.h"

@interface LightningSendView ()


@end

@implementation LightningSendView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        // 添加黄色竖线
        UIView *lines = [[UIView alloc]init];
        lines.backgroundColor = GeneralColor;
        
        // 黄线右边的“闪送超市”
        UILabel *lightningLabel = [[UILabel alloc]init];
        lightningLabel.text = @"闪送超市";
        lightningLabel.font = [UIFont systemFontOfSize:15];
        [lightningLabel sizeToFit];
        
        [self addSubview:lines];
        [self addSubview:lightningLabel];

        [lines mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(3);
            make.height.mas_equalTo(15);
            make.leading.equalTo(self).offset(10);
            make.centerY.equalTo(self);
        }];
        [lightningLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(lines).offset(5);
            make.centerY.equalTo(self);
        }];
        
       
    }
    return self;
}
@end
