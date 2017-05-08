//
//  FreshViewCell.m
//  TNTLoveFreshBee
//
//  Created by 李丹 on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "FreshViewCell.h"
#import "CZAdditions.h"
#import "Masonry.h"
#import "DetailHomeModel.h"
#import "DetailHomeModel.h"
@interface FreshViewCell ()

@property (nonatomic, weak) UIImageView *goodsImage;
@property (nonatomic, weak) UILabel *descLabel;
@property (nonatomic, weak) UILabel *discountLabel;
@property (nonatomic, weak) UILabel *moneyLabel;

@end

@implementation FreshViewCell

// 如果homeTopView是通过xib或sb创建此就会调用此方法
- (void)awakeFromNib {
    [self setupUI];
}

// 如果homeTopView是通过代码来创建就会调用此方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


// 设置界面
- (void)setupUI
{
    
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
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goodsMessageBtn)];
//    [goodsImage addGestureRecognizer:tap];
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
    
    self.goodsImage = goodsImage;
    self.descLabel = descLabel;
    self.moneyLabel = moneyLabel;
    self.discountLabel = discountLabel;
}

-(void)setModel:(DetailHomeModel *)model
{
    _model = model;
    
    [self.goodsImage sd_setImageWithURL:[NSURL URLWithString:model.img]];
    self.descLabel.text = model.long_name;
    self.moneyLabel.text = model.market_price.description;
    self.discountLabel.text = model.partner_price.description;
    
}


@end
