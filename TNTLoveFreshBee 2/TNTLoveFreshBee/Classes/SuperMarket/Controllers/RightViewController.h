//
//  ProductsViewController.h
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SuperMarketViewController.h"
#import "LeftViewController.h"

@interface RightViewController : BaseViewController<LeftViewControllerDelegate>
@property (nonatomic, strong) SuperMarketData *supermarketSouce;
@end
