//
//  storeCell.m
//  自定义cell
//
//  Created by Steve on 2016/10/12.
//  Copyright © 2016年 Steve. All rights reserved.
//

#import "storeCell.h"
#import "Masonry.h"
#import "categoryView.h"
#import "MarketModel.h"
#import "BaseHomeModel.h"
#import "DetailHomeModel.h"
#import "UIColor+Addition.h"


#define PICTURE_H 80

@interface storeCell ()

@property (nonatomic , weak) UIImageView *topImageView;
@property (nonatomic , weak) UIImageView *leftImageView1;
@property (nonatomic , weak) UIImageView *rightImageView1;
@property (nonatomic , weak) UIImageView *leftImageView2;
@property (nonatomic , weak) UIImageView *rightImageView2;
@property (nonatomic , weak) categoryView *categoView;

@end

@implementation storeCell




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

-(void)setupUI{
#pragma mark - 1.顶部的图片
    UIImageView *topImageView = [[UIImageView alloc] init];
    topImageView.image = [UIImage imageNamed:@"store1hour"];
    [self.contentView addSubview:topImageView];
    
    [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.offset(0);
        make.height.equalTo(@58);
    }];
    
    
#pragma mark - 2.中间图片
    CGFloat margin = 8;

    CGFloat height1 = PICTURE_H - 7;
    
    //左图
    UIImageView *leftImageView1 = [[UIImageView alloc] init];
    leftImageView1.image = [UIImage imageNamed:@"todaymust"];
    
    [self addSubview:leftImageView1];
    
    //leftImageView1添加点击手势
    leftImageView1.userInteractionEnabled=YES;
    leftImageView1.tag = 1;
    UITapGestureRecognizer *tapGestureRecognizer1 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonClick:)];
    [leftImageView1 addGestureRecognizer:tapGestureRecognizer1];
    
    //约束
    [leftImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(topImageView.mas_bottom);
        make.left.equalTo(self.mas_left).offset(margin);
        make.height.offset(height1);
    }];
    
   //右图
    UIImageView *rightImageView1 = [[UIImageView alloc] init];
    rightImageView1.image = [UIImage imageNamed:@"todaymust"];
    [self addSubview:rightImageView1];
    
    //rightImageView1添加点击手势
    rightImageView1.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGestureRecognizer2 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonClick:)];
    [rightImageView1 addGestureRecognizer:tapGestureRecognizer2];
    
    [rightImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(topImageView.mas_bottom);
        make.right.offset(-margin);
        make.height.offset(height1);
        make.left.equalTo(leftImageView1.mas_right).offset(margin);
        make.width.equalTo(leftImageView1.mas_width);
    }];
 
    
#pragma mark - 3.下面四个分类按钮
    
    categoryView *categoView = [[categoryView alloc] init];
    
    [self addSubview:categoView];
    
    [categoView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.offset(0);
        make.top.equalTo(leftImageView1.mas_bottom);
        make.height.mas_equalTo(80);
        
    }];
    
    
    //分割线
    UIView *separateViewH = [[UIView alloc] init];
    separateViewH.backgroundColor = [UIColor colorWithHex:0XECECEC];
    [self addSubview:separateViewH];
    
    //约束
    [separateViewH mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.offset(0);
        make.top.equalTo(categoView.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    
#pragma mark - 4.最下面的两张图片
    
    
    CGFloat height2 = PICTURE_H;
    
    //左图
    UIImageView *leftImageView2 = [[UIImageView alloc] init];
    leftImageView2.image = [UIImage imageNamed:@"duck"];
    
    [self.contentView addSubview:leftImageView2];
    
    [leftImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(separateViewH.mas_bottom);
        make.left.offset(0);
        make.height.offset(height2);
    }];
    
    //分割线
    UIView *separateViewV = [[UIView alloc] init];
    separateViewV.backgroundColor = [UIColor colorWithHex:0XECECEC];
    [self addSubview:separateViewV];
    
    //约束
    [separateViewV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(leftImageView2.mas_right);
        make.top.equalTo(separateViewH.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(1, PICTURE_H));
    }];
    
    //右图
    UIImageView *rightImageView2 = [[UIImageView alloc] init];
    rightImageView2.image = [UIImage imageNamed:@"duck"];
    
    [self.contentView addSubview:rightImageView2];
    
    [rightImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(separateViewH.mas_bottom);
        make.right.offset(0);
        make.height.offset(height2);
        make.left.equalTo(leftImageView2.mas_right).offset(1);
        make.width.equalTo(leftImageView2.mas_width);
    }];
    
    self.topImageView = topImageView;
    self.leftImageView1 = leftImageView1;
    self.rightImageView1 = rightImageView1;
    self.leftImageView2 = leftImageView2;
    self.rightImageView2 = rightImageView2;
    self.categoView = categoView;
    
}

#pragma mark - 点击的方法

- (void)buttonClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(storeCell:buttonTag:)]) {
        [self.delegate storeCell:self buttonTag:sender.tag];
    }
    
    
}

//重写模型的set方法给属性赋值
-(void)setModel:(MarketModel *)model
{
    _model = model;
    
    NSArray *arr2 = model.midPictureModel;
    BaseHomeModel *pc1 = arr2[0];
    BaseHomeModel *pc2 = arr2[1];
    BaseHomeModel *titl = model.topTitleModel;
    NSArray *arr3 = model.bottomModel;
//    NSArray *arr4 = model.goods;
    BaseHomeModel *gods1 = arr3[0];
    BaseHomeModel *gods2 = arr3[1];
    
    [self.topImageView sd_setImageWithURL:[NSURL URLWithString:titl.img]];
    [self.leftImageView1 sd_setImageWithURL:[NSURL URLWithString:pc1.img]];
    [self.rightImageView1 sd_setImageWithURL:[NSURL URLWithString:pc2.img]];
    [self.leftImageView2 sd_setImageWithURL:[NSURL URLWithString:gods1.img]];
    [self.rightImageView2 sd_setImageWithURL:[NSURL URLWithString:gods2.img]];

}








@end
