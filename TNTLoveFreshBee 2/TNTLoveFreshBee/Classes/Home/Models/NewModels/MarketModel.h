//
//  MarketModel.h
//  loaddata
//
//  Created by 李丹 on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailHomeModel.h"
@class BaseHomeModel;

@interface MarketModel : NSObject

/// 顶部视图
@property (nonatomic, strong) BaseHomeModel *topTitleModel;
/// 中间图片
@property (nonatomic, strong) NSArray<BaseHomeModel *> *midPictureModel;
/// 按钮
@property (nonatomic, strong) NSArray<BaseHomeModel *> *midBtnModel;
/// 底部视图
@property (nonatomic, strong)  NSArray<BaseHomeModel *> *bottomModel;
/// 配套商品
@property (nonatomic, strong) NSArray<DetailHomeModel *> *goods;
///  颜色
@property (nonatomic, strong) NSNumber *colorNum;


@end
