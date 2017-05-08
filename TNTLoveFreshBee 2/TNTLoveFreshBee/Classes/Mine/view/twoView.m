//
//  twoView.m
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "twoView.h"

@implementation twoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{

    self.backgroundColor = [UIColor whiteColor];
    UILabel *orderLabel = [[UILabel alloc]init];
    orderLabel.text = @"我的钱包";
    orderLabel.font = [UIFont systemFontOfSize:14];
    orderLabel.textColor = [UIColor blackColor];
    [self addSubview:orderLabel];
    
    [orderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(20);
        make.centerY.equalTo(self);
    }];

}
@end
