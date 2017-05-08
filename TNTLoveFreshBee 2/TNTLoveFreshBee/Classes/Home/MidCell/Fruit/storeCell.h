//
//  storeCell.h
//  自定义cell
//
//  Created by Steve on 2016/10/12.
//  Copyright © 2016年 Steve. All rights reserved.
//

#import <UIKit/UIKit.h>

@class storeCell,MarketModel;

//声明代理协议
@protocol storeCellDelegate <NSObject>

@optional

//代理方法
-(void)storeCell:(storeCell *)storecell buttonTag:(NSInteger)btntag;

@end


@interface storeCell : UITableViewCell

//代理属性
@property (nonatomic, weak) id<storeCellDelegate> delegate;

@property (nonatomic, strong) MarketModel *model;
@end
