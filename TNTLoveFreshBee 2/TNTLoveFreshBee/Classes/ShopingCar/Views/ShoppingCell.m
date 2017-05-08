//
//  ShoppingCell.m
//  TNTLoveFreshBee
//
//  Created by apple on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "ShoppingCell.h"
#import <UIButton+WebCache.h>
#import "UserShopCarTool.h"
#import "BuyView.h"

@interface ShoppingCell ()
// 选中商品的按钮点击
@property (nonatomic, strong) UIButton *selectedBtn;
// 选中商品的图片
@property (nonatomic, strong) UIImageView *shoppingIcon;
// 添加“精选”副标题文字（筛选）
@property (nonatomic, strong) UILabel *siftLabel;
// 商品的名称
@property (nonatomic, strong) UILabel *shoppingName;
// 商品的价格
@property (nonatomic, strong) UILabel *moneyLabel;
// 选中商品的增减（加号/减号）
@property (nonatomic, strong) BuyView *buyView;
@end

@implementation ShoppingCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _selectedBtn = [[UIButton alloc]init];
        _selectedBtn.selected = YES;
        [_selectedBtn setImage:[UIImage imageNamed:@"v2_noselected"] forState:UIControlStateNormal];
        [_selectedBtn setImage:[UIImage imageNamed:@"v2_selected"] forState:UIControlStateSelected];
        [_selectedBtn addTarget:self action:@selector(shoppingSelectedClick:) forControlEvents:UIControlEventTouchUpInside];
        
        _shoppingIcon = [[UIImageView alloc]init];
        _siftLabel = [[UILabel alloc]init];
        _siftLabel = [[UILabel alloc]init];
        _siftLabel.font = [UIFont systemFontOfSize:11];
        _siftLabel.layer.borderWidth = 1;
        _siftLabel.layer.borderColor = [UIColor redColor].CGColor;
        _siftLabel.layer.cornerRadius = 3;
        _siftLabel.layer.masksToBounds = YES;
        _siftLabel.textAlignment = NSTextAlignmentCenter;
        _siftLabel.textColor = [UIColor redColor];
        _siftLabel.text = @"精选";
        _siftLabel.hidden = YES;
        
        _shoppingName = [[UILabel alloc]init];
        _shoppingName.font = [UIFont systemFontOfSize:15];
        _shoppingName.textAlignment = NSTextAlignmentLeft;
        
        _moneyLabel = [[UILabel alloc]init];
        _moneyLabel.font = [UIFont systemFontOfSize:15];
        _moneyLabel.textAlignment = NSTextAlignmentLeft;
        _moneyLabel.textColor = [UIColor redColor];
        
        _buyView = [[BuyView alloc]init];
        
        [self addSubview:_selectedBtn];
        [self addSubview:_shoppingIcon];
        [self addSubview:_siftLabel];
        [self addSubview:_shoppingName];
        [self addSubview:_moneyLabel];
        [self addSubview:_buyView];
        
        // 购物车选中按钮大小设置"勾选"
        [_selectedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(15);
            make.leading.equalTo(self).offset(10);
            make.centerY.equalTo(self);
        }];
        [_shoppingIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(50);
            make.leading.equalTo(_selectedBtn.mas_trailing).offset(5);
            make.centerY.equalTo(self);
        }];
        
        // 购物车添加商品后“精选”文字的添加
        [_siftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(15);
            make.top.equalTo(_shoppingIcon);
            make.leading.equalTo(_shoppingIcon.mas_trailing).offset(5);
        }];
        [_shoppingName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_siftLabel.mas_trailing);
            make.trailing.equalTo(self);
            make.height.mas_equalTo(15);
            make.top.equalTo(_shoppingIcon);
        }];
        [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_siftLabel);
            make.width.mas_equalTo(80);
            make.bottom.equalTo(_shoppingIcon.mas_bottom);
            make.height.mas_equalTo(15);
        }];
        
        // 购物车选中商品的“增加和减少按钮与件数的间距”
        [_buyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-2);
            make.trailing.equalTo(self).offset(-2);
            make.width.mas_equalTo(64);
            make.height.mas_equalTo(25);
        }];
    }
    return self;
}
/**
 *  判断选中勾选的按钮来确定某一个商品模型是否购买
 *
 *  @param btn 勾选按钮是否显示和隐藏
 */
- (void)shoppingSelectedClick:(UIButton *)btn{
    if (btn.selected) {
        btn.selected = NO;
        [[UserShopCarTool sharedInstance]removeFromProductShopCar:self.goods];
        // 发送 购物车增加商品数量改变的通知
        [[NSNotificationCenter defaultCenter] postNotificationName:LFBShopCarBuyNumberDidChangeNotification object:nil];
    }else{
        btn.selected = YES;
        [[UserShopCarTool sharedInstance]addSupermarkProductToShopCar:self.goods];
        // 发送 购物车减少商品数量改变的通知
        [[NSNotificationCenter defaultCenter] postNotificationName:LFBShopCarBuyNumberDidChangeNotification object:nil];
    }
    
}

- (void)setGoods:(Goods *)goods{
    _goods = goods;
    // 判断”精选“文字是否显示和隐藏
    if (self.goods.is_xf) {
        _siftLabel.hidden = NO;
    }else{
        _siftLabel.hidden = YES;
        [_shoppingName mas_updateConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_shoppingIcon.mas_trailing);
        }];
    }
    // 把所有商品模型进行关联
    _buyView.goods = goods;
    _moneyLabel.text = [NSString stringWithFormat:@"￥%@",goods.price];
    [_shoppingIcon sd_setImageWithURL:[NSURL URLWithString:goods.img]  placeholderImage:[UIImage imageNamed:@"v2_placeholder_half_size"]];
    _shoppingName.text = goods.name;
}


@end
