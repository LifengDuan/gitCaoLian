//
//  UnSelectGoods.h
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UnSelectGoods;
@protocol UnselectGoodsDelegate <NSObject>

@optional
- (void)UnSelectGood:(UnSelectGoods *)UnSelectGoods;

@end

@interface UnSelectGoods : UIView

@property (nonatomic, weak) id<UnselectGoodsDelegate> delegate;

@end
