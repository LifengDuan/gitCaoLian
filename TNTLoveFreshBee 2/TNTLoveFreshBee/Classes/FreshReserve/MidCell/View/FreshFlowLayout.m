//
//  FreshFlowLayout.m
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "FreshFlowLayout.h"

@implementation FreshFlowLayout

-(void)prepareLayout
{
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
    
//    CGFloat itemW = self.collectionView.bounds.size.width * 0.28;
//    CGFloat itemH = self.collectionView.bounds.size.height;
//    self.itemSize = CGSizeMake(itemW, itemH);
//    self.minimumInteritemSpacing = 0;
//    self.minimumLineSpacing = 1;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
}

@end
