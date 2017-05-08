//
//  CahnBottomCollectionViewCell.m
//  爱鲜蜂首页下部模块
//
//  Created by 张木锋 on 2016/10/11.
//  Copyright © 2016年 ZMF. All rights reserved.
//

#import "ChanBottomCollectionViewCell.h"
#import "ChanBottomCollectionFlowLayout.h"
#import "DetailHomeModel.h"
#import "Masonry.h"

@interface ChanBottomCollectionViewCell ()
// 1.图片imageView
@property(nonatomic,weak) UIImageView *mainIamgeView;
// 2.名称label
@property(nonatomic,weak) UILabel *nameLabel;
// 3.精选图标图片
@property(nonatomic,weak) UIImageView *selectView;
// 4.重量label
@property(nonatomic,weak) UILabel *weightLabel;
// 5.价格label
@property(nonatomic,weak) UILabel *priceLabel;
// 6.原价label
@property(nonatomic,weak) UILabel *originPriceLabel;
// 7.添加按钮buttom
@property(nonatomic,weak) UIButton *addButton;
@end

@implementation ChanBottomCollectionViewCell
#pragma mark - 1.重写collectionViewCell的init方法
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupCollectionViewCellUI];
    }
    return self;
}
#pragma mark - 2.设置collectionViewCell的界面
- (void)setupCollectionViewCellUI {
    
    // 1.图片imageView
    UIImageView *mainIamgeView = [[UIImageView alloc] init];
    mainIamgeView.backgroundColor = [UIColor grayColor];
    mainIamgeView.image = [UIImage imageNamed:@"20160929153422_355743"];
    [self.contentView addSubview:mainIamgeView];
    mainIamgeView.userInteractionEnabled = YES;
    [mainIamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.equalTo(self.mas_width);
    }];
    
    
    // 添加手势
    UITapGestureRecognizer *mainImageViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mainImageViewClickJumpToSelfGoodsDetail)];
    [mainIamgeView addGestureRecognizer:mainImageViewTap];
    
    // 2.名称label
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"爱鲜蜂-澳洲甜橙";
    nameLabel.numberOfLines = 0;
    nameLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(8);
        make.width.mas_equalTo(self.contentView.bounds.size.width-2);
        make.top.equalTo(mainIamgeView.mas_bottom).offset(4);
    }];
    
    // 3.精选图标图片
    UIImageView *selectView = [[UIImageView alloc] init];
    selectView.image = [UIImage imageNamed:@"jingxuan.png"];
    [self addSubview:selectView];
    [selectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.top.equalTo(nameLabel.mas_bottom).offset(4);
        make.width.mas_equalTo(26);
        make.height.mas_equalTo(14);
    }];
    
    // 4.重量label
    UILabel *weightLabel = [[UILabel alloc] init];
    weightLabel.text = @"500-800g/袋";
    weightLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:weightLabel];
    [weightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.top.equalTo(selectView.mas_bottom).offset(4);
    }];
    
    // 5.价格label
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.text = @"¥16.9";
    priceLabel.font = [UIFont systemFontOfSize:14];
    priceLabel.textColor = [UIColor redColor];
    [self addSubview:priceLabel];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel);
        make.top.equalTo(weightLabel.mas_bottom).offset(4);
    }];
    
    // 6.原价label
    UILabel *originPriceLabel = [[UILabel alloc] init];
    originPriceLabel.text = @"¥30";
    originPriceLabel.font = [UIFont systemFontOfSize:12];
    originPriceLabel.textColor = [UIColor grayColor];
    [self addSubview:originPriceLabel];
    [originPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(priceLabel.mas_right).offset(4);
        make.centerY.equalTo(priceLabel);
    }];
    
    // 7.添加按钮buttom
    UIButton *addButton = [[UIButton alloc] init];
    [addButton setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
    [self addSubview:addButton];
    
    [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(priceLabel);
        make.right.offset(-8);
        make.width.height.mas_equalTo(20);
    }];
    
    // 添加手势
    UITapGestureRecognizer *addButtonTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addGoodsButtonClickAddGoodsIntoShopcar)];
    [addButton addGestureRecognizer:addButtonTap];
    
    // 8.创建分割线
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(mainIamgeView.mas_right).offset(0);
        make.top.offset(8);
        make.bottom.offset(-8);
        make.width.mas_equalTo(1);
    }];
    
    _mainIamgeView = mainIamgeView;
    _nameLabel = nameLabel;
    _selectView = selectView;
    _weightLabel = weightLabel;
    _priceLabel = priceLabel;
    _originPriceLabel= originPriceLabel;
    _addButton = addButton;
}

#pragma mark - 交互

// 商品方图-->跳转到本商品的详情
- (void)mainImageViewClickJumpToSelfGoodsDetail {
    
//    NSLog(@"点击跳转到本商品的详情!");
    
    // 发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"mainImageView" object:self userInfo:nil];

}
// 添加按钮-->把商品添加到购物车
- (void)addGoodsButtonClickAddGoodsIntoShopcar {
    
//    NSLog(@"点击把商品添加到购物车!");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addButton" object:self userInfo:nil];

}

#pragma mark - 3.重写collectionViewCell的模型setter方法

-(void)setModel:(DetailHomeModel *)model
{
    _model = model;
    [self.mainIamgeView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    self.nameLabel.text = model.long_name;
    self.weightLabel.text = model.specifics;
    self.priceLabel.text = model.market_price.description;
    self.originPriceLabel .text = model.partner_price.description;
}

@end
