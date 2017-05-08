//
//  AJUserShopCarTool.h
//  loveFreshPeak
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 吕文苑. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Goods.h"

@interface UserShopCarTool : NSObject
@property (nonatomic, strong) NSMutableArray <Goods *> *shopCar;

+ (instancetype)sharedInstance;
- (void)addSupermarkProductToShopCar:(Goods *)goods;
- (void)removeFromProductShopCar:(Goods*)goods;
- (CGFloat)getShopCarGoodsPrice ;
- (NSInteger)getShopCarGoodsNumber;
- (BOOL)isEmpty;

@end
