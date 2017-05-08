//
//  CateGoryModel.h
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailHomeModel.h"

@interface CateGoryModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) DetailHomeModel *goods;

@end
