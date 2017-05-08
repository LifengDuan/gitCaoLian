//
//  LFBFrashCollectionViewCell.h
//  新鲜预订测试版
//
//  Created by 王朝阳 on 2016/10/12.
//  Copyright © 2016年 wangzhaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailHomeModel;

@protocol LFBFrashCollectionViewCellDelegate <NSObject>



@end

@interface LFBFrashCollectionViewCell : UICollectionViewCell

//代理属性

@property (nonatomic, strong) DetailHomeModel *model;


@end
