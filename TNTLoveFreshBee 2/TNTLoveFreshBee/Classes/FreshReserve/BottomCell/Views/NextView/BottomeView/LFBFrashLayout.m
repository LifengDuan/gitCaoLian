//
//  LFBFrashLayout.m
//  新鲜预订测试版
//
//  Created by 王朝阳 on 2016/10/11.
//  Copyright © 2016年 wangzhaoyang. All rights reserved.
//

#import "LFBFrashLayout.h"

@implementation LFBFrashLayout

- (void)prepareLayout {
    
    [super prepareLayout];
    //计算宽高
    CGFloat itemW = (self.collectionView.bounds.size.width - 2 ) * 0.333333;
    CGFloat itemH = self.collectionView.bounds.size.height * 0.5;
    
//    NSLog(@"w%f h%f",itemW,itemH);
    //设置大小
    self.itemSize = CGSizeMake(itemW, itemH);
    //设置行列间距
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    
    
    //设置底部间距,就可以不让视图滚动
//    self.sectionInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);

}

@end
