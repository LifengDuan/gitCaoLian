//
//  FrashCell.h
//  新鲜预订测试版
//
//  Created by 王朝阳 on 2016/10/11.
//  Copyright © 2016年 wangzhaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FrashCell,GoodsModel;
@protocol FrashCellDelegate <NSObject>

- (void)goToNextBtn:(FrashCell *)fcell andWithbut:(UIButton *)btn;



@end

@interface FrashCell : UITableViewCell
@property (nonatomic, weak) id <FrashCellDelegate> delegate;

/**
 接收传入的模型数据
 */
@property (nonatomic, strong) GoodsModel *model;
@end
