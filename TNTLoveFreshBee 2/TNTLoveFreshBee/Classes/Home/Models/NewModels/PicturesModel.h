//
//  PicturesModel.h
//  loaddata
//
//  Created by 李丹 on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PicturesModel : NSObject

/// 商品名称
@property (nonatomic, copy) NSString *name;
/// 图片地址
@property (nonatomic, copy) NSString *img;
/// 价格
@property (nonatomic, copy) NSString *price;

@end
