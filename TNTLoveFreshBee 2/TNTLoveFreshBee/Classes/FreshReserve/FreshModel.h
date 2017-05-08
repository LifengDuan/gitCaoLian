//
//  FreshModel.h
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/16.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseHomeModel,DetailHomeModel,ActivModel;

@interface FreshModel : NSObject

/// 导航图片
@property (nonatomic, copy) NSString *banner_img;

/// 更多商品
@property (nonatomic, strong) BaseHomeModel *more_activity;

/// 商品列表
@property (nonatomic, strong) ActivModel *activ_detail;


/// 提供一个类方法转模型
+(instancetype)freshModelWith:(NSDictionary *)dict;


@end
