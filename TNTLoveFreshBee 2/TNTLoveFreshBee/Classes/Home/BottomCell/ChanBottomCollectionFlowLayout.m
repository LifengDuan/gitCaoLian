//
//  ChanBottomCollectionFlowLayout.m
//  爱鲜蜂首页下部模块
//
//  Created by 张木锋 on 2016/10/12.
//  Copyright © 2016年 ZMF. All rights reserved.
//

#import "ChanBottomCollectionFlowLayout.h"

@implementation ChanBottomCollectionFlowLayout

//prepareLayout重写方法

- (void)prepareLayout {
    
    [super prepareLayout];
    
    CGFloat itemWidth = self.collectionView.bounds.size.width / 3;
    CGFloat itemHeight = self.collectionView.bounds.size.height;
    self.itemSize = CGSizeMake(itemWidth, itemHeight);
    
    self.minimumLineSpacing = 1;
    self.minimumInteritemSpacing = 0;
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

@end
