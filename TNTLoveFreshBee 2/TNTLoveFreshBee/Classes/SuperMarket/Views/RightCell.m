//
//  RightCell.m
//  //
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 吕文苑. All rights reserved.
//

#import "RightCell.h"
#import "BuyView.h"
#import "AXFTabbarController.h"

@interface RightCell()
// 添加商品动画也用词图片
@property (nonatomic, strong) UIImageView *goodsIcon;
@property (nonatomic, strong) UILabel *refinedLabel;
@property (nonatomic, strong) UILabel *goodsName;
@property (nonatomic, strong) UILabel *heftLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *discountLabel;
// 超市商品相关操作
@property (nonatomic, strong) BuyView *buyView;

@end

@implementation RightCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    _goodsIcon = [[UIImageView alloc]init];
    _refinedLabel = [[UILabel alloc]init];
    _refinedLabel.font = [UIFont systemFontOfSize:11];
    _refinedLabel.layer.borderWidth = 1;
    _refinedLabel.layer.borderColor = [UIColor redColor].CGColor;
    _refinedLabel.layer.cornerRadius = 3;
    _refinedLabel.layer.masksToBounds = YES;
    _refinedLabel.textAlignment = NSTextAlignmentCenter;
    _refinedLabel.textColor = [UIColor redColor];
    _refinedLabel.text = @"精选";
    _refinedLabel.hidden = YES;
    
    _goodsName = [[UILabel alloc]init];
    _goodsName.font = [UIFont systemFontOfSize:13];
    _goodsName.textAlignment = NSTextAlignmentLeft;
    
    _heftLabel = [[UILabel alloc]init];
    _heftLabel.font = [UIFont systemFontOfSize:10];
    _heftLabel.textAlignment = NSTextAlignmentLeft;
    
    _priceLabel = [[UILabel alloc]init];
    _priceLabel.font = [UIFont systemFontOfSize:13];
    _priceLabel.textAlignment = NSTextAlignmentLeft;
    _priceLabel.textColor = [UIColor redColor];
    _buyView = [[BuyView alloc]init];
    
    [self addSubview:_goodsIcon];
    [self addSubview:_refinedLabel];
    [self addSubview:_goodsName];
    [self addSubview:_heftLabel];
    [self addSubview:_priceLabel];
    [self addSubview:_buyView];
    
    CGFloat height = 15;
    // 商品图片
    [_goodsIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(70);
        make.leading.equalTo(self).offset(10);
        make.centerY.equalTo(self);
    }];
    
    // 精选商品
    [_refinedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(height);
        make.leading.equalTo(_goodsIcon.mas_trailing);
        make.top.equalTo(_goodsIcon);
    }];
    
    // 商品名称
    [_goodsName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_refinedLabel.mas_trailing);
        make.top.equalTo(_goodsIcon);
        make.height.mas_offset(height);
        make.trailing.equalTo(self);
    }];
    
    // 商品价格
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_goodsIcon.mas_trailing);
        make.bottom.equalTo(_goodsIcon.mas_bottom);
        make.height.mas_offset(height);
        make.width.mas_offset(50);
    }];
    
    // 商品参数（粒/盒）
    [_heftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_goodsIcon.mas_trailing);
        make.bottom.equalTo(_priceLabel.mas_top).offset(-5);
        make.height.mas_equalTo(height);
        make.width.mas_equalTo(90);
    }];
    
    // 购物车
    [_buyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-2);
        make.trailing.equalTo(self).offset(-2);
        make.width.mas_equalTo(65);
        make.height.mas_equalTo(25);
    }];
    
    void(^animationBLock)(CGPoint point) = ^(CGPoint point)
    {
        self.WillStartAnimation(point);
    };
    
//    BuyView *addView = [[BuyView alloc]init];
    _buyView.cellBlock = animationBLock;
    
    
//    [self.contentView addSubview:addView];
//    
//    [addView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(87, 27));
//        make.bottom.equalTo(_priceLabel);
//        make.right.equalTo(self.contentView.mas_right);
//    }];
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.equalTo(self);
//        // 下面这个commentBtn 在别的项目换成当前cell最顶部的控件即可
//        make.bottom.equalTo(_priceLabel.mas_bottom).offset(10);
//        make.width.equalTo(self.mas_width);
//    }];

}

- (void)setGoods:(Goods *)goods{
    _goods = goods;
    if (self.goods.is_xf) {
        _refinedLabel.hidden = NO;
    }else{
        _refinedLabel.hidden = YES;
        [_goodsName mas_updateConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_goodsIcon.mas_trailing);
        }];
    }
    _buyView.goods = goods;
    _heftLabel.text = goods.specifics;
    _priceLabel.text = [NSString stringWithFormat:@"￥%@",goods.price];
    [_goodsIcon sd_setImageWithURL:[NSURL URLWithString:goods.img] placeholderImage:[UIImage imageNamed:@"v2_placeholder_half_size"]];
    _goodsName.text = goods.name;
}

-(void)setHighlighted:(BOOL)highlighted{
    
}

@end
