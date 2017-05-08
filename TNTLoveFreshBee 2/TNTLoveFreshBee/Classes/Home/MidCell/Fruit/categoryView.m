//
//  categoryView.m
//  自定义cell
//
//  Created by Steve on 2016/10/12.
//  Copyright © 2016年 Steve. All rights reserved.
//

#import "categoryView.h"
#import "Masonry.h"



@implementation categoryView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    
    return self;
}

#pragma mark - 设置界面
-(void)setupUI{
    
    
    NSMutableArray *categViewArrM = [NSMutableArray array];
    
    NSMutableArray<UILabel *> *labelArr = [NSMutableArray array];
    NSMutableArray<UIImageView *> *buttonArr = [NSMutableArray array];
    for (NSInteger i = 0; i < 4; i++) {
        UIView *categView = [[UIView alloc] init];
        categView.tag = i + 3;
 
    //上部的图片
    UIImageView *btnImageView = [[UIImageView alloc] init];
        btnImageView.image = [UIImage imageNamed:@"bestchoicefruit"];
        btnImageView.contentMode = UIViewContentModeScaleAspectFit;
    [categView addSubview:btnImageView];
    
    [btnImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(0);
        make.left.offset(8);
        make.right.offset(-8);
        make.height.mas_equalTo(55);
    }];
    
    //下部的lable
    UILabel *categoryLable = [[UILabel alloc] init];
    categoryLable.text = @"酒水饮料";
    categoryLable.textAlignment = NSTextAlignmentCenter;
    categoryLable.font = [UIFont systemFontOfSize:13];
    
    [categView addSubview:categoryLable];
    
    [categoryLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.offset(3);
        make.bottom.offset(0);
    }];
        
        
        //categView添加点击手势
        categView.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapGestureRecognizer =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonClick:)];
        [categView addGestureRecognizer:tapGestureRecognizer];
        
        [self addSubview:categView];
        [categViewArrM addObject:categView];
        [labelArr addObject:categoryLable];
        [buttonArr addObject:btnImageView];
        
    }
    UILabel *label1 = labelArr[0];
    UILabel *label2 = labelArr[1];
    UILabel *label3 = labelArr[2];
    UILabel *label4 = labelArr[3];
    label1.text = @"优选水果";
    label2.text = @"牛奶面包";
    label3.text = @"酒水饮料";
    label4.text = @"更多";
    
    UIImageView *image1 = buttonArr[0];
    image1.image = [UIImage imageNamed:@"youxuanshuiguo"];
    UIImageView *image2 = buttonArr[1];
    image2.image = [UIImage imageNamed:@"niunaimianbao"];
    UIImageView *image3 = buttonArr[2];
    image3.image = [UIImage imageNamed:@"yinliaojiushui"];
    UIImageView *image4 = buttonArr[3];
    image4.image = [UIImage imageNamed:@"gengduo"];
    
        
        [categViewArrM mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:10 tailSpacing:10];
        [categViewArrM mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(70);
            make.top.offset(0);
        }];

   
}


-(void)setViewDataArr:(NSArray *)viewDataArr{
    
    _viewDataArr = viewDataArr;
    
}


#pragma mark - 点击的方法

- (void)buttonClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(categoryView:viewTag:)]) {
        [self.delegate categoryView:self viewTag:sender.tag];
    }
    
    
}




@end
