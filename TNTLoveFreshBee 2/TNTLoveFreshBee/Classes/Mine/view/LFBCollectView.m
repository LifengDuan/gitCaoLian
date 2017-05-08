//
//  LFBCollectView.m
//  TNTLoveFreshBeen
//
//  Created by Book on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "LFBCollectView.h"

@implementation LFBCollectView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
//监听事件
-(void)clikCollec:(UIButton *)sender{

    if ([_delegate respondsToSelector:@selector(lFBCollectView:andwith:)]) {
        [self.delegate lFBCollectView:self andwith:sender];
    }
    

}


-(void)setupUI{
    

    self.backgroundColor = [UIColor colorWithRed:242.0/255 green:198.0/255 blue:45.0/255 alpha:1];
    
    UIView *cen = [[UIView alloc]init];
    cen.backgroundColor = [UIColor whiteColor];
    [self addSubview:cen];
    [cen mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self);
        make.width.mas_equalTo(0.5);
        make.top.equalTo(self).offset(8);
        make.bottom.equalTo(self).offset(-8);
    }];
    
    
    UIButton *collec = [[UIButton alloc]init];
//    collec.titleLabel.textAlignment = NSTextAlignmentCenter;
    collec.titleLabel.font = [UIFont systemFontOfSize:13];

    [collec setImage:[UIImage imageNamed:@"icon_mystore-1"] forState:UIControlStateNormal];
    [collec setTitle:@"商品收藏" forState:UIControlStateNormal];
    [self addSubview:collec];
    [collec mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.top.bottom.equalTo(self);
        make.right.equalTo(self.mas_left).offset(self.bounds.size.width * 0.5);
        
    }];
    collec.tag = 0;
    [collec addTarget:self action:@selector(clikCollec:) forControlEvents:UIControlEventTouchUpInside];
    _bt1 = collec;
    
    UIButton *collec2 = [[UIButton alloc]init];
    //    collec.titleLabel.textAlignment = NSTextAlignmentCenter;
    collec2.titleLabel.font = [UIFont systemFontOfSize:13];
    
    [collec2 setImage:[UIImage imageNamed:@"icon_mystore-1"] forState:UIControlStateNormal];
    [collec2 setTitle:@"店铺收藏" forState:UIControlStateNormal];
    [self addSubview:collec2];
    [collec2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.top.bottom.equalTo(self);
        make.left.equalTo(self.mas_left).offset(self.bounds.size.width * 0.5);
        
    }];
    collec2.tag = 6;
    [collec2 addTarget:self action:@selector(clikCollec:) forControlEvents:UIControlEventTouchUpInside];
//    self.backgroundColor = [UIColor redColor];

    _bt2 = collec2;
}




@end
