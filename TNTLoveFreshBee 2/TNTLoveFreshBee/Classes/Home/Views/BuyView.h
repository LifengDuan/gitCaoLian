//
//  AJBuyView.h
//  loveFreshPeak
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 吕文苑. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goods.h"

@interface BuyView : UIView
/*
 * 是否显示0
 */
@property (nonatomic, assign) BOOL zearIsShow;
/*
 * 关联的商品模型
 */
@property (nonatomic, strong) Goods *goods;
/*
 * 不显示减号
 */
@property (nonatomic, assign) BOOL zearNeverShow;

/**
 动画的起点
 */
@property (nonatomic, assign) CGPoint startPoint;


@property(nonatomic,copy)void(^cellBlock)(CGPoint);

@end
