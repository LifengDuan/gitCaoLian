//
//  NextGoodsCell.h
//  TNTLoveFreshBee
//
//  Created by 王朝阳 on 2016/10/13.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NextGoodsCell;
@protocol NextGoodsCellDelegate <NSObject>

//代理方法
- (void)nextGoodsCell:(NextGoodsCell *)nextGoodsCell andWithImage:(UIImageView *)image;

@end
@interface NextGoodsCell : UITableViewCell

//代理属性
@property (nonatomic, weak) id <NextGoodsCellDelegate>delegate;
@end
