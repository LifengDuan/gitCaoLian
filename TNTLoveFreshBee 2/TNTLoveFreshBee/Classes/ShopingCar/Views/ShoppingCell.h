//
//  ShoppingCell.h
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperMarketViewController.h"

@interface ShoppingCell : UITableViewCell
/**
 *  接收所有商品模型
 */
@property (nonatomic,strong) Goods *goods;
@end
