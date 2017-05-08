//
//  MineUICollectionViewFlowLayout.m
//  SubOthersDetail
//
//  Created by 张木锋 on 2016/10/16.
//  Copyright © 2016年 ZMF. All rights reserved.
//

#import "MineUICollectionViewFlowLayout.h"

@implementation MineUICollectionViewFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    self.itemSize = CGSizeMake(self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.minimumLineSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
}

@end
