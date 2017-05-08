//
//  AJGoods.m
//  loveFreshPeak
//
//  Created by 16/10/11.
//  Copyright © 2016年 All rights reserved.
//

#import "Goods.h"

@implementation GoodsData

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"data":NSStringFromClass([Goods class])};
}

@end

@implementation Goods


+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"gid" : @"id"};
}
@end
