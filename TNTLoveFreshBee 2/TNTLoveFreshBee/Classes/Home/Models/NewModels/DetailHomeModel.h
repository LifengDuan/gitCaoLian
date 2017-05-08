//
//  DetailHomeModel.h
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailHomeModel : NSObject
//name long_name specifics   safe_day  market_price   partner_price  pre_img  pre_imgs
/// 商品名称
@property (nonatomic, copy) NSString *name;
/// 商品介绍
@property (nonatomic, copy) NSString *long_name;
/// 商品包装规格
@property (nonatomic, copy) NSString *specifics;
/// 保存日期
@property (nonatomic, strong) NSNumber *safe_day;
/// 打折价格
@property (nonatomic, strong) NSNumber *market_price;
/// 原价
@property (nonatomic, strong) NSNumber *partner_price;
/// 图片地址
@property (nonatomic, copy) NSString *img;

+(instancetype)detailWithDict:(NSDictionary *)dict;

@end
