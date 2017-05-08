//
//  GoodsModel.h
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/16.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseHomeModel,DetailHomeModel,ActivModel;

@interface GoodsModel : NSObject
/// 顶部banner模型
@property (nonatomic, strong) BaseHomeModel *more_activity;
/// 顶部banner图片上商品信息模型
@property (nonatomic, strong) DetailHomeModel *goods;
/// 每个Cell中商品模型
@property (nonatomic, strong) ActivModel *category_detail;

+(instancetype)goodsModelWith:(NSDictionary *)dict;

@end
