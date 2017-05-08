//
//  ActivModel.h
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/16.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DetailHomeModel;

@interface ActivModel : NSObject

/// 分类名称
@property (nonatomic, copy) NSString *name;


/// 商品列表
@property (nonatomic, strong) NSArray<DetailHomeModel *> *goods;


+(instancetype)activeModelWith:(NSDictionary *)dict;

@end
