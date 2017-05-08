//
//  RightCell.h
//  //
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 吕文苑. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class productsModel;
#import "Goods.h"

@interface RightCell : UITableViewCell

//@property (nonatomic,strong) productsModel *cModel;
//+ (instancetype) cellWithTableView: (UITableView *)tableView;

@property (nonatomic, strong) Goods *goods;

// 设置商品添加购物车动画
@property (nonatomic,copy) void(^WillStartAnimation)(CGPoint);

@end
