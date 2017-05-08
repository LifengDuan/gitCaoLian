//
//  model.h
//  shouCangShop
//
//  Created by Book on 16/10/14.
//  Copyright © 2016年 qau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface model : NSObject
//点击的状态
@property(nonatomic,assign) Boolean select;
//店名
@property(nonatomic,copy)NSString *name;
//营业时间
@property(nonatomic,copy)NSString *time;
//地址
@property(nonatomic,copy)NSString *address;
//距离
@property(nonatomic,strong)NSNumber *distance;
//组的下角标
@property(nonatomic,assign)NSInteger index;
@end
