//
//  LFBFrashCollectionViewCell.m
//  新鲜预订测试版
//
//  Created by 王朝阳 on 2016/10/12.
//  Copyright © 2016年 wangzhaoyang. All rights reserved.
//

#import "LFBFrashCollectionViewCell.h"
#import "CZAdditions.h"
#import "DetailHomeModel.h"

@interface LFBFrashCollectionViewCell ()
//图片
@property (nonatomic, weak) UIImageView *goodsImage;
//商品信息
@property (nonatomic, weak) UILabel *descLabel;
//现价
@property (nonatomic, weak) UILabel *discountLabel;
//原价
@property (nonatomic, weak) UILabel *moneyLabel;

@end
@implementation LFBFrashCollectionViewCell


//重写此方法
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
#pragma mark - 监听点击事件
- (void)buyClickBtn {
//    NSLog(@"购买");
}
- (void)goodsMessageBtn {
//    NSLog(@"大虾");
}
#pragma mark - 创建控件
- (void)setupUI {
    
    self.backgroundColor = [UIColor clearColor];
    
    //创建商品图片
    UIImageView *goodsImage = [[UIImageView alloc] init];
    
    goodsImage.image = [UIImage imageNamed:@"20160223184127_878475.jpg@500w_500h_90Q"];
    goodsImage.userInteractionEnabled = YES;
    [self.contentView addSubview:goodsImage];
    
    [goodsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX).offset(0);
        make.top.offset(8);
        make.right.offset(-10);
        make.left.offset(10);
        make.bottom.offset(-80);
    }];
    //点按手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goodsMessageBtn)];
    [goodsImage addGestureRecognizer:tap];
    //描述信息
    UILabel *descLabel = [UILabel cz_labelWithText:@"美国进口红提1kg/盒" fontSize:13 color:[UIColor blackColor]];
    descLabel.numberOfLines = 2;
    
    [self.contentView addSubview:descLabel];
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(goodsImage.mas_bottom);
        make.left.offset(8);
        make.right.offset(-8);
    }];
    
    
    //现价
    UILabel *discountLabel = [UILabel cz_labelWithText:@"¥56" fontSize:13 color:[UIColor redColor]];
    [self.contentView addSubview:discountLabel];
    [discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(descLabel.mas_left);
        make.bottom.offset(-10);
    }];
    
    //原价
    UILabel *moneyLabel = [UILabel cz_labelWithText:@"¥80" fontSize:11 color:[UIColor lightGrayColor]];
    [self.contentView addSubview:moneyLabel];
    [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(discountLabel.mas_right);
        make.centerY.equalTo(discountLabel.mas_centerY);
    }];
    
    //购买按钮
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
//    [btn setBackgroundColor:[UIColor redColor]];
    [self.contentView addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(discountLabel.mas_bottom);
        make.right.equalTo(descLabel.mas_right);
    }];
    [btn addTarget:self action:@selector(buyClickBtn) forControlEvents:UIControlEventTouchUpInside];
    //MARK: 赋值
    self.goodsImage = goodsImage;
    self.descLabel = descLabel;
    self.discountLabel = discountLabel;
    self.moneyLabel = moneyLabel;
    
}
- (void)setModel:(DetailHomeModel *)model {
    _model = model;
    [self.goodsImage sd_setImageWithURL:[NSURL URLWithString:model.img]];
    self.descLabel.text = model.long_name;
    self.discountLabel.text = model.market_price.description;
    self.moneyLabel.text = model.partner_price.description;
    
//    /// 顶部banner模型
//    @property (nonatomic, strong) BaseHomeModel *more_activity;
//    /// 顶部banner图片上商品信息模型
//    @property (nonatomic, strong) DetailHomeModel *goods;
//    /// 每个Cell中商品模型
//    @property (nonatomic, strong) ActivModel *category_detail;
}
@end
