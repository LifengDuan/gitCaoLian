//
//  ScrollImgFlowLayout.m
//  CeShi_02
//
//  Created by 赵世得 on 2016/10/13.
//  Copyright © 2016年 Zh. All rights reserved.
//

#import "ScrollImgFlowLayout.h"

@implementation ScrollImgFlowLayout

- (void)prepareLayout{
    CGFloat itemW = self.collectionView.bounds.size.width * 0.28;
    CGFloat itemH = self.collectionView.bounds.size.height;
    self.itemSize = CGSizeMake(itemW, itemH);
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 1;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

@end
