//
//  ChanBottomTableViewCell.m
//  爱鲜蜂首页下部模块
//
//  Created by 张木锋 on 2016/10/11.
//  Copyright © 2016年 ZMF. All rights reserved.
//

#import "ChanBottomTableViewCell.h"
#import "Masonry.h"
#import "ChanBottomCollectionViewCell.h"
#import "ChanBottomCollectionFlowLayout.h"
#import "UIColor+CZAddition.h"
#import "MarketModel.h"
#import "BaseHomeModel.h"
#import "DetailHomeModel.h"
#import "SuperMarketViewController.h"


#define ID_collection_view @"collection"

@interface ChanBottomTableViewCell ()<UICollectionViewDataSource>

@property(nonatomic,weak) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray<DetailHomeModel *> *modelArr;

@property(nonatomic,weak) UIButton *moreButton;

// 1.cell顶部视图
@property(nonatomic,weak) UIView *topView;
// 1.1.顶部视图的左边方块,此处颜色和字体颜色一致，具有color属性
@property(nonatomic,weak) UIView *leftView;
// 1.2.顶部视图的label
@property(nonatomic,weak) UILabel *nameLabel;
// 2.中间的imageView
@property(nonatomic,weak) UIImageView *midImageView;



@end



@implementation ChanBottomTableViewCell

#pragma mark - 1.重写init方法
- (instancetype)initWithStyle:(UITableViewCellStyle )style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        [self setupChanBottomTableViewCell];
        
    }
    
    return self;
}
#pragma mark - 2.设置自定义cell的界面
- (void)setupChanBottomTableViewCell {
    
    // 1.cell顶部视图--作为容器视图
    UIView *topView = [[UIView alloc] init];
    [self addSubview:topView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.top.left.right.offset(0);
        make.height.mas_equalTo(30);
    }];
    
    // 1.1.顶部视图的左边方块
    UIView *leftView = [[UIView alloc] init];
    leftView.backgroundColor = [UIColor cz_colorWithHex:0xf38631];
    [topView addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(6);
        make.bottom.offset(-6);
        make.width.mas_equalTo(6);
    }];
    
    // 1.2.顶部视图的label
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"优选水果";
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textColor = [UIColor cz_colorWithHex:0xf38631];
    [topView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftView.mas_right).offset(6);
        make.centerY.equalTo(leftView.mas_centerY).offset(0);
    }];
    
    // 1.3.顶部视图的更多

    UIButton *moreButton = [[UIButton alloc] init];
    moreButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [moreButton setTitle:@"更多 >" forState:UIControlStateNormal];
    [moreButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [moreButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [topView addSubview:moreButton];
    self.moreButton = moreButton;
    
    // 大分类的更多按钮添加监听事件
    [moreButton addTarget:self action:@selector(moreButtonClickJumpToSpeedSupermarket) forControlEvents:UIControlEventTouchUpInside];
    
    [moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-8);
        make.centerY.equalTo(nameLabel);
    }];
    
    // 2.中间的imageView
    UIImageView *midImageView = [[UIImageView alloc] init];
    midImageView.image = [UIImage imageNamed:@"2016101122065735.jpg@90Q"];
    [self addSubview:midImageView];
    [midImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(8);
        make.right.offset(-8);
        make.top.equalTo(topView.mas_bottom).offset(8);
        make.height.mas_equalTo(100);
    }];
    midImageView.userInteractionEnabled = YES;
    
    // 添加手势
    UITapGestureRecognizer *midImageViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(midImageViewClickJumpToCategoryGoodsList)];
    [midImageView addGestureRecognizer:midImageViewTap];
    

    // 3.collectionView
    ChanBottomCollectionFlowLayout *flowLayout = [[ChanBottomCollectionFlowLayout alloc] init];
    UICollectionView *collectioView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectioView.backgroundColor = [UIColor whiteColor];
    collectioView.dataSource = self;
    
    self.collectionView = collectioView;
    
    // 注册collectionViewCell
    [self.collectionView registerClass:[ChanBottomCollectionViewCell class] forCellWithReuseIdentifier:ID_collection_view];
    
    [self addSubview:collectioView];
    [collectioView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.equalTo(midImageView.mas_bottom).offset(0);
        make.bottom.offset(0);
    }];
    
    //赋值为全局的
    _topView = topView;
    _leftView = leftView;
    _nameLabel = nameLabel;
    _midImageView = midImageView;
    
}

#pragma mark - 3.collectionView的数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 3;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ChanBottomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID_collection_view forIndexPath:indexPath];
    cell.model = self.modelArr[indexPath.item];
    
    
    return cell;
}

#pragma mark - 4.重写tableViewCell模型属性的setter方法
- (void)setModel:(MarketModel *)model
{
    
    // 模型对象赋值给属性
    _model = model;
    
    BaseHomeModel *top = model.topTitleModel;
//    NSLog(@"");
    // 模型对象的属性值，赋值给全局属性
    [self.midImageView sd_setImageWithURL:[NSURL URLWithString:top.img]];
    self.leftView.backgroundColor = [UIColor cz_randomColor];
    self.nameLabel.text = top.name;
    self.nameLabel.textColor = self.leftView.backgroundColor;
    self.modelArr = model.goods;
    [self.collectionView reloadData];
    
}

#pragma mark - 交互

// 更多按钮-->跳转到闪送超市
- (void)moreButtonClickJumpToSpeedSupermarket {
    
    if ([self.delegate respondsToSelector:@selector(chanBottomTableViewCell:andMoreButton:)]) {
        
        [self.delegate chanBottomTableViewCell:self andMoreButton:self.moreButton];
    }
}

// 中间长图-->跳转到分类的商品列表
- (void)midImageViewClickJumpToCategoryGoodsList {
    
    if ([self.delegate respondsToSelector:@selector(chanBottomTableViewCell:andMidImageView:)]) {
        
        [self.delegate chanBottomTableViewCell:self andMidImageView:self.midImageView];
    }
    
}

   
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
