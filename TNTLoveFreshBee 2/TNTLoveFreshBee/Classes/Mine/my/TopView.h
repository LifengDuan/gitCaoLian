//
//  TopView.h
//  我的订单
//
//  Created by 王朝阳 on 2016/10/15.
//  Copyright © 2016年 wangzhaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopView : UIControl

// 接收需要偏移的量
@property (nonatomic, assign) CGFloat offset_X;

// 需要滚动到的页码
@property (nonatomic, assign) NSUInteger pageNumber;
@end
