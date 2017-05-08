//
//  LeftCell.h
//  //
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 吕文苑. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class CategoriesModel;
#import "SuperMarketViewController.h"

@interface LeftCell : UITableViewCell

@property (nonatomic, strong) ProductCategory *categoryData;

+ (instancetype)cellWithTable:(UITableView *)tableView;

@end
