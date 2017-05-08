//
//  BaseHomeModel.h
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseHomeModel : NSObject

/// 商品名称
@property (nonatomic, copy) NSString *name;


/// 配图地址
@property (nonatomic, copy) NSString *img;

+(instancetype)baseModelWithDict:(NSDictionary *)dict;

@end
