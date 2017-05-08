//
//  LightningStoreHeaderContrller.m
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "LightningStoreHeaderContrller.h"
#import "CZAdditions.h"

@interface LightningStoreHeaderContrller ()

@end

@implementation LightningStoreHeaderContrller
{
    
    // 数组,存放3个按钮的数组
    NSArray<UIButton *> *_btnsArr;
    
}

#pragma mark - 搭建界面
- (void)setupUI {
    
    // 确定按钮标题
    NSArray<NSString *> *titlesArr = @[@"综合排序", @"按价格", @"按销售"];
    
    // 遍历创建按钮
    [titlesArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 创建按钮
        UIButton *btn = [UIButton cz_textButton:obj fontSize:14 normalColor:[UIColor cz_colorWithHex:0x555555] selectedColor:[UIColor cz_colorWithHex:0x000000]];
        
        [self addSubview:btn];
        
    }];
    
    // 布局按钮的约束
    [self.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [self.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.equalTo(self);
        
    }];
    
    // 赋值,记录3个按钮
    _btnsArr = self.subviews;
    
}

@end
