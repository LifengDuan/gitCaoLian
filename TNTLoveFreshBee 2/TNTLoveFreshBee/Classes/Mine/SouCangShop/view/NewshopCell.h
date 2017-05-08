//
//  NewshopCell.h
//  shouCangShop
//
//  Created by Book on 16/10/15.
//  Copyright © 2016年 qau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "model.h"
@class NewshopCell;

@protocol NewshopCellDelegate <NSObject>

-(void)newshopCell:(NewshopCell *)shopcell andWith:(model *)mode ;

@end

@interface NewshopCell : UITableViewCell
@property(nonatomic,strong)model *mode;
@property(nonatomic,weak)id<NewshopCellDelegate> delegate;
@end
