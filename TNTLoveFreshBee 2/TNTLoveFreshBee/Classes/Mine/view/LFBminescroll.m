//
//  LFBminescroll.m
//  TNTLoveFreshBee
//
//  Created by Book on 16/10/12.
//  Copyright © 2016年 LiDan. All rights reserved.
//

#import "LFBminescroll.h"
#import "LFBMineModel.h"
#import "oneView.h"
#import "twoView.h"
#import "LFBMView.h"
#define onehigh 140
#define twehigh 180
@interface LFBminescroll ()
@property(nonatomic,strong)NSArray *arrMine;
@property(nonatomic,weak)UIView *one;
@property(nonatomic,weak)UIView *two;
@property(nonatomic,weak)UIView *three;
@end


@implementation LFBminescroll
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.contentInset = UIEdgeInsetsMake(10, 0, -33, 0);
//        [self loadData];
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    
    
//定义scrollView上里的三个试图
    UIView *one = [[UIView alloc]init];
    one.frame = CGRectMake(0, 0, self.bounds.size.width, onehigh);
    one.userInteractionEnabled = YES;
    
    UIView *two = [[UIView alloc]init];
    two.frame = CGRectMake(0, onehigh+10 , self.bounds.size.width, onehigh);
    UIView *three = [[UIView alloc]init];
    [self addSubview:one];
    [self addSubview:two];
    [self addSubview:three];
    
    three.frame = CGRectMake(0, 2*(onehigh+10) , self.bounds.size.width, twehigh);
    three.backgroundColor = [UIColor yellowColor];
    

    self.contentSize = CGSizeMake(self.bounds.size.width,self.bounds.size.height);
//复制个全局属性
    _one = one;
    _two = two;
    _three = three;

    
}

//给三个试图添加view
-(void)setOrderMens:(NSArray *)orderMens{

    _orderMens = orderMens;
    oneView *one = [[oneView alloc]init];
    [_one addSubview:one];
    [one mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(_one);
        make.height.mas_equalTo(40);
    }];
    
 
        LFBMView *orderMenuView = [[LFBMView alloc]initMenu:self.orderMens WithLine:YES andWith:4];
    [one addSubview:orderMenuView];
    [orderMenuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(one).offset(41);
        make.left.right.equalTo(_one);
        make.bottom.equalTo(_one.mas_bottom);
    }];

}
-(void)setMineMenus:(NSArray *)mineMenus{

    _mineMenus = mineMenus;
    twoView *two = [[twoView alloc]init];
        [_two addSubview:two];
        [two mas_makeConstraints:^(MASConstraintMaker *make) {
    
            make.top.left.right.equalTo(_two);
            make.height.mas_equalTo(40);
        }];
    
    
   LFBMView *mineMenusq = [[LFBMView alloc]initMenu:self.mineMenus WithLine:NO andWith:3];

    [_two addSubview:mineMenusq];
    [mineMenusq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_two).offset(41);
        make.left.right.equalTo(_two);
        make.bottom.equalTo(_two.mas_bottom);
    }];

}
-(void)setTileMenus:(NSArray *)tileMenus{

    _tileMenus = tileMenus;
    
    LFBMView *tileMenusq = [[LFBMView alloc]initMenu:self.tileMenus WithLine:YES andWith:5];
    [_three addSubview:tileMenusq];
    [tileMenusq mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(_three);
        
    }];
    

}



@end
