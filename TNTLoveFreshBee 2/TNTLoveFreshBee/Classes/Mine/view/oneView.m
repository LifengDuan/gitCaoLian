//
//  oneView.m
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "oneView.h"

@implementation oneView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *orderLabel = [[UILabel alloc]init];
        orderLabel.text = @"我的订单";
        orderLabel.font = [UIFont systemFontOfSize:14];
        orderLabel.textColor = [UIColor blackColor];
        
        UILabel *fullLabel = [[UILabel alloc]init];
        fullLabel.text = @"查看全部订单";
        fullLabel.font = [UIFont systemFontOfSize:14];
        fullLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];;
        
        UIImageView *arrowsImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_go"]];
        arrowsImg.userInteractionEnabled = YES;
        [self addSubview:orderLabel];
        [self addSubview:fullLabel];
        [self addSubview:arrowsImg];
        
        [orderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(20);
            make.centerY.equalTo(self);
        }];
        [arrowsImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self).offset(-5);
            make.centerY.equalTo(self);
        }];
        [fullLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(arrowsImg).offset(-10);
            make.centerY.equalTo(self);
        }];
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clikOne)];
        [self addGestureRecognizer:tap1];
        
    }
    return self;
}
-(void)clikOne{
    
    NSNotification *oneview = [NSNotification notificationWithName:@"oneview" object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotification:oneview];
    

    if ([self.delegate respondsToSelector:@selector(oneView:)]) {
      
        [self.delegate oneView:self];
    }
    
}
@end
