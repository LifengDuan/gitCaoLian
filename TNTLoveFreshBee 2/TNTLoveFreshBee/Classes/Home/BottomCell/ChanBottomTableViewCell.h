//
//  ChanBottomTableViewCell.h
//  爱鲜蜂首页下部模块
//
//  Created by 张木锋 on 2016/10/11.
//  Copyright © 2016年 ZMF. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChanBottomCollectionViewCell;
@class ChanBottomTableViewCell,MarketModel;
//代理
@protocol ChanBottomTableViewCellDelegate <NSObject>

@optional
- (void)chanBottomTableViewCell:(ChanBottomTableViewCell *)tableViewCell andMoreButton:(UIButton *)moreButton;
- (void)chanBottomTableViewCell:(ChanBottomTableViewCell *)tableViewCell andMidImageView:(UIImageView *)midImageView;

@end

@interface ChanBottomTableViewCell : UITableViewCell

@property(nonatomic,strong) MarketModel *model;

@property(nonatomic,weak) id<ChanBottomTableViewCellDelegate> delegate;

@property(nonatomic,weak) ChanBottomCollectionViewCell *cellOut;

@end
