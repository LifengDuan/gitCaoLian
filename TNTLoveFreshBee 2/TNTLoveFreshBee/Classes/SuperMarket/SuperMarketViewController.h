//
//  SuperMarketViewController.h
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goods.h"

@class SuperMarketData;
@class Products;
@class ProductCategory;
@class AJGoods;

@interface SuperMarketViewController : UIViewController
/** code  */
@property (nonatomic, copy) NSString *code;
/** msg  */
@property (nonatomic, copy) NSString *msg;
/** data  */
@property (nonatomic,strong)SuperMarketData *data;

+ (void)loadSupermarketData:(CompleteBlock)complete;
@end

@interface SuperMarketData : NSObject

@property (nonatomic,strong)NSArray<ProductCategory *> *categories;
@property (nonatomic,strong)id products;

@end

@interface ProductCategory : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, strong) NSArray <Goods *> *products;

@end