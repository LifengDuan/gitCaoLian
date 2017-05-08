//
//  FreshConllectionView.m
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/11.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "FreshConllectionView.h"
#import "MidFreshCollectionCell.h"
#import "FreshViewCell.h"
#import "Masonry.h"

#define ImageViewCellID @"ImageViewCellID"
#define MidFreshCollectionCellID @"MidFreshCollectionCellID"

@interface FreshConllectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *modelArr;

@end

@implementation FreshConllectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self)
    {
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[FreshViewCell class] forCellWithReuseIdentifier:MidFreshCollectionCellID];
        self.contentSize = CGSizeMake(self.bounds.size.width / 3 * 4, self.bounds.size.height);
    }
    return self;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.modelList.count - 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    FreshViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MidFreshCollectionCellID forIndexPath:indexPath];
    cell.model = self.modelList[indexPath.item];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    CGFloat itmeW = (self.bounds.size.width - 3) / 3;
    
    CGSize functionCellSize = CGSizeMake(itmeW, self.bounds.size.height);
    
    
    return functionCellSize;
}

-(void)setModelList:(NSArray *)modelList
{
    _modelList = modelList;
    
    self.modelArr = modelList;
}
@end
