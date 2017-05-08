//
//  freshhomeCell.m
//  自定义cell
//
//  Created by Steve on 2016/10/13.
//  Copyright © 2016年 Steve. All rights reserved.
//

#import "freshhomeCell.h"
#import "Masonry.h"
#import "ChanBottomCollectionViewCell.h"
#import "UIColor+Addition.h"
#import "MarketModel.h"
#import "BaseHomeModel.h"
#import "DetailHomeModel.h"

#define PICTURE_H 80
#define LINE_H 150

@interface freshhomeCell ()

@property (nonatomic , weak) UIImageView *leftImageView;
@property (nonatomic , weak) UIImageView *rightImageView;
@property (nonatomic , weak) UIImageView *moreGoodsImageView;
@property (nonatomic, weak) UIImageView *topImageView;
@property (nonatomic, weak) ChanBottomCollectionViewCell *leftView;
@property (nonatomic, weak) ChanBottomCollectionViewCell *middleView;


@end
@implementation freshhomeCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        //添加cell里面的子控件
        [self setupUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //清空背景颜色
        //        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
    
}

#pragma mark - 设置界面
-(void)setupUI{
#pragma mark - 1.顶部的图片
    UIImageView *topImageView = [[UIImageView alloc] init];
    self.topImageView = topImageView;
    topImageView.image = [UIImage imageNamed:@"freshhome"];
    [self.contentView addSubview:topImageView];
    
    [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.offset(0);
        make.height.equalTo(@58);
    }];
    
    
#pragma mark - 2.中间图片
    CGFloat margin = 8;
    
    CGFloat height1 = PICTURE_H - 7;
    
    //左图
    UIImageView *leftImageView = [[UIImageView alloc] init];
    
    leftImageView.image = [UIImage imageNamed:@"recommended"];
    [self addSubview:leftImageView];
    
    [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(topImageView.mas_bottom);
        make.left.equalTo(self.mas_left).offset(margin);
        make.height.offset(height1);
    }];
    
    //右图
    UIImageView *rightImageView = [[UIImageView alloc] init];
    rightImageView.image = [UIImage imageNamed:@"recommended"];
    [self addSubview:rightImageView];
    
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(topImageView.mas_bottom);
        make.right.offset(-margin);
        make.height.offset(height1);
        make.left.equalTo(leftImageView.mas_right).offset(margin);
        make.width.equalTo(leftImageView.mas_width);
    }];
    
#pragma mark - 3.下面的两个小view和imageView
    
    //左边的View
    ChanBottomCollectionViewCell *leftView = [[ChanBottomCollectionViewCell alloc] init];
    
    [self addSubview:leftView];
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.offset(0);
        make.top.equalTo(leftImageView.mas_bottom);
        make.height.mas_equalTo(LINE_H);
    }];
    
    
    //分割线1
    UIView *separateViewV1 = [[UIView alloc] init];
    separateViewV1.backgroundColor = [UIColor colorWithHex:0XECECEC];
    [self addSubview:separateViewV1];
    
    [separateViewV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(leftView.mas_right);
        make.top.equalTo(leftImageView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(1, LINE_H));
    }];
    
    
    //中间的View
    ChanBottomCollectionViewCell *middleView = [[ChanBottomCollectionViewCell alloc] init];
    
    [self addSubview:middleView];
    
    [middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(separateViewV1.mas_right);
        make.top.equalTo(leftImageView.mas_bottom);
        make.height.mas_equalTo(LINE_H);
        make.width.equalTo(leftView.mas_width);
    }];
    
    
    //分割线2
    UIView *separateViewV2 = [[UIView alloc] init];
    separateViewV2.backgroundColor = [UIColor colorWithHex:0XECECEC];
    [self addSubview:separateViewV2];
    
    [separateViewV2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(middleView.mas_right);
        make.top.equalTo(rightImageView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(1, LINE_H));
    }];
    
    
    //右边的imageView
    UIImageView *moreGoodsImageView = [[UIImageView alloc] init];
    moreGoodsImageView.image = [UIImage imageNamed:@"moregoods"];
    [self addSubview:moreGoodsImageView];
    
    [moreGoodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(rightImageView.mas_bottom);
        make.left.equalTo(separateViewV2.mas_right).offset(10);
        make.right.offset(-8);
        make.height.mas_equalTo(LINE_H + 10);
//        make.width.equalTo(middleView.mas_width);
    }];
    
    
    self.leftImageView = leftImageView;
    self.rightImageView = rightImageView;
    self.moreGoodsImageView = moreGoodsImageView;
    self.leftView = leftView;
    self.middleView = middleView;
}


//重写模型的set方法给属性赋值
-(void)setModel:(MarketModel *)model{
    
    _model = model;
    NSArray *arr2 = model.midPictureModel;
    BaseHomeModel *pc1 = arr2[0];
    BaseHomeModel *pc2 = arr2[1];
    BaseHomeModel *titl = model.topTitleModel;
    NSArray *arr4 = model.bottomModel;
    DetailHomeModel *goods3 = arr4[2];
    DetailHomeModel *goods1 = arr4[0];
    DetailHomeModel *goods2 = arr4[1];
    
    [self.topImageView sd_setImageWithURL:[NSURL URLWithString:titl.img] placeholderImage:[UIImage imageNamed:@"store1hour"]];
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:pc1.img]placeholderImage:[UIImage imageNamed:@"todaymust"]];
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:pc2.img] placeholderImage:[UIImage imageNamed:@"todaymust"]];
    
    self.leftView.model = goods1;
    self.middleView.model = goods2;
    [self.moreGoodsImageView sd_setImageWithURL:[NSURL URLWithString:goods3.img]];
    
    
}




@end
