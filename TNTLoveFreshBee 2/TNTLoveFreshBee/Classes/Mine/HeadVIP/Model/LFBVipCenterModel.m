//
//  LFBVipCenterModel.m
//  LFBVipCenter
//
//  Created by YVEN on 16/10/13.
//  Copyright © 2016年 YVEN. All rights reserved.
//

#import "LFBVipCenterModel.h"

@implementation LFBVipCenterModel

+ (instancetype)contentWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
    
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}
@end
