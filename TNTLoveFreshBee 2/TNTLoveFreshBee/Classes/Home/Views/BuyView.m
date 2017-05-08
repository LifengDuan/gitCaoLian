//
//  AJBuyView.m
//  loveFreshPeak
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 吕文苑. All rights reserved.
//

#import "BuyView.h"
#import "UserShopCarTool.h"
#import "ProgressHUDManager.h"


@interface BuyView ()
// 添加商品按钮
@property (nonatomic, strong) UIButton *addBtn;
// 减少商品按钮
@property (nonatomic, strong) UIButton *cutBtn;
// 数量
@property (nonatomic, strong) UILabel *countLable;
// 补货提示
@property (nonatomic, strong) UILabel *OOSLabel;
// 商品的索引
@property (nonatomic, assign) NSInteger goodsIndex;

@end

@implementation BuyView

- (instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.countLable = 0;
    
    _addBtn = [[UIButton alloc]init];
    [_addBtn setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    [_addBtn addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addBtn];
    
    _cutBtn = [[UIButton alloc]init];
    [_cutBtn setImage:[UIImage imageNamed:@"v2_reduce"] forState:UIControlStateNormal];
    [_cutBtn addTarget:self action:@selector(cutButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_cutBtn];
    
    _countLable = [[UILabel alloc]init];
    _countLable.text = @"0";
    _countLable.font = [UIFont systemFontOfSize:14];
    _countLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_countLable];
    
    _OOSLabel = [[UILabel alloc]init];
    _OOSLabel.text = @"补货中";
    _OOSLabel.hidden = YES;
    _OOSLabel.textColor = [UIColor redColor];
    _OOSLabel.font = [UIFont systemFontOfSize:14];
    _OOSLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_OOSLabel];
    
    [_cutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.width.mas_equalTo(self.mas_height);
    }];
    [_countLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_cutBtn.mas_trailing).offset(4);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.trailing.equalTo(_addBtn.mas_leading).offset(-4);
    }];
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.width.mas_equalTo(self.mas_height);
    }];
    [_OOSLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];    return self;
}

- (void)setGoodsIndex:(NSInteger)goodsIndex{
    _goodsIndex = goodsIndex;
    if (self.zearNeverShow) {
        self.cutBtn.hidden = YES;
        self.countLable.hidden = YES;
    }else {
        if (goodsIndex == 0) {
            self.cutBtn.hidden = YES  && !self.zearIsShow;
            self.countLable.hidden = YES  && !self.zearIsShow;
        }else {
            self.countLable.text = [NSString stringWithFormat:@"%ld",goodsIndex];
            self.cutBtn.hidden = NO;
            self.countLable.hidden = NO;
        }
    }
}

- (void)setGoods:(Goods *)goods{
    _goods = goods;
    if (goods.number <= 0) {
        [self supplementLabelShow:YES];
    }else {
        [self supplementLabelShow:NO];
    }
    // 统计顾客购买商品的数量
    self.goodsIndex = goods.userBuyNumber;
}

- (void)supplementLabelShow:(BOOL)is{
    if (is) {
        self.OOSLabel.hidden = NO;
        self.countLable.hidden = YES;
        self.addBtn.hidden = YES;
        self.cutBtn.hidden = YES;
    }else {
        self.OOSLabel.hidden = YES;
        self.countLable.hidden = NO;
        self.addBtn.hidden = NO;
        self.cutBtn.hidden = NO;
    }
}

/**
 *  增加所点击商品数量 和 做动画 -
 */
- (void)addButtonClick:(UIButton *)btn{
    if (self.goodsIndex >= self.goods.number) {  // 添加商品  如果大于库存数
        [[NSNotificationCenter defaultCenter] postNotificationName:HomeGoodsInventoryProblem object:self.goods.name];
        NSString *statusStr = [NSString stringWithFormat:@"%@ 库存不足了 先买这么多，过段时间再来看看吧~",self.goods.name];
        [ProgressHUDManager showImage:[UIImage imageNamed:@"v2_orderSuccess"] status:statusStr];
        return;
    }
    self.goodsIndex++;
//    NSLog(@"self.goodsIndex = %ld",(long)self.goodsIndex);
    self.goods.userBuyNumber = self.goodsIndex;
    self.countLable.text = [NSString stringWithFormat:@"%ld",self.goodsIndex];
    [[UserShopCarTool sharedInstance] addSupermarkProductToShopCar:self.goods];
    [[NSNotificationCenter defaultCenter] postNotificationName:LFBShopCarBuyNumberDidChangeNotification object:nil];
 
#pragma mark  -转换坐标 -
    // 1.应用程序主窗口! [UIApplication sharedApplication] 获取应用程序对象,单例!
    UIWindow *keyW = [UIApplication sharedApplication].keyWindow;
    // 2.转换坐标-> 将按钮的center 转为 相对于应用程序主窗口的点!
    _startPoint = [self convertPoint:btn.center toView:keyW];
    
#warning -------- xiugailezheli
    
    self.cellBlock(_startPoint); // BuyView
    
    // 发送事件
    
    
    
}
/**
 *  减少点击商品数量
 */
- (void)cutButtonClick:(UIButton *)btn{
    if (self.goodsIndex <= 0) {
        return;
    }

    self.goodsIndex--;
    self.goods.userBuyNumber = self.goodsIndex;
    if (self.goodsIndex == 0) {
        [[UserShopCarTool sharedInstance] removeFromProductShopCar:self.goods];
    }else {
        self.countLable.text = [NSString stringWithFormat:@"%ld",self.goodsIndex];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:LFBShopCarBuyNumberDidChangeNotification object:nil];
}

@end
