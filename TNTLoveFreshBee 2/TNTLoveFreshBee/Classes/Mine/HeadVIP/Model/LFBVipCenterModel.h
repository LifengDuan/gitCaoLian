//
//  LFBVipCenterModel.h
//  LFBVipCenter
//
//  Created by YVEN on 16/10/13.
//  Copyright © 2016年 YVEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFBVipCenterModel : NSObject
//图片名
@property (nonatomic, copy) NSString *icon;
//ningzi de
@property (nonatomic, copy) NSString *name;
//中间文字
@property (nonatomic, copy) NSString *content;


+ (instancetype)contentWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
