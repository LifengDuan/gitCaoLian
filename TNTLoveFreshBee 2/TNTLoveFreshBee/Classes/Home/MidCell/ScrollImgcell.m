//
//  ScrollImgcell.m
//  CeShi_02
//
//  Created by 赵世得 on 2016/10/13.
//  Copyright © 2016年 Zh. All rights reserved.
//

#import "ScrollImgcell.h"
#import <Masonry.h>
#import "ScrollImgFlowLayout.h"
#import "ScrollImgCollectionViewCell.h"
#import "BaseHomeModel.h"

static NSString *ID = @"cell";
@interface ScrollImgcell()<UICollectionViewDataSource>
//存放图片的地址
@property (nonatomic, weak) NSArray *imgArr;
@end
@implementation ScrollImgcell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}


- (void)setUpUI{
    ScrollImgFlowLayout *scrollFlowLayout = [[ScrollImgFlowLayout alloc] init];
    UICollectionView *collectionV = [[UICollectionView alloc] initWithFrame:self.contentView.bounds collectionViewLayout:scrollFlowLayout];
    collectionV.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:collectionV];
    collectionV.dataSource = self;
    [collectionV registerClass:[ScrollImgCollectionViewCell class] forCellWithReuseIdentifier:ID];
    collectionV.bounces = NO;
    collectionV.showsHorizontalScrollIndicator = NO;
    collectionV.showsVerticalScrollIndicator = NO;
    [collectionV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.contentView);
    }];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imgArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ScrollImgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    BaseHomeModel *baseModel = self.imgArr[indexPath.item];
    cell.imgAddress = baseModel.img;
    return cell;
    
}

- (void)setModel:(NSArray *)model{
    _model = model;
    
    self.imgArr = model;
}
@end
